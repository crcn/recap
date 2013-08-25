BookmarkletView = require "./bookmarklet"

exports.require = ["server", "config", "view.components"]
exports.plugin  = (server, config) ->
  console.log("go to /bookmarklet and run it in any browser to start recap");


  server.get "/bookmarklet", (req, res) ->
    view = new BookmarkletView({ httpPort: config.port })
    view.render () -> 
      res.send view.section.toString()
