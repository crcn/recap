Runners = require "./runners"
events  = require "events"

class Recorder extends events.EventEmitter

  ###
  ###

  constructor: (@_listener) ->
    @_listener.start()
    @runners = new Runners()
    @_listener.on "event", @_onEvent


  ###
  ###

  start: (name) ->
    @_recording = true
    @current = @runners.get(name).start()

  ###
  ###

  stop: () ->
    @_recording = false
    @

  ###
  ###

  remove: (name) ->
    @runners.remove(name)
    @_update()
    @

  ###
  ###

  clear: () ->
    @runners.clear()
    @_update()
    @

  ###
  ###

  _onEvent: (event) =>
    return if event.listener isnt "dom" or @_recording isnt true
    console.log "%c %s %s", "color:#FF00FF;", event.type, event.data.xpath 
    @current.actions.push event
    @_update()

  ###
  ###

  _update: () ->
    @emit "update"
module.exports = Recorder