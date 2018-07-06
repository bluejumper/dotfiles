" dein scripts --
if &compatible
  set nocompatible "Be iMproved
endif
set runtimepath+=/home/blue/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/blue/.cache/dein')
	call dein#begin('/home/blue/.cache/dein')
	call dein#add('/home/blue/.cache/dein/repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here:
	call dein#add('itchyny/lightline.vim')
	call dein#add('ap/vim-buftabline')
	call dein#add('vimwiki/vimwiki')
	"call dein#add('zefei/vim-wintabs') " Doesn't play with lightline.vim
	"call dein#add('fatih/vim-go')
	
	" To install new plugins:
	" :call dein#install()

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable
" end dein scripts --

" Plugin configurations --
" (vim-buftabline)
if dein#is_sourced('vim-buftabline') == 1
	let g:buftabline_numbers = 1 " Display buffer number.
endif

" (vimwiki)
if dein#is_sourced('vimwiki') == 1
	let g:vimwiki_conceallevel = 0 " vimwiki won't conceal any characters.
	let g:vimwiki_list = [{'path': '~/.wiki',
				\ 'syntax': 'markdown', 'ext': '.md' }]
endif
