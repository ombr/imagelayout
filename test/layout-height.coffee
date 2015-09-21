expect = require('chai').expect
Layout = require '../app/layout'

describe 'Layout', ->
  describe '#height', ->
    it 'return the right height', ->
      layout = new Layout(100, 100, .5)
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      expect(layout.height()).to.equal(150)
