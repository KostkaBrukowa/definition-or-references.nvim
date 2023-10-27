local definitions = require("definition-or-references.definitions")
local references = require("definition-or-references.references")
local methods = require("definition-or-references.methods_state")
local config = require("definition-or-references.config")

-- internal methods
local DefinitionOrReferences = {}

function DefinitionOrReferences.definition_or_references()
  config.get_config().before_start_callback()
  methods.clear_references()
  methods.clear_definitions()
  -- sending references request before definitons to parallelize both requests
  definitions()
  references.send_references_request()
end

return DefinitionOrReferences
