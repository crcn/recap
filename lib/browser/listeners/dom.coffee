class DomListener extends require("./base")

  ###
  ###

  start: () ->
    console.log "start DOM listener"
    
    events = ["mousedown"]

    for event in events

  ###
  ###

  stop: () ->

  ###
  ###

  _onEvent: (event) =>
    console.log event.type

module.exports = () -> new DomListener()