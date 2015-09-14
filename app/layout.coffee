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
  getItems: (start=0, end)->
    items = []
    offset_y = 0
    for line in @_lines
      offset_x = 0
      height = line.height()
      if offset_y < start
        offset_y += height + @_margin
        continue
      for object in  line.objects()
        width = object.w / object.h * height
        items.push(
          new Item(object, offset_x, offset_y, width, height)
        )
        offset_x += width + @_margin
      offset_y += height + @_margin
      if end? and offset_y >= end
        break
    items
  height: ->
    height = 0
    for line in @_lines
      height += line.height()
    height += (@_lines.length - 1) * @_margin
    height
module.exports = Layout
