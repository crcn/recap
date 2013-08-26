toarray = require "toarray"

class GroupListener extends require("./base")

  ###
  ###

  constructor: (listeners) ->
    @_listeners = toarray listeners

    for listener in @_listeners
      listener.on "event", @_onEvent

  ###
  ###

  start: () ->
    for listener in @_listeners
      listener.start()

  ###
  ###

  stop: () ->
    for listener in @_listeners
      listener.stop()

  ###
  ###

  _onEvent: (event) => 
    @emit event.type, event.data
    @emit "event", event
    @emit event.listener + ".event", event




module.exports = (listeners) -> new GroupListener listeners