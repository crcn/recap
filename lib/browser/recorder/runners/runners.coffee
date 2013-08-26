class Runners
  
  ###
  ###

  constructor: () ->
    @_runners = {}

  ###
  ###

  toJSON: () ->
    @_runners

  ###
  ###

  fromJSON: (runners) ->
    for name of runners





module.exports = Runners