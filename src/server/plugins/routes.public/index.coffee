express = require "express"
exports.require = ["server"]
exports.plugin = (server) ->
  server.use express.static(__dirname + "/../../../browser")
