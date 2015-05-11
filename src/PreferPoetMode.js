(function() {
  var PreferPoetMode;

  module.exports = PreferPoetMode = (function() {
    PreferPoetMode.prototype.rule = {
      name: 'prefer_poet_mode',
      level: 'ignore',
      message: 'Prefer poet mode',
      description: 'This rule prohibits unneeded explicit parens on function\ncalls.\n<pre>\n<code># Some folks don\'t like this style of coding.\nmyFunction(a, b, c)\n# And would rather it always be written like this:\nmyFunction a, b, c\n</code>\n</pre>\nThis rulle enforces that implicit parens be used whenever\npossible since their use is\nidiomatic CoffeeScript.'
    };

    function PreferPoetMode() {}

    PreferPoetMode.prototype.tokens = ['CALL_END'];

    PreferPoetMode.prototype.lintToken = function(token, tokenApi) {
      var callEndwasGenerated;
      return callEndwasGenerated = token.generated;
    };

    return PreferPoetMode;

  })();

}).call(this);
