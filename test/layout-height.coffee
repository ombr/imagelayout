expect = require('chai').expect
Layout = require '../app/layout'

describe 'Layout', ->
  describe '#height', ->
    it 'without margin', ->
      layout = new Layout(100, 100, .5)
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      expect(layout.height()).to.equal(150)

    it 'with margin', ->
      layout = new Layout(110, 110, .5, 10)
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      layout.add({w: 100, h: 100 })
      expect(layout.height()).to.equal(50 * 3 + 2 * 10)
