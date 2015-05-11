# coffeelint-prefer-poet-mode

If you like to live safely, you should probably be explicit in your
parens usage..

But sometimes, sometimes you'd rather see less characters on the
screen.

So, if you look at the following:

```coffeescript
eight = Math.pow(2, 3)
```

And your brain is saying, no, please, why not:

```coffeescript
eight = Math.pow 2, 3
```

Then this CoffeeLint Custom Rule might be for you.

## Installation

0. Setup CoffeeLint in your project and verify that it is working.
1. Add this module as a `devDependency`: `npm install -D coffee-lint-prefer-fewer-parens`
2. Update your `coffeelint.json` configuration file

## Configuration

Add the following snippet to your `coffeelint.json` config:

```json
{
  {
    "prefer_poet_mode": {
      "module": "coffeelint-prefer-poet-mode",
      "level": "error"
    }
  }
}
```
