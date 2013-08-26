Recap is a utility that makes it easy to record, and replay user interactions. These user interactions can be translated to anything from site tours, to selenium tests.

## Installation

You can install the recap bookmark


## Console API

These commands can be executed in Chrome, or Firefox's web inspector.

#### recap.record(options)

Starts recording user interactions. 

```bash
> recap.start("http"); # start recording only HTTP events
> recap.start("http", "dom"); # start recording HTTP & DOM events
``` 

#### recap.stop()

Stops recording user interactions

#### recap.actions

Collection of all actions recorded during `recap.start()`, and `recap.stop()`.

```bash
> recap.actions
[ 
  {"type": "dom", "event": "click", xpath: "/path/to/element", selector: "jquerySelector" }
]
```

#### recap.actions.unshift(action)

adds a user interaction to the beginning. This allows you to easily **chain actions together**. For example:

```bash
> recap.actions.unshift("login", "goToDashboard")
> recap.play() # play login, and go to dashboard
```

Unshifts an action 

#### Action recap.create(name)

Creates a new set of actions

#### Action recap.current

Returns the current action that's running

#### expect action.expect(attribute)


#### recap.saved()

Returns all saved user interactions

```bash
> recap.saved()
[
  { name: "login", desc: "login the user" },
  { name: "goToDashboard", desc: "loads the dashboard" }
]
```

#### recap.remove(name)

removes a saved recording

#### recap.load(name)

Loads a saved user interaction

#### recap.play()

plays the current user interaction

#### recap.transform(type)

transforms the current recap into something else.

```bash
> recap.transform("selenium")
```





