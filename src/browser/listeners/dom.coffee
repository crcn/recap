class DomListener extends require("./base")

  ###
  ###

  start: () ->
    console.log "start DOM2 listener"
    
    events = ["mousedown"]

    console.log(events)

    for event in events
      document.body.addEventListener(event, @_onEvent, true)

  ###
  ###

  stop: () ->

  ###
  ###

  _onEvent: (event) =>
    console.log event.type, event.target

module.exports = () -> new DomListener()