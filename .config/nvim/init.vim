"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/blue/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/blue/.cache/dein')
  call dein#begin('/home/blue/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/blue/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('vim-airline/vim-airline')
  call dein#add('fatih/vim-go')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
"

" Options

set termguicolors
colorscheme molokai
"
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

" Variables

" NOTE- Use as keyboard shortcut instead.
let g:go_fmt_command = "goimports"

" Keybindings.

