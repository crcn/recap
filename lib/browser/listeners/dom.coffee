xpgen = require "xpgen"
flatten = require "flatten"

class DomListener extends require("./base")

  ###
  ###

  start: () ->
    console.log "start DOM2 listener"
    
    events = "mousedown".split(" ")

    for event in events
      document.body.addEventListener(event, @_onEvent, true)

  ###
  ###

  stop: () ->

  ###
  ###

  _onEvent: (event) =>
    @emit "event", { type: event.type, data: @_data($(event.target)) }


  ###
   finds unique attributes
  ###

  _data: ($element) ->
    attrs = {
      selector: @_findSelectors($element),
      class: $element.attr("class"),
      id: $element.attr("id")
    }
    attrs

  ###
  ###

  _findSelectors: ($element) ->

    el = $element[0]

    selectors = @_selectorByAttribs(el).
    concat(@_selectorByIndex(el))
    concat(@_selectorByPath(el))

    selectors.map (selector) -> String(selector)

    selectors


  ###
  ###

  _selectorByAttribs: (el) ->
    selectors = @_idSelector(el).
    concat(@_cssSelector(el))
    selectors

  ###
  ###

  _selectorByIndex: (el) ->
    xpgen().element(el.nodeName).at($(el).index())

  ###
  ###

  _idSelector: (el) ->
    return [xpgen().find().eq("@id",$(el).attr("id"))]
  
  ###
  ###

  _cssSelector: (el) ->
    classes = $(el).attr("classes")
    return [] unless classes
    classes = classes.split(" ")

    return [] unless classes.length
    selectors = []

    for clazz, i in classes
      selectors.push(xpgen().find(el.nodeName).contains("@class", classes.slice(0, i).join(" ")))

    selectors.push xpgen().find(el.nodeName).eq("@class", classes.join(" "))

    selectors

  ###
  ###

  _selectorByPath: (el, elSelectors) ->
    parent = el.parentNode
    parentSelectors = @_findSelectors parent
    selectors = []
    for pselector in parentSelectors
      for 
      selectors.push selector, "/", 






module.exports = () -> new DomListener()