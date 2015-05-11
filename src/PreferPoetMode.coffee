module.exports = class PreferPoetMode
  rule:
    name: 'prefer_poet_mode'
    level: 'ignore'
    message: 'Prefer poet mode'
    description: '''
      TODO
      '''
  constructor: ->

  tokens: ['CALL_END']

  lintToken: (token, tokenApi) ->
    callEndwasGenerated = token.generated
