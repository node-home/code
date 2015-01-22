Base  = require 'mocha/lib/reporters/base'
voice = require 'home.voice'

do voice.init

module.exports = (runner) ->
  Base.call @, runner

  failures = 0

  if runner.bail
    runner.on 'fail', (test) ->
      voice.voice.say 'it ' + test.title
  else
    runner.on 'fail', (test) ->
      failures += 1
    runner.on 'end', ->
      return unless failures
      voice.voice.say if failures == 1 then "1 failure" else "#{failures} failures"
