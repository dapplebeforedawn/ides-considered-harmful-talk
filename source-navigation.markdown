# Source Code Navigation

## Finding Definitions
I once saw a RubyMine user dive into the HAML source code in like three clicks.  Granted, that wasn't what they wanted to do, and they had no idea what to do when they got there, but it was still cool.  VIM can do that too.  Please vacate my lawn. (`help :tags`)

### Getting Started
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

### Demonstration
open up `test_app/testfile.rb` and poke around with:
  - `^]`
  - `^T`
  - `:tn`
  - `:tp`

----
## Finding Invocations
Coming from the other direction, if you want to know where a method is used there is VIM's `grepprg`(`:help grepprg`) setting.

### Getting Started
By default VIM uses `grep` as the `grepprg`.  Grep is great, but it's also a little slow for even intermediate sized projects.  Let's install a faster alternative.

```bash
brew install the_silver_searcher
```

```vim
" ~/.vimrc
" use `ag` for grep'ing if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
```

### Demonstration
```vim
:grep Person
:cw
```

Now use the `k` and `j` keys in the `quickfix`(`:help quickfix`) window to select a find and jump to it.  `:cn` can be used to move to the next match too.

### Integrating with CtrlP
CtrlP is my preferred fuzzy-finder for VIM.  It's one of the few plugins I recommend.

```vim
" ~/.vimrc
" https://github.com/gmarik/vundle  <-- go here to learn how to install plugins in VIM
Bundle 'kien/ctrlp.vim'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
```

----
## Source Code Overview
When starting out in a new project it's nice to get an overview of how the project is laid out.  A common command line tool for this is `tree`.  Using tree and VIM's built-in file navigation keys, we can obviate the need for any "file drawer" plugins. (*cough* NerdTREE *cough*)

### Getting Started
```bash
brew install tree
```


### Demonstration
```vim
" read in from `tree`, the `-f` flag tells tree to show full paths
:r !tree -f test_app
```
(`:help :r`)(`:help :!`)

Now you'll have a buffer like this:
```
test_app
├── test_app/Gemfile
├── test_app/Gemfile.lock
├── test_app/Guardfile
├── test_app/README
├── test_app/README.rdoc
├── test_app/Rakefile
├── test_app/app
│   ├── test_app/app/assets
│   │   ├── test_app/app/assets/images
│   │   │   └── test_app/app/assets/images/rails.png
│   │   ├── test_app/app/assets/javascripts
```

To jump to any file put the cursor on any part of the filename and type `gf`(`:help gf`).  This can be combined with `CTRL+W` to open the file in a new tab `^Wgf`(`:help CTRL-W_gf`).

Remember to use VIM as it was intended.  Don't arrow down and over to a filename.  To get to the `Rakefile` try: `/Rake`(`:help /`) (followed by enter)

----
## One More Thing

Copy and paste this into your .vimrc

```vim
set listchars=trail:💩
```

Only amateurs leave trailing whitespace.
