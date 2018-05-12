" dein scripts --
if &compatible
  set nocompatible               " Be iMproved
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
set termguicolors
colorscheme molokai
set noshowmode

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
" vim-buftabline: show buffer number
 let g:buftabline_numbers = 1

" Keybindings --
" vim-buftabline: jump to buffer
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)
