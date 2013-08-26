xpgen = require "xpgen"
flatten = require "flatten"

###
1. find all the available xpaths
2. 
###

module.exports = (element) ->
  
  return [] if not element or element.nodeName is "BODY"

  xpaths = []
  xpaths = xpaths.concat @_xpathsByAttribs(element)
  xpaths = xpaths.concat @_xpathsByIndex(element)


###
###

_xpathsByAttribs: (element) ->
  xpaths = []

  possibilities = []

  for attribute in element.attributes
    value = attribute.value
    name  = attribute.name

    valueParts = 

###
###

_xpathsByIndex: (element) ->
  xpgen().element(element.nodeName).index(element.parentNode.childNodes.indexOf(element))