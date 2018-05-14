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

" Plugin configurations --
" (vim-buftabline)
if dein#is_sourced('vim-buftabline') == 1
	" display buffer number
	let g:buftabline_numbers = 1
	" colour tabline for molokai.
	hi BufTabLineCurrent	guifg=#F8F8F2	guibg=#111111 gui=bold
	hi BufTabLineActive	guifg=#F8F8F2	guibg=#606060
	hi BufTabLineHidden	guifg=#A0A0A0	guibg=#454545
	hi BufTabLineFill			guibg=#303030
endif
