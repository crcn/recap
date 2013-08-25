module.exports = 

  group: require("./group")

  # listens for HTTP requests
  http : require("./http")

  # listens for DOM events - clicks primarily
  dom  : require("./dom")


module.exports.all = () ->
  module.exports.group [module.exports.http(), module.exports.dom()]
