Line = require './line'
Item = require './item'

class Layout
  constructor: (@_width, @_height, @_zoom, @_margin = 0)->
    @_current_line = new Line(this)
    @_lines = [@_current_line]
  object_ratio: (object)->
    object.w / object.h
  threshold: ->
    @_height * @_zoom
  add: (object)->
    if @_current_line.accept(object)
      @_current_line.add(object)
    else
      console.log '!!!NEW LINE !'
      @_current_line = new Line(this)
      @_current_line.add(object)
      @_lines.push(@_current_line)
  getItems: ->
    items = []
    offset_y = 0
    for line in @_lines
      offset_x = 0
      height = line.height()
      for object in  line.objects()
        width = object.w / object.h * height
        # console.log(object, offset_x, offset_y, width, height)
        items.push(
          new Item(object, offset_x, offset_y, width, height)
        )
        offset_x += width + @_margin
      offset_y += height + @_margin
    items
  width: ->
    @_width
  height: ->
    @_height
  zoom: ->
    @_zoom
  margin: ->
    @_margin
module.exports = Layout
