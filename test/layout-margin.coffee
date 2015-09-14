expect = require('chai').expect
Layout = require '../app/layout'

describe 'Layout', ->
  describe 'margin', ->
    it 'two portraits object', ->
      layout = new Layout(110, 110, 1, 10)
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})

      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[0].y).to.equal(0)
      expect(layout.getItems()[0].w).to.equal(50)
      expect(layout.getItems()[0].h).to.equal(100)

      expect(layout.getItems()[1].x).to.equal(60)
      expect(layout.getItems()[1].y).to.equal(0)
      expect(layout.getItems()[1].w).to.equal(50)
      expect(layout.getItems()[1].h).to.equal(100)
    it 'four portraits object', ->
      layout = new Layout(130, 100, .5, 10)
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})

      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[1].x).to.equal(35)
      expect(layout.getItems()[2].x).to.equal(70)
      expect(layout.getItems()[3].x).to.equal(105)
    it 'four portraits on two lines', ->
      layout = new Layout(110, 100, 1, 10)
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})

      expect(layout.getItems()[0].y).to.equal(0)
      expect(layout.getItems()[1].y).to.equal(0)
      expect(layout.getItems()[2].y).to.equal(110)
      expect(layout.getItems()[3].y).to.equal(110)
