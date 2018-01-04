"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/blue/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/blue/.config/nvim/')
  call dein#begin('/home/blue/.config/nvim/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/blue/.config/nvim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('vim-airline/vim-airline')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

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

" Keep backup and temp files in ~/.vim/tmp
set backup
set backupdir=~/.vim/tmp
set dir=~/.vim/swp

set termguicolors
colorscheme molokai

" Keybindings.
imap \ <Esc>
