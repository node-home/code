Base = require 'mocha/lib/reporters/base'
aura = require 'home.aura'

do aura.init

RED    = aura.utils.color.rgbToHsb r: 255, g: 0,   b: 0, alert: 'select'
GREEN  = aura.utils.color.rgbToHsb r: 0,   g: 255, b: 0, alert: 'select'
YELLOW = aura.utils.color.rgbToHsb r: 255, g: 255, b: 0, alert: 'select'

module.exports = (runner) ->
  Base.call @, runner

  success = true

  runner.on 'start', ->
    aura.hue.groups.update 0, YELLOW

  runner.on 'fail', ->
    success = false

  runner.on 'end', ->
    aura.hue.groups.update 0, if success then GREEN else RED
