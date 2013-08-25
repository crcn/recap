mojo = require "mojojs"
pc   = require "paperclip"

class BookmarkletView extends mojo.View

  ###
  ###

  paper: require("./bookmarklet.pc")

  ###
  ###

  getBookmarklet: () ->
    fn = () ->
      alert("ABBA")

    console.log fn.toString()

    "(#{fn.toString().replace(/[\n\r\t]+/g," ").replace(/"/g,"\\"")})();"




module.exports = BookmarkletView