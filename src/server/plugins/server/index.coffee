express = require "express"
pc      = require "paperclip"

exports.require = ["config"]
exports.plugin = (config) ->  

  app = express()
  app.engine("pc", pc.adapters.express);
  console.log("listening on port %d", config.port);
  app.listen(config.port)
  app
