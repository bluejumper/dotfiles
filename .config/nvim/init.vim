colorscheme molokai

" (Variables) let

" (Options) set
set noshowmode " Disable editing mode display at bottom of window.
set hidden " Allow buffers to preserve modifications and state by becoming 'hidden'.
set termguicolors
set colorcolumn=80 " Display a coloured line at the 80th column.
set conceallevel=0 " No characters are hidden.
set tabstop=8 " The number of spaces a tab character consumes.
set expandtab " Insert spaces when pressing the tab key.
set shiftwidth=4 " The number of spaces to use when (auto)indenting.
" Keep backup and temp files in ~/.vim/tmp
set backup
set backupdir=~/.vim/tmp
set dir=~/.vim/swp

" (Autocommands)
" Show line numbers, relative number on focused buffer only.
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained    * set relativenumber
    autocmd BufLeave,FocusLost      * set norelativenumber
augroup END
" Store name of buffer that was last deleted.
autocmd BufDelete * let g:latest_deleted_buffer = expand("<afile>:p")
" Use wordwrapping at column 80 for markdown documents.
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" (Keybindings)
" buffer mappings
noremap <C-h> :bprev<CR>
noremap <C-l> :bnext<CR>
noremap <C-x> :bd<CR>
" Restore the last deleted buffer.
noremap <C-u> :edit <C-R>=fnameescape(g:latest_deleted_buffer)<CR><CR>

" (add plugin sauce)
source ~/.config/nvim/plugin.vim
