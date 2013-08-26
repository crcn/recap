#window.recapped = true

listeners = require("./listeners"),
Recorder  = require("./recorder"),
Storage   = require("./storage/local");


class Recap
  
  ###
  ###

  constructor: () ->
    @_recorder = new Recorder listeners.all().start()

  ###
   starts recording actions
  ###

  start: () ->
    @_recorder.start()

  ###
   stops recording actions
  ###

  stop: () ->
    @_recorder.stop()


  ###
  ###

  save: (name, description) ->


  ###
  ###

  load: (name) ->





module.exports = Recap