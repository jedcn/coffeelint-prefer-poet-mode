expect = require('chai').expect
PreferPoetMode = require '../src/PreferPoetMode'

coffeelint = require 'coffeelint'
coffeelint.registerRule PreferPoetMode

config =
  'prefer_poet_mode':
    level: 'error'

describe 'PreferPoetMode', ->

  describe 'acceptable inputs', ->

    it 'is ok with a fn invocation without args', ->
      results = coffeelint.lint 'alert()', config
      expect(results.length).to.equal 0

    it 'is ok with a basic fn invocation', ->
      results = coffeelint.lint 'alert "Hello CoffeeScript!"', config
      expect(results.length).to.equal 0

    it 'is ok with a basic method invocation', ->
      results = coffeelint.lint 'Math.pow 2, 3', config
      expect(results.length).to.equal 0

    it 'is ok with a fn invocation that takes a fn as an arg', ->
      input = '''
      runLater ->
        alert "Hello CoffeeScript!"
      '''
      results = coffeelint.lint input, config
      expect(results.length).to.equal 0

    it 'is ok with mixed explicit/implicit paren usage', ->
      input = """
      gulp.task 'compile', ->
        gulp.src(src)
          .pipe(coffee())
          .pipe(gulp.dest('./src'))
      """
      results = coffeelint.lint input, config
      expect(results.length).to.equal 0

  describe 'problematic inputs', ->

    it 'rejects a fn invocation where unneeded parens are used', ->
      results = coffeelint.lint 'alert("Hello CoffeeScript!")', config
      expect(results.length).to.equal 1
      result = results[0]
      expect(result.rule).to.equal 'prefer_poet_mode'
      expect(result.lineNumber).to.equal 1
      expect(result.line).to.equal 'alert("Hello CoffeeScript!")'

    it 'rejects a method invocation where unneeded parens are used', ->
      results = coffeelint.lint 'Math.pow(2, 3)', config
      expect(results.length).to.equal 1
      result = results[0]
      expect(result.rule).to.equal 'prefer_poet_mode'
      expect(result.lineNumber).to.equal 1
      expect(result.line).to.equal 'Math.pow(2, 3)'

    it 'rejects an invocation that takes a fn arg with unneeded parens', ->
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

    it 'rejects mixed explicit/implict parens if last use is explicit', ->
      input = """
      gulp.task('compile', ->
        gulp.src(src)
          .pipe(coffee())
          .pipe(gulp.dest('./src'))
      )
      """
      results = coffeelint.lint input, config
      expect(results.length).to.equal 1
