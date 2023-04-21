local methods = require("definition-or-references.methods_state")
local utils = require("definition-or-references.utils")
local log = require("definition-or-references.util.debug")
local config = require("definition-or-references.config")

local function handle_references_response(context)
  log.trace("handle_references_response", "handle_references_response")
  local result_entries = methods.references.result

  methods.clear_references()

  if not result_entries or vim.tbl_isempty(result_entries) then
    vim.notify("No references found")
    return
  end

  if #result_entries == 1 then
    vim.notify("Only one reference found")
    utils.open_result_in_current_window(result_entries[1])
    return
  end

  local on_references_result = config.get_config().on_references_result

  if on_references_result then
    return on_references_result(result_entries)
  end

  vim.lsp.handlers["textDocument/references"](nil, result_entries, context)
end

local function send_references_request()
  log.trace("send_references_request", "Starting references request")
  _, methods.references.cancel_function = vim.lsp.buf_request(
    0,
    methods.references.name,
    utils.make_params(),
    function(err, result, context, _)
      log.trace("send_references_request", "Starting references request handling")
      -- sometimes when cancel function was called after request has been fulfilled this would be called
      -- if cancel_function is nil that means that references was cancelled
      if methods.references.cancel_function == nil then
        return
      end

      methods.references.is_pending = false

      if err then
        vim.notify(err.message, vim.log.levels.ERROR)
        return
      end

      methods.references.result = result

      if not methods.definitions.is_pending then
        log.trace("send_references_request", "handle_references_response")
        handle_references_response(context)
      end
    end
  )

  methods.references.is_pending = true
end

return {
  send_references_request = send_references_request,
  handle_references_response = handle_references_response,
}
