local DefinitionOrReferences = {}

--- Your plugin configuration with its default values.
---
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
DefinitionOrReferences.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

--- Define your definition-or-references setup.
---
---@param options table Module config table. See |DefinitionOrReferences.options|.
---
---@usage `require("definition-or-references").setup()` (add `{}` with your |DefinitionOrReferences.options| table)
function DefinitionOrReferences.setup(options)
    options = options or {}

    DefinitionOrReferences.options = vim.tbl_deep_extend("keep", options, DefinitionOrReferences.options)

    return DefinitionOrReferences.options
end

return DefinitionOrReferences
