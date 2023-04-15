local M = require("definition-or-references.main")
local DefinitionOrReferences = {}

-- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function DefinitionOrReferences.toggle()
    -- when the config is not set to the global object, we set it
    if _G.DefinitionOrReferences.config == nil then
        _G.DefinitionOrReferences.config = require("definition-or-references.config").options
    end

    _G.DefinitionOrReferences.state = M.toggle()
end

-- starts DefinitionOrReferences and set internal functions and state.
function DefinitionOrReferences.enable()
    if _G.DefinitionOrReferences.config == nil then
        _G.DefinitionOrReferences.config = require("definition-or-references.config").options
    end

    local state = M.enable()

    if state ~= nil then
        _G.DefinitionOrReferences.state = state
    end

    return state
end

-- disables DefinitionOrReferences and reset internal functions and state.
function DefinitionOrReferences.disable()
    _G.DefinitionOrReferences.state = M.disable()
end

-- setup DefinitionOrReferences options and merge them with user provided ones.
function DefinitionOrReferences.setup(opts)
    _G.DefinitionOrReferences.config = require("definition-or-references.config").setup(opts)
end

_G.DefinitionOrReferences = DefinitionOrReferences

return _G.DefinitionOrReferences
