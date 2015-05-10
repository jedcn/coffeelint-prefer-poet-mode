module.exports = class PreferFewerParens
  rule:
    name: 'prefer_fewer_parens'
    level: 'ignore'
    message: 'Prefer fewer parens'
    description: '''
      TODO
      '''
  constructor: ->

  tokens: ['CALL_END']

  lintToken: (token, tokenApi) ->
    callEndwasGenerated = token.generated
