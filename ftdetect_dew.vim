" copy/symlink to $HOME/.vim/ftdetect/dew.vim
autocmd BufRead,BufNewFile *.dew set filetype=dew
autocmd FileType dew nnoremap <buffer> <leader>f :%! ~/bin/dew/dew<CR>
