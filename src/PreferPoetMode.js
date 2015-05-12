(function() {
  var PreferPoetMode, closingParenAtEndOfLine, closingParenWasExplicit;

  closingParenWasExplicit = function(token) {
    return !token.generated;
  };

  closingParenAtEndOfLine = function(token, tokenApi) {
    var next;
    next = tokenApi.peek(1);
    return next[0] === 'TERMINATOR' && next[1] === '\n';
  };

  module.exports = PreferPoetMode = (function() {
    PreferPoetMode.prototype.rule = {
      name: 'prefer_poet_mode',
      level: 'ignore',
      message: 'Prefer poet mode',
      description: 'This rule prohibits unneeded explicit parens on function\ncalls.\n<pre>\n<code># Some folks don\'t like this style of coding.\nmyFunction(a, b, c)\n# And would rather it always be written like this:\nmyFunction a, b, c\n</code>\n</pre>\nThis rule enforces that implicit parens be used whenever\npossible since their use is idiomatic CoffeeScript.'
    };

    function PreferPoetMode() {}

    PreferPoetMode.prototype.tokens = ['CALL_END'];

    PreferPoetMode.prototype.lintToken = function(token, tokenApi) {
      if (closingParenAtEndOfLine(token, tokenApi) && closingParenWasExplicit(token)) {
        return {
          context: 'found explicit function invocation'
        };
      }
    };

    return PreferPoetMode;

  })();

}).call(this);
