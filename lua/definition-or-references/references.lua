local methods = require("definition-or-references.methods_state")
local utils = require("definition-or-references.utils")
local log = require("definition-or-references.util.debug")
local config = require("definition-or-references.config")

local function exclude_same_line_entries(result)
  local current_file_uri = vim.uri_from_bufnr(0)
  local current_line = vim.api.nvim_win_get_cursor(0)[1]

  local function is_entry_on_the_same_line(entry)
    -- if entry is on the same line
    if entry.uri == current_file_uri and entry.range.start.line == current_line - 1 then
      return false
    end
    return true
  end

  return vim.tbl_filter(is_entry_on_the_same_line, result)
end

local function handle_references_response(context)
  log.trace("handle_references_response", "handle_references_response")
  local result_entries = methods.references.result

  local filtered_entries = exclude_same_line_entries(result_entries)

  if not filtered_entries or vim.tbl_isempty(filtered_entries) then
    if methods.definitions.result and #methods.definitions.result > 0 then
      vim.notify("Cursor on definition and no references found")
    elseif not methods.definitions.result or #methods.definitions.result == 0 then
      vim.notify("No definition or references found")
    end
    return
  end

  if #filtered_entries == 1 then
    if methods.definitions.result and #methods.definitions.result > 0 then
      vim.notify("Curson on definition and only one reference found")
    elseif not methods.definitions.result or #methods.definitions.result == 0 then
      vim.notify("No definition but single reference found")
    end
    vim.lsp.util.jump_to_location(
      filtered_entries[1],
      vim.lsp.get_client_by_id(context.client_id).offset_encoding
    )
    return
  end

  local on_references_result = config.get_config().on_references_result

  if on_references_result then
    return on_references_result(result_entries)
  end

  vim.lsp.handlers[methods.references.name](nil, result_entries, context)
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
