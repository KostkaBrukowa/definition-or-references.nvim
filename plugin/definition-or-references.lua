-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.DefinitionOrReferencesLoaded then
    return
end

_G.DefinitionOrReferencesLoaded = true

vim.api.nvim_create_user_command("DefinitionOrReferences", function()
    require("definition-or-references").toggle()
end, {})
