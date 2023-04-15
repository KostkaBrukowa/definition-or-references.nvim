local D = require("definition-or-references.util.debug")

-- internal methods
local DefinitionOrReferences = {}

-- state
local S = {
    -- Boolean determining if the plugin is enabled or not.
    enabled = false,
}

---Toggle the plugin by calling the `enable`/`disable` methods respectively.
---@private
function DefinitionOrReferences.toggle()
    if S.enabled then
        return DefinitionOrReferences.disable()
    end

    return DefinitionOrReferences.enable()
end

---Initializes the plugin.
---@private
function DefinitionOrReferences.enable()
    if S.enabled then
        return S
    end

    S.enabled = true

    return S
end

---Disables the plugin and reset the internal state.
---@private
function DefinitionOrReferences.disable()
    if not S.enabled then
        return S
    end

    -- reset the state
    S = {
        enabled = false,
    }

    return S
end

return DefinitionOrReferences
