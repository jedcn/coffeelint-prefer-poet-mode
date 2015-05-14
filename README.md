# coffeelint-prefer-poet-mode

[![Circle CI](https://circleci.com/gh/jedcn/coffeelint-prefer-poet-mode.svg?style=svg)](https://circleci.com/gh/jedcn/coffeelint-prefer-poet-mode)

    It takes courage to grow up and become who you really are.
    - e e cummings

---

If you like to live safely, you should probably be explicit in your
paren usage..

But sometimes, **sometimes..**

You pay close attention to the characters on the screen.

And then you start paying as much attention to whitespace as you do to
the non-whitespace.

And once you start thinking that every **single character** matters,
and you look at code like this:

```coffeescript
eight = Math.pow(2, 3)
```

And you think, "Argh! That's ghastly! Why not write it like this?"

```coffeescript
eight = Math.pow 2, 3
```

Phew! So much better.

And if you think like this, well, this [coffeelint][coffeelint.org]
custom rule might be for you.

[coffeelint.org]: http://www.coffeelint.org/

## Installation

0. Setup CoffeeLint in your project and verify that works and uncovers
   problems.
1. Add this module as a `devDependency`: `npm install -D coffeelint-prefer-poet-mode`.
2. Update your `coffeelint.json` configuration file as described below.
3. Modify coffeelint to use this customm rule. For example, If you run
   `coffeelint` from the command line, you might do this:
   `--rules node_modules/coffeelint-prefer-poet-mode`

## Configuration

Add the following snippet to your `coffeelint.json` config:

```json
{
  "prefer_poet_mode": {
    "module": "coffeelint-prefer-poet-mode",
    "level": "warn"
  }
}
```
