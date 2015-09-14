expect = require('chai').expect
Layout = require '../app/layout'

describe 'Layout', ->
  it 'manage 5000 object', ->
    layout = new Layout(100, 100, .5)
    i = 0
    while (i < 5000)
      layout.add({w: 100, h: 100 })
      i+=1
    layout.getItems()
