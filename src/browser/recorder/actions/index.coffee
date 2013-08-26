ActionsRunner = require "./actions"

class Runners
  
  ###
  ###

  constructor: () ->
    @clear()

  ###
  ###

  get: (name) -> 
    @_runners[name] ? (@_runners[name] = new ActionsRunner(@, name))

  ###
  ###

  remove: (name) ->
    delete @_runners[ame]

  ###
  ###

  clear: () ->
    @_runners = {}

  ###
  ###

  toJSON: () ->
    data = {}
    for name of @_runners
      data[name] = @_runners[name].toJSON()
    data

  ###
  ###

  fromJSON: (runners) ->
    for name of runners
      @_runners[name] = r = new ActionsRunner @, name
      r.fromJSON runners[name]



module.exports = Runners