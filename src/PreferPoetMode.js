(function() {
  var PreferPoetMode, closingParenWasExplicit;

  closingParenWasExplicit = function(token) {
    return !token.generated;
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
      if (closingParenWasExplicit(token)) {
        return {
          context: 'found explicit function invocation'
        };
      }
    };

    return PreferPoetMode;

  })();

}).call(this);
