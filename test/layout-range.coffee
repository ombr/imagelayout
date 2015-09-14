expect = require('chai').expect
Layout = require '../app/layout'

describe 'Layout', ->
  describe '#getItems', ->
    it 'return the number of elements', ->
      layout = new Layout(100, 100, 1)
      i = 0
      while (i < 500)
        layout.add({w: 100, h: 100 })
        i+=1
      expect(layout.getItems(2000, 3000).length).to.equal(10)
