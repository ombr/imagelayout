Item = require './item'
class Line
  constructor: (@_layout)->
    @_objects = []
  accept: (object)->
    return true if @_objects.length == 0
    return true if @calculate_ratio_with(object) <= @_layout.ratio_threshold()
    false
  ratio: ->
    ratio_threshold = @_layout.ratio_threshold()
    ratio = @ratio_with_margin(@_objects_ratio, @_objects.length, @_layout._margin)
    if ratio > ratio_threshold
      ratio
    else
      ratio_threshold
  height: ->
    return @_layout._width / @ratio()
  add: (object)->
    if @_objects.length == 0
      @_objects_ratio = @object_ratio(object)
    else
      @_objects_ratio += @object_ratio(object)
    @_objects.push(object)
    # console.log 'add', object, 'new_ratio_internal:', @_objects_ratio,'ratio', @ratio(), 'new_height', @height()
  getItems: (offset_y)->
    height = @height()
    items = []
    offset_x = 0
    for object in  @_objects
      width = object.w / object.h * height
      # item = new Item(object, offset_x, offset_y, width, height)
      item = new Item(object, Math.round(offset_x), Math.round(offset_y), Math.round(width), Math.round(height))
      items.push(item)
      offset_x += width + @_layout._margin
    items
  calculate_ratio_with: (object)->
    ratio = @object_ratio(object)
    if @_objects.length == 0
      ratio
    else
      return @ratio_with_margin(@_objects_ratio + ratio, @_objects.length + 1, @_layout._margin)
  ratio_with_margin: (ratio, n, margin)->
    ratio + (n - 1) * margin / @_layout._width * ratio
  object_ratio: (object)->
    object.w / object.h
module.exports = Line
