Line = require './line'

class Layout
  constructor: (@_width, @_height, @_zoom, @_margin = 0)->
    @_ratio =  @_width / @_height
    @_current_line = new Line(this)
    @_lines = [@_current_line]
  ratio_threshold: ->
    @_ratio / @_zoom
  add: (object)->
    if @_current_line.accept(object)
      @_current_line.add(object)
    else
      # console.log '!!!NEW LINE !'
      @_current_line = new Line(this)
      @_lines.push(@_current_line)
      @_current_line.add(object)
  getItems: (start=0, end)->
    items = []
    offset_y = 0
    for line in @_lines
      height = line.height()
      if offset_y < start
        offset_y += height + @_margin
        continue
      for item in  line.getItems(offset_y)
        items.push(item)
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
