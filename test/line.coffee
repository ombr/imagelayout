expect = require('chai').expect
Layout = require '../app/layout'
Line = require '../app/line'

describe 'Line', ->
  describe '#accept', ->
    it 'returns true if line is empty', ->
      line = new Line()
      expect(line.accept({w: 100, h: 100})).to.be.true
  describe '#height', ->
    describe 'with two objects',->
      it 'return line height with mix items', ->
        layout = new Layout(100,100, 0.5)
        line = new Line(layout)
        line.add({ w: 200, h: 100 })
        line.add({ w: 100, h: 200 })
        expect(line.height()).to.equal(50)
      it 'return line height with two square items', ->
        layout = new Layout(100,100, 0.5)
        line = new Line(layout)
        line.add({ w: 100, h: 100 })
        line.add({ w: 100, h: 100 })
        expect(line.height()).to.equal(50)
    describe 'with one object', ->
      it 'return line height with single square object', ->
        layout = new Layout(100,100, 1)
        line = new Line(layout)
        line.add({ w: 100, h: 100 })
        expect(line.height()).to.equal(100)
      it 'return line height with single portrait object', ->
        layout = new Layout(100,100, 1)
        line = new Line(layout)
        line.add({ w: 100, h: 200 })
        expect(line.height()).to.equal(100)
      it 'return line height with single landscape object', ->
        layout = new Layout(100,100, 1)
        line = new Line(layout)
        line.add({ w: 200, h: 100 })
        expect(line.height()).to.equal(50)
