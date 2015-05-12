closingParenWasExplicit = (token) ->
  not token.generated

module.exports = class PreferPoetMode
  rule:
    name: 'prefer_poet_mode'
    level: 'ignore'
    message: 'Prefer poet mode'
    description: '''
      This rule prohibits unneeded explicit parens on function
      calls.
      <pre>
      <code># Some folks don't like this style of coding.
      myFunction(a, b, c)
      # And would rather it always be written like this:
      myFunction a, b, c
      </code>
      </pre>
      This rule enforces that implicit parens be used whenever
      possible since their use is idiomatic CoffeeScript.
      '''
  constructor: ->

  tokens: ['CALL_END']

  lintToken: (token, tokenApi) ->
    if closingParenWasExplicit token
      context: 'found explicit function invocation'
