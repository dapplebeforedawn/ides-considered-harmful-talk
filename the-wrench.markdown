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
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

let rspec_command = "clear \; spring rspec {spec}"
let rspec_options = " --require=support/vim_formatter.rb --format VimFormatter --out quickfix.out --format progress"
let g:rspec_command = "echom system('echo \"" . rspec_command . rspec_options . "\" >> run_specs')"
```
