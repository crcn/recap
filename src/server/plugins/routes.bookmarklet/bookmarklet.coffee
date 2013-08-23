mojo = require "mojojs"
pc   = require "paperclip"
fs   = require "fs"

class BookmarkletView extends mojo.View

  ###
  ###

  paper: require("./bookmarklet.pc")


module.exports = BookmarkletView