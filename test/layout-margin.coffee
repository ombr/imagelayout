expect = require('chai').expect
Layout = require '../app/layout'

describe 'Layout', ->
  describe 'margin', ->
    it 'Basic use case', ->
      layout = new Layout(100, 100, 0.45, 10)
      layout.add({w: 45, h: 45})
      layout.add({w: 45, h: 45})
      layout.add({w: 45, h: 45})
      layout.add({w: 45, h: 45})

      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[0].y).to.equal(0)
      expect(layout.getItems()[0].w).to.equal(45)
      expect(layout.getItems()[0].h).to.equal(45)

      expect(layout.getItems()[1].x).to.equal(55)
      expect(layout.getItems()[1].y).to.equal(0)
      expect(layout.getItems()[1].w).to.equal(45)
      expect(layout.getItems()[1].h).to.equal(45)

      expect(layout.getItems()[2].x).to.equal(0)
      expect(layout.getItems()[2].y).to.equal(55)
      expect(layout.getItems()[2].w).to.equal(45)
      expect(layout.getItems()[2].h).to.equal(45)

      expect(layout.getItems()[3].x).to.equal(55)
      expect(layout.getItems()[3].y).to.equal(55)
      expect(layout.getItems()[3].w).to.equal(45)
      expect(layout.getItems()[3].h).to.equal(45)

    it 'two portraits object', ->
      layout = new Layout(110, 100, 1, 10)
      layout.add({w: 100, h: 200})
      layout.add({w: 100, h: 200})

      expect(layout.getItems()[0].x).to.equal(0)
      expect(layout.getItems()[0].y).to.equal(0)

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


    describe '#height', ->
      it 'with margin', ->
        layout = new Layout(110, 100, .5, 10)
        layout.add({w: 100, h: 100 })
        layout.add({w: 100, h: 100 })
        layout.add({w: 100, h: 100 })
        layout.add({w: 100, h: 100 })
        layout.add({w: 100, h: 100 })
        layout.add({w: 100, h: 100 })
        console.log layout.getItems()
        expect(Math.round(layout.height())).to.equal(50 * 3 + 2 * 10)
