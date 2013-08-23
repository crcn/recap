plugin = require("plugin")


module.exports = (params) ->
  plugin().
  params(params).
  require(__dirname + "/plugins").
  load () ->