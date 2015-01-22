# TODO pass in runner names and find them
module.exports = (runners) ->
  (args...) ->
    runner args... for runner in runners
