local main = require("definition-or-references.main")
local DefinitionOrReferences = {}

-- Goes to the definition or shows references based on cursor position
function DefinitionOrReferences.definition_or_references()
  main.definition_or_references()
end

-- setup DefinitionOrReferences options and merge them with user provided ones.
function DefinitionOrReferences.setup(opts)
  _G.DefinitionOrReferences.config = require("definition-or-references.config").setup(opts)
end

_G.DefinitionOrReferences = DefinitionOrReferences

return _G.DefinitionOrReferences
