expect = require('chai').expect
Layout = require '../app/layout'

describe 'Layout', ->
  describe 'basics', ->
    it 'return an element with the same size of the layout',->
      layout = new Layout(100, 100, 1)
      layout.add({w: 100, h: 100})
      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[0].y).to.equal(0)
      expect(layout.getItems()[0].w).to.equal(100)
      expect(layout.getItems()[0].h).to.equal(100)

    it 'resize a single landscape to fit',->
      layout = new Layout(100, 100, 1)
      layout.add({w: 200, h: 100})
      expect(layout.getItems()[0].h).to.equal(50)
      expect(layout.getItems()[0].w).to.equal(100)

    it 'resize a single portrait to fit',->
      layout = new Layout(100, 100, 1)
      layout.add({w: 100, h: 200})
      expect(layout.getItems()[0].w).to.equal(50)
      expect(layout.getItems()[0].h).to.equal(100)

    it 'resize a single square image when zoom', ->
      layout = new Layout(100, 100, 0.5)
      layout.add({w: 100, h: 100})
      expect(layout.getItems()[0].w).to.equal(50)
      expect(layout.getItems()[0].h).to.equal(50)

    # Cas particulier ?
    it 'two portrait on the same line', ->
      layout = new Layout(100, 100, 1)
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})
      expect(layout.getItems()[0].w).to.equal(50)
      expect(layout.getItems()[0].h).to.equal(100)
      expect(layout.getItems()[1].w).to.equal(50)
      expect(layout.getItems()[1].h).to.equal(100)

      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[1].x).to.equal(50)

    it 'four portrait on the same line', ->
      layout = new Layout(100, 100, 1)
      layout.add({w: 25, h: 100})
      layout.add({w: 25, h: 100})
      layout.add({w: 25, h: 100})
      layout.add({w: 25, h: 100})

      expect(layout.getItems()[0].w).to.equal(25)
      expect(layout.getItems()[0].h).to.equal(100)
      expect(layout.getItems()[1].w).to.equal(25)
      expect(layout.getItems()[1].h).to.equal(100)

      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[1].x).to.equal(25)
      expect(layout.getItems()[2].x).to.equal(50)
      expect(layout.getItems()[3].x).to.equal(75)

    it 'two landscape in a square', ->
      layout = new Layout(100, 100, 1)
      layout.add({w: 100, h: 50})
      layout.add({w: 100, h: 50})
      expect(layout.getItems()[0].w).to.equal(100)
      expect(layout.getItems()[0].h).to.equal(50)
      expect(layout.getItems()[1].w).to.equal(100)
      expect(layout.getItems()[1].h).to.equal(50)

      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[1].y).to.equal(50)

    it 'a portrait and a landscape on the same line', ->
      layout = new Layout(100, 100, 0.1)
      layout.add({w: 50, h: 100})
      layout.add({w: 200, h: 100})
      expect(layout.getItems()[0].h).to.equal(layout.getItems()[1].h)
      expect(layout.getItems()[0].w).to.equal(5)
      expect(layout.getItems()[1].w).to.equal(20)
      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[1].x).to.equal(5)
