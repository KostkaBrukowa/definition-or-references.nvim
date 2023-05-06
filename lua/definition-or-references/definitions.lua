local log = require("definition-or-references.util.debug")
local methods = require("definition-or-references.methods_state")
local util = require("definition-or-references.utils")
local references = require("definition-or-references.references")

local function definitions()
  local current_cursor = vim.api.nvim_win_get_cursor(0)
  local current_bufnr = vim.fn.bufnr("%")

  log.trace("definitions", "Starting definitions request")
  _, methods.definitions.cancel_function = vim.lsp.buf_request(
    0,
    methods.definitions.name,
    util.make_params(),
    function(err, result, context, _)
      log.trace("definitions", "Starting definitions request handling")
      methods.definitions.is_pending = false

      if err then
        vim.notify(err.message, vim.log.levels.ERROR)
        return
      end

      methods.definitions.result = result

      -- I assume that the we care about only one (first) definition
      if result and #result > 0 then
        local first_definition = result[1]

        if util.cursor_not_on_result(current_bufnr, current_cursor, first_definition) then
          methods.clear_references()
          log.trace("definitions", "Current cursor not on result")
          vim.lsp.util.jump_to_location(
            first_definition,
            vim.lsp.get_client_by_id(context.client_id).offset_encoding
          )
          return
        end
      end

      -- I've found a case when there is no definition and there are references
      -- in such case fallback to references
      log.trace("definitions", "Current cursor on only definition")

      if not methods.references.is_pending then
        log.trace("definitions", "handle_references_response")
        references.handle_references_response(context)
      end
    end
  )

  methods.definitions.is_pending = true
end

return definitions
