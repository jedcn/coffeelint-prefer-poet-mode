# coffeelint-prefer-fewer-parens

Also known as "poet mode."

You should probably be explicit in your parens usage, but sometimes
you'd rather see less characters on the screen.

So, if you look at the following:

```coffeescript
eight = Math.pow(2, 3)
```

And your brain is saying, no, please, why not:

```coffeescript
eight = Math.pow 2, 3
```

Then this plugin might be for you.

## Installation

0. Setup CoffeeLint in your project and verify that it is working.
1. Add this module as a `devDependency`: `npm install -D coffee-lint-prefer-fewer-parens`
2. Update your `coffeelint.json` configuration file

## Configuration

Add the following snippet to your `coffeelint.json` config:

```json
{
  // other lint rules
  {
    "prefer_fewer_parens": {
      "module": "coffeelint-prefer-fewer-parens",
      "level": "error"
    }
  }
}
```
