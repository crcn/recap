xpgen = require("xpgen")

###
###

module.exports = (element) -> 
  return undefined if element.nodeName is "BODY"
  _findXPath(element)
  

###
###

_findXPath = (element) ->

  # first need to find the correct element - this could be an anchor, or
  # input
  ce  = _findCorrectElement element
  rxp = _findRelativeXPath ce
  uxp = _findUniqueXPath ce, rxp

###
 finds the relative xpath from the parent
###

_findRelativeXPath = (element) ->
  $e = $(element)
  nodeName = element.nodeName.toLowerCase()
  parent = $(element.parentNode)

  posibilities = [
    xpgen().element(nodeName).eq("@id", $e.attr("id")),
    xpgen().element(nodeName).eq("text()", $e.text())
  ]

  for attr in ["class", "href", "name", "value", "placeholder", "alt"]
    posibilities.push xpgen().element(nodeName).eq("@" + attr, $e.attr(attr))

  # index is last resort
  posibilities.push xpgen().element(nodeName).index($e.index() + 1)

  for xpath in posibilities
    xpath = String(xpath).substr(1)
    if parent.xpath(xpath).length is 1
      return xpath


###
 finds the unique xpath from the document
###

_findUniqueXPath = (element, rxp) ->
  xpath = [rxp]

  cp = element
  $b = $(document.body)

  while cp
    return p = if $b.xpath("//"+ (p = xpath.join("/"))).length is 1
    cp = cp.parentNode



###
###

_findCorrectElement = (element) ->
  cp = element

  while cp
    return cp if /INPUT|BUTTON|A/.test cp.nodeName
    cp = cp.parentNode

  cp or element







