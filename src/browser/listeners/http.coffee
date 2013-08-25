class HttpListener extends require("./base")

  ###
  ###

  start: () ->
    console.log "start HTTP listener"

  ###
  ###

  stop: () ->

module.exports = () -> new HttpListener()