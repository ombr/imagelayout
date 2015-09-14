class Line
  constructor: (@_layout)->
    @_objects = []
  accept: (object)->
    return true if @_objects.length == 0
    false
  height: ->
    height = @_layout.width() / @_ratio
    layout_height = @_layout.height() * @_layout.zoom()
    # console.log 'height', height, 'layout_height', layout_height
    if height > layout_height
      layout_height
    else
      height
  add: (object)->
    ratio = @_layout.object_ratio(object)
    if @_objects.length == 0
      @_ratio = ratio
    else
      @_ratio = 1.0 / (1.0/@_ratio + 1/ratio)
    @_objects.push(object)
  objects: ->
    @_objects
module.exports = Line
