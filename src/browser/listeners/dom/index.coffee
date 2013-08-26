findXPath = require "./findXPath"

class DomListener extends require("../base")

  ###
  ###

  start: () ->
    
    events = "click".split(" ")

    for event in events
      document.body.addEventListener(event, @_onEvent, true)

  ###
  ###

  stop: () ->

  ###
  ###

  _onEvent: (event) =>
    @emit "event", { listener: "dom", type: event.type, data: @_data($(event.target)) }


  ###
   finds unique attributes
  ###

  _data: ($element) ->
    attrs = {
      xpath: findXPath($element[0])
    }
    attrs


module.exports = () -> new DomListener()