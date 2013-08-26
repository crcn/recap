Runner = require "./runner"

class Runners
  
  ###
  ###

  constructor: () ->
    @_runners = []

  ###
  ###

  toJSON: () ->
    for 

  ###
  ###

  fromJSON: (runners) ->
    for name of runners
      @_runners.push r = new Runner()
      r.fromJSON runners[name]






module.exports = Runners