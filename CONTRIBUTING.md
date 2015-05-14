# Contributing

## Getting Started

After cloning the project, get started with:

    npm install && npm test

`npm test` will lint the code and run tests.

## Testing

Add test cases for what could be "more poetic" to
`test/PreferPoetModeTest.coffee`

Running `npm test` will both lint your code (using the code you are
developing) and run tests.

CircleCI is hooked up, and you can see the latest here:

https://circleci.com/gh/jedcn/coffeelint-prefer-poet-mode

## Running Before Publishing

If you'd like to see the results of running your changes to this
CoffeeLint Rule **before** they are published, you can push your code
up to a different fork/branch and then in a project with a bunch of
CoffeeScript you can configure this plugin by adding it as a
devDependency as follows:

```json
"devDependencies": {
  "coffeelint-prefer-poet-mode": "git://github.com/jedcn/coffeelint-prefer-poet-mode.git"
}
```

Except that you need to change `jedcn` to your user, and you can add
append a `#branch` or `#sha` if your code is not on the default branch
(likely `master`).

Then run an `npm install` and configure the plugin as described in the
[README.md][README.md].

[README.md]: ./README.md
