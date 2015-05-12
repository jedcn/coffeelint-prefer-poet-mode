expect = require('chai').expect
PreferPoetMode = require '../src/PreferPoetMode'

coffeelint = require 'coffeelint'
coffeelint.registerRule PreferPoetMode

config =
  'prefer_poet_mode':
    level: 'error'

describe 'PreferPoetMode', ->

  describe 'standalone function', ->

    it 'is ok if no unneeded parens are used', ->
      results = coffeelint.lint 'alert "Hello CoffeeScript!"', config
      expect(results.length).to.equal 0

    it 'is not ok if unneeded parens are used', ->
      results = coffeelint.lint 'alert("Hello CoffeeScript!")', config
      expect(results.length).to.equal 1
      result = results[0]
      expect(result.rule).to.equal 'prefer_poet_mode'
      expect(result.lineNumber).to.equal 1
      expect(result.line).to.equal 'alert("Hello CoffeeScript!")'

  describe 'function on an object', ->

    it 'is ok if no unneeded parens are used', ->
      results = coffeelint.lint 'Math.pow 2, 3', config
      expect(results.length).to.equal 0

    it 'is not ok if unneeded parens are used', ->
      results = coffeelint.lint 'Math.pow(2, 3)', config
      expect(results.length).to.equal 1
      result = results[0]
      expect(result.rule).to.equal 'prefer_poet_mode'
      expect(result.lineNumber).to.equal 1
      expect(result.line).to.equal 'Math.pow(2, 3)'

  describe 'standalone function with another function as an argument', ->

    it 'is ok if no unneeded parens are used', ->
      input = '''
      runLater ->
        alert "Hello CoffeeScript!"
      '''
      results = coffeelint.lint input, config
      expect(results.length).to.equal 0

    it 'is not ok if unneeded parens are used', ->
      input = '''
      runLater(->
        alert "Hello CoffeeScript!")
      '''
      results = coffeelint.lint input, config
      expect(results.length).to.equal 1
      result = results[0]
      expect(result.rule).to.equal 'prefer_poet_mode'
      expect(result.lineNumber).to.equal 2
      expect(result.line).to.equal '  alert "Hello CoffeeScript!")'
