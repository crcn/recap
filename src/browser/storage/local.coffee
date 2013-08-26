store = require "store"

class Storage

  ###
  ###

  constructor: (@_recorder) -> 
    @_load()

  ###
  ###

  save: (name, callback) =>
    store.set("actions", @_recorder.runners.toJSON())

  ###
  ###

  autoSave: () ->
    @_recorder.on "update", @save

  ###
  ###

  _load: (callback = () ->) ->
    @_recorder.runners.fromJSON store.get("actions") or {}


module.exports = Storage