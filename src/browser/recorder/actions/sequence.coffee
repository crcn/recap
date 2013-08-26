flatstack    = require "flatstack"
ActionRunner = require "./action"

class GroupRunner
  
  ###
  ###

  constructor: (@runners, @name) ->
    @actions = []

  ###
  ###

  fromJSON: (data) ->
    @actions     = data.actions
    @description = data.description
    @name        = data.name

  ###
  ###

  toJSON: () ->
    actions: @actions
    description: @description
    name: name

  ###
  ###

  start: (next = () ->) ->
    console.log("%c run %s", "color:#FF00FF;", @name);

    q = flatstack()

    @actions.forEach (action) ->
      q.push (next) ->
        new ActionRunner(@, action).start next

    q.push () ->
      next()

    @

module.exports = GroupRunner