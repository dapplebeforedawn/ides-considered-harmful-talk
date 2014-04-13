# The Wrench

> Using the concurrency primitives that your shell gives you.

## Setup
```bash
mkfifo run_anything
```

```bash
while true; do sh -c "`cat run_anything`"; done
```

## Getting Leverage
```vim
" Vundle package
Bundle 'thoughtbot/vim-rspec'

" vim-rspec mappings
nnoremap <Leader>specf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>specn :call RunNearestSpec()<CR>
nnoremap <Leader>spec :call RunLastSpec()<CR>
nnoremap <Leader>speca :call RunAllSpecs()<CR>

let rspec_command = "clear \; spring rspec {spec}"
let rspec_options = " --require=support/formatters/vim_formatter.rb --format VimFormatter --out quickfix.out --format progress"
let g:rspec_command = "echom system('echo \"" . rspec_command . rspec_options . "\" >> run_specs')"
```

## Got Any More?
```vim
:cg quickfix.out
:cw
```

`vim_formatter.rb` outputs the spec results in to a format that can be read by VIM's quickfix buffer.

