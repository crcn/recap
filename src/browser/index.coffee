#window.recapped = true

listeners = require("./listeners")
Recorder  = require("./recorder")
Storage   = require("./storage/local")


class Recap
  
  ###
  ###

  constructor: () ->
    @_recorder = new Recorder listeners.all()
    @_storage  = new Storage @_recorder

  ###
  ###

  help: () ->
    console.log [
      "start() - starts recording actions",
      "stop()  - stops recording actions"
    ].join("\n")


  ###
   starts recording actions
  ###

  start: (name, description) ->  

    unless name
      throw new Error("name must be provided")

    console.log("recording user interactions")
    @current = @_recorder.start name

  ###
  ###

  clear: () -> 
    @_recorder.clear()
    @

  ###
  ###

  remove: (name) ->
    @_recorder.remove name
    @

  ###
   stops recording actions
  ###

  stop: () ->
    @_recorder.stop()
    @

  ###
  ###

  saved: () -> 
    @_recorder.runners.toJSON()

  ###
  ###

  autoSave: () ->
    @_storage.autoSave()
    true

  ###
  ###

  save: () ->
    @_storage.save()
    true


window.recap = new Recap()
window.recap.help()