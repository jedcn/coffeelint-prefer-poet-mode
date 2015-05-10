expect = require('chai').expect
PreferFewerParens = require '../src/PreferFewerParens'

coffeelint = require 'coffeelint'
coffeelint.registerRule PreferFewerParens

config =
  'prefer_fewer_parens':
    level: 'error'

describe 'PreferFewerParens', ->

  describe 'standalone function', ->

    it 'is ok if no unneeded parens are used', ->
      result = coffeelint.lint('alert "Hello CoffeeScript!"', config)[0]
      expect(result).to.be.ok

    it 'is not ok if unneeded parens are used', ->
      result = coffeelint.lint('alert("Hello CoffeeScript!")', config)[0]
      expect(result).to.be.not.ok

  describe 'function on an object', ->

    it 'is ok if no unneeded parens are used', ->
      result = coffeelint.lint('Math.pow 2, 3', config)[0]
      expect(result).to.be.ok

    it 'is not ok if unneeded parens are used', ->
      result = coffeelint.lint('Math.pow(2, 3)', config)[0]
      expect(result).to.be.not.ok

  describe 'standalone function with another function as an argument', ->

    it 'is ok if no unneeded parens are used', ->
      input = '''
      runLater ->
        alert "Hello CoffeeScript!"
      '''
      result = coffeelint.lint(input, config)[0]
      expect(result).to.be.ok

    it 'is not ok if unneeded parens are used', ->
      input = '''
      runLater(->
        alert "Hello CoffeeScript!")
      '''
      result = coffeelint.lint(input, config)[1]
      expect(result).to.be.not.ok
