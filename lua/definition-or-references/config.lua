local DefinitionOrReferences = {}

--- Your plugin configuration with its default values.
---
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
DefinitionOrReferences.options = {
  -- Prints useful logs about what event are triggered, and reasons actions are executed.
  debug = false,

  -- Callback that gets called just before sending first request
  before_start_callback = function() end,

  -- Callback that gets called just after opening entry and settig cursor position
  after_jump_callback = function(_) end,

  -- Callback that gets called with all of the references lsp result. You can do whatever you want
  -- with this data e.g. display it in the `telescope` window
  on_references_result = nil,
}

---@param options table Module config table. See |DefinitionOrReferences.options|.
---
---@usage `require("definition-or-references").setup()` (add `{}` with your |DefinitionOrReferences.options| table)
function DefinitionOrReferences.setup(options)
  options = options or {}

  DefinitionOrReferences.options =
    vim.tbl_deep_extend("keep", options, DefinitionOrReferences.options)

  return DefinitionOrReferences.options
end

--- @private
--- Get config value
function DefinitionOrReferences.get_config()
  return DefinitionOrReferences.options
end

return DefinitionOrReferences
