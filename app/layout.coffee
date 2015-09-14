Line = require './line'
Item = require './item'

class Layout
  constructor: (@_width, @_height, @_zoom)->
    @_current_line = new Line(this)
  object_ratio: (object)->
    object.w / object.h
  add: (object)->
    @_current_line.add(object)
  getItems: ->
    items = []
    offset_x = 0
    height = @_current_line.height()
    # console.log 'export, height = ', height
    for object in  @_current_line.objects()
      width = object.w / object.h * height
      items.push(
        new Item(object, offset_x, 0, width, height)
      )
    items
  width: ->
    @_width
  height: ->
    @_height
  zoom: ->
    @_zoom
module.exports = Layout
