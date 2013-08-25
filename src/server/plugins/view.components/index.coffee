pc       = require "paperclip"
pcv      = require "paperclip-view"
bindable = require "bindable"

exports.plugin = () ->

  components = new bindable.Object({
    mainLayout: require("./views/layout")
  })

  pc.use pcv components
  components

