BookmarkletView = require "./bookmarklet"

exports.require = ["server"]
exports.plugin  = (server) ->
  console.log("go to /bookmarklet and run it in any browser to start recap");

  try 
    view = new BookmarkletView()
    view.render () ->
      console.log "DD"

    console.log view.section.toString(), "G"
  catch e
    console.error e.stack
