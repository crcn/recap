type = require "type-component"

class ActionRunner
  
  ###
  ###

  constructor: (@runner, @_action) ->

  ###
  ###

  start: (next = () ->) ->


    if type(@_action) is "string"
      return @runner.runners.get(@_action).start next

    method = @_action.type
    xpath  = @_action.data.xpath

    console.log("%c %s %s", "color:#FF00FF;", method, xpath);

    findElement = () ->
      $e = $(document.body).xpath(xpath)

      unless $e.length
        return setTimeout(findElement, 500)

      $e[method].call($e)
      next()

    findElement()



module.exports = ActionRunner

