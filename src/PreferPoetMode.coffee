twoParensTogether = (api) ->
  prior = api.peek -1
  prior[0] is 'CALL_START' and prior[1] is '('

closingParenWasExplicit = (token) ->
  not token.generated

closingParenAtEndOfLine = (api) ->
  next = api.peek 1
  next[0] is 'TERMINATOR' and next[1] is '\n'

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
      a line ends with a function invocation with one or more
      arguments.
      '''
  constructor: ->

  tokens: ['CALL_END']

  lintToken: (token, api) ->

    return if twoParensTogether api

    if closingParenAtEndOfLine(api) and closingParenWasExplicit token
      context: 'found explicit function invocation'
