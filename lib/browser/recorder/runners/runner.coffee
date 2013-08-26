class Runner
  
  ###
  ###

  constructor: (@_runners, @name) ->
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

  start: () ->
    console.log "start %s", @name
    for event in @actions
      
    #console.log @actions[0]
    @


module.exports = Runner