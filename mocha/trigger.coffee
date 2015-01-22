Base  = require 'mocha/lib/reporters/base'
flow = require 'home.flow'

do flow.init

module.exports = (runner) ->
  Base.call @, runner

  runner.on 'pass', (test) ->
    home.flow.hub.emit 'test:pass', {test}
  runner.on 'fail', (test) ->
    home.flow.hub.emit 'test:fail', {test}
  runner.on 'end', (results) ->
    home.flow.hub.emit 'test:end', {results}
