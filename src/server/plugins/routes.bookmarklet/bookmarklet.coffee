mojo = require "mojojs"
pc   = require "paperclip"
ent  = require "ent"


class BookmarkletView extends mojo.View

  ###
  ###

  paper: require("./bookmarklet.pc")

  ###
  ###

  getBookmarklet: () ->

    fn = () ->

      return if window.recapped
      scripts = []

      if typeof $ is "undefined"
        scripts.push "vendor/jquery-1.10.2.js"

      scripts.push "vendor/jquery-xpath.js"
      scripts.push "index.min.js?" + Date.now() 

      for scriptSrc in scripts
        script = document.createElement "script"
        script.src = "http://127.0.0.1:{{PORT}}/" + scriptSrc
        document.head.appendChild script


    bm = String(fn).replace(/\{\{PORT\}\}/g, @httpPort)

    "(#{ent.encode(bm)})();"




module.exports = BookmarkletView