source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

" Setup minpac
source $VIM/vimfiles/packages.vim

" Customize VIM
language messages en
set cpoptions+=$
set diffopt=vertical
set encoding=utf-8
" set guifont=DejaVu_Sans_Mono_for_Powerline:h11.5
set guifont=Hack:h10.5
set guioptions=-TMrL
set guioptions=c
set guitablabel=%N\ %t\ %M
set langmenu=en_US.UTF-8
set laststatus=2
set nocompatible
set noerrorbells
set noshowmode
set path+=**
set visualbell
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim
" colorscheme dracula
" colorscheme luna
" colorscheme monokai
" colorscheme srcery-drk
" colorscheme srcery
colorscheme falcon
highlight FoldColumn guifg=#646466 ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

set listchars=tab:→\ ,eol:↲
set showbreak=…

" Maintain undo history between sessions
set undofile
set undodir=$VIM/vimfiles/undodir

" Setup grep program
set grepprg=mack\ --nogroup\ --column\ -k\ --nocolor\ $*
set grepformat=%f:%l:%c:%m

" Setup scp
let g:netrw_scp_cmd='C:\"Program Files"\PuTTY\pscp.exe -q'
let g:netrw_silent=1

" Mappings
let mapleader=","
nnoremap <leader>l :set list!<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>ch :let @/=''<CR>
nnoremap <leader>r :set relativenumber!<CR>
vnoremap <leader>c "+y
vnoremap <leader>x "+x
noremap <leader>p "+p
noremap <leader>ev :tabnew<CR>:edit $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>:simalt ~x<CR>
noremap <leader>ep :tabnew<CR>:edit $VIM/vimfiles/packages.vim<CR>
noremap <F8> :TagbarToggle<CR>
noremap <F3> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

if !exists("*MyDiff")
  set diffexpr=MyDiff()
  function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        if empty(&shellxquote)
          let l:shxq_sav = ''
          set shellxquote&
        endif
        let cmd = '"' . $VIMRUNTIME . '\diff"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
      let &shellxquote=l:shxq_sav
    endif
  endfunction
endif

source $VIM\vimfiles\functions.vim

" Customize Lightline
let g:lightline = {
	\ 'active': {
	\	'left': [['mode', 'paste'],
	\		 ['gitbranch', 'readonly', 'filename', 'modified']]
	\ },
	\ 'component_function': {
	\	'gitbranch': 'gitbranch#name'
	\ },
	\ }

" Customize Tagbar
let g:tagbar_iconchars = ['▶', '▼']
let g:tagbar_autofocus = 1

if has("autocmd")
	autocmd GUIEnter * simalt ~x
	filetype on
	autocmd FileType autohotkey	setlocal ts=4 sts=4 sw=4 noexpandtab autoindent number
	autocmd FileType autohotkey	let b:comment_leader=";"
endif

" Customize UltiSnips
let g:UltiSnipsSnippetsDir = $VIM . "/vimfiles/UltiSnips"
let g:UltiSnipsEditSplit = "vertical"

