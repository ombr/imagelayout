class Line
  constructor: (@_layout)->
    @_objects = []
  accept: (object)->
    return true if @_objects.length == 0
    return true if @height_without_zoom(@_ratio) > @_layout.threshold()
    return true if Math.min(1, @calculate_ratio_with(object)) == Math.min(1, @_ratio)
    false
  height_without_zoom: (ratio)->
    @_layout.width() * Math.min(ratio, 1)
  height: ->
    height_without_zoom = @height_without_zoom(@_ratio)
    # console.log 'without_zoom:', height_without_zoom
    threshold = @_layout.threshold()
    # console.log 'height', height_without_zoom, 'threshold', threshold
    if height_without_zoom > threshold
      # console.log 'Apply Threshold ? ', threshold
      return threshold
    else
      return height_without_zoom
  calculate_ratio_with: (object)->
    ratio = object.h/object.w
    if @_objects.length == 0
      ratio
    else
      1.0 / (1.0/@_ratio + 1/ratio)
  add: (object)->
    @_ratio = @calculate_ratio_with(object)
    @_objects.push(object)
    console.log 'add', object, 'new_ratio:', @_ratio, 'new_height_without_zoom', @height_without_zoom(), 'new_height', @height()
  objects: ->
    @_objects
module.exports = Line
