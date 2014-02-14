# Skywriter
[![Build Status](https://travis-ci.org/otherinbox/skywriter.png?branch=master)](https://travis-ci.org/otherinbox/skywriter)
[![Code Climate](https://codeclimate.com/github/otherinbox/skywriter.png)](https://codeclimate.com/github/otherinbox/skywriter)

Skywriter makes writing CloudFormation templates easier.

Writing and, more importantly, maintaining large JSON files can be a real pain.
Skywriter aims to alleviate some of that pain by letting you use code to
generate the JSON and, instead, maintain a Ruby file. Defining your template in
runnable code provides some benefits like variable assignment, that make the
need to use CloudFormation's build-in functions superfluous (of course,
Skywriter still has helpers for those functions, if you need them).


## Features

### Automatic Dependencies

When you are creating a resource, references to other resources will be added to
the `DependsOn` key automatically. If you have additional dependencies which
should be included in this key, they can be declared like this:

``` ruby
Resource.new("ResourceName", additional_dependencies: ['foo', 'bar'])
```

See the example section below for some more concrete examples.


## Examples

*(Peter is writing some, which should go here)*


## Contributing

Help is gladly welcomed. If you have a feature you'd like to add, it's much more
likely to get in (or get in faster) the closer you stick to these steps:

1. Open an Issue to talk about it. We can discuss whether it's the right
  direction or maybe help track down a bug, etc.
1. Fork the project, and make a branch to work on your feature/fix. Master is
  where you'll want to start from.
1. Turn the Issue into a Pull Request. There are several ways to do this, but
  [hub](https://github.com/defunkt/hub) is probably the easiest.
1. Make sure your Pull Request includes tests.
1. Bonus points if your Pull Request updates `CHANGES.md` to include a summary
   of your changes and your name like the other entries. If the last entry is
   the last release, add a new `## Unreleased` heading.

If you don't know how to fix something, even just a Pull Request that includes a
failing test can be helpful. If in doubt, make an Issue to discuss.


## Copyright

Copyright © 2014 Return Path.

This gem is distributed under the MIT License. See [LICENSE.md](LICENSE.md) for
details.
