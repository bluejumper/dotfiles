" dein scripts --
if &compatible
  set nocompatible "Be iMproved
endif

" Required
set runtimepath+=/home/blue/.cache/dein/repos/github.com/Shougo/dein.vim

" Required
if dein#load_state('/home/blue/.cache/dein')
	call dein#begin('/home/blue/.cache/dein')

	" Let dein manage dein
	" Required
	call dein#add('/home/blue/.cache/dein/repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here:
	call dein#add('itchyny/lightline.vim')
	call dein#add('ap/vim-buftabline')
	"call dein#add('zefei/vim-wintabs') " Doesn't play with lightline.vim
	"call dein#add('fatih/vim-go')

	" Required
	call dein#end()
	call dein#save_state()
endif

" Required
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" end dein scripts --

" Options (set) --
set noshowmode " Disable editing mode display at bottom of tab.
set hidden " Allow buffers to preserve modifications and state by becoming 'hidden'.
set termguicolors
colorscheme molokai

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

" Colour
" vim-buftabline: suited for molokai.
if exists('g:buftabline_numbers')
	hi BufTabLineCurrent	guifg=#F8F8F2	guibg=#111111 gui=bold
	hi BufTabLineActive	guifg=#F8F8F2	guibg=#606060
	hi BufTabLineHidden	guifg=#A0A0A0	guibg=#454545
	hi BufTabLineFill			guibg=#303030
endif

" Variables (let) --
" vim-buftabline: display buffer number
let g:buftabline_numbers = 1

" Keybindings --
" vim-buftabline: mappings
noremap <C-h> :bprev<CR>
noremap <C-l> :bnext<CR>

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
