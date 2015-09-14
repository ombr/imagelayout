expect = require('chai').expect
Layout = require '../app/layout'

describe 'Layout', ->
  describe 'layout landscape', ->
    it 'object portrait', ->
      layout = new Layout(100, 50, 1)
      layout.add({w: 100, h: 200, src: 'test'})
      expect(layout.getItems()[0].w).to.equal(25)
      expect(layout.getItems()[0].h).to.equal(50)

  describe 'layout portrait', ->
    it 'object portrait', ->
      layout = new Layout(50, 100, 1)
      layout.add({w: 100, h: 50, src: 'test'})
      expect(layout.getItems()[0].w).to.equal(50)
      expect(layout.getItems()[0].h).to.equal(25)


  describe 'multiples lines', ->
    it 'return two lines',->
      layout = new Layout(100, 100, 1)
      layout.add({w: 100, h: 100})
      layout.add({w: 100, h: 100})
      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[0].y).to.equal(0)
      expect(layout.getItems()[0].w).to.equal(100)
      expect(layout.getItems()[0].h).to.equal(100)

      expect(layout.getItems()[1].x).to.equal(0)
      expect(layout.getItems()[1].y).to.equal(100)
      expect(layout.getItems()[1].w).to.equal(100)
      expect(layout.getItems()[1].h).to.equal(100)

    it 'return two lines',->
      layout = new Layout(100, 100, 0.5)
      layout.add({w: 50, h: 50})
      layout.add({w: 50, h: 50})
      layout.add({w: 50, h: 50})
      layout.add({w: 50, h: 50})

      expect(layout.getItems()[3].x).to.equal(50)
      expect(layout.getItems()[3].y).to.equal(50)
      expect(layout.getItems()[3].w).to.equal(50)
      expect(layout.getItems()[3].h).to.equal(50)
