" Options (set) --
set noshowmode " Disable editing mode display at bottom of tab.
set hidden " Allow buffers to preserve modifications and state by becoming 'hidden'.
set termguicolors
" Keep backup and temp files in ~/.vim/tmp
set backup
set backupdir=~/.vim/tmp
set dir=~/.vim/swp
" Show line numbers, relative number on focused buffer only.
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained	* set relativenumber
	autocmd BufLeave,FocusLost	* set norelativenumber
augroup END

" Variables (let) --

" Colour
colorscheme molokai

" Keybindings --
" buffer mappings
noremap <C-h> :bprev<CR>
noremap <C-l> :bnext<CR>

" (add plugin sauce)
source ~/.config/nvim/plugin.vim

" vim-wintabs: mappings
"map <C-h> <Plug>(wintabs_previous)
"map <C-l> <Plug>(wintabs_next)
"map <C-t>q <Plug>(wintabs_close)
"map <C-t>u <Plug>(wintabs_undo)
"map <C-t>o <Plug>(wintabs_only)
"map <C-w>c <Plug>(wintabs_close_window)
"map <C-w>o <Plug>(wintabs_only_window)
"command! Tabc <Plug>(wintabs_close_vimtab)
"command! Tabo <Plug>(wintabs_only_vimtab)
