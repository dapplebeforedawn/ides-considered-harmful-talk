# Source Code Navigation

## Motivation
I once saw a RubyMine user dive into the HAML source code in like three clicks.  Granted, that wasn't what they wanted to do, and they had no idea what to do when they got there, but it was still cool.  VIM can do that too.  Please vacate my lawn.

## Getting Started
The version of ctags that installs with OSX's developer tools sucks:

```bash
brew install ctags
```

`~/.ctags` configuration file:
```
--recurse=yes
--sort=no
--exclude=.git
--exclude=log
```

Build tags for your project:
```bash
ctags
```

Build tags for your project and all gems
```bash
bundle list --paths | ctags -L - .
```

## Demonstration
> open up `test_app/testfile.rb` and poke around with:
  - `^]`
  - `^T`
  - `:tn`
  - `:tp`
