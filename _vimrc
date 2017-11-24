source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

" Setup minpac
set packpath^=$VIM\vimfiles
packadd minpac
call minpac#init()

" Add plugins
call minpac#add("dracula/vim")
call minpac#add("vim-airline/vim-airline")
" call minpac#add("vim-airline/vim-airline-themes")
call minpac#add("SirVer/ultisnips")
call minpac#add("majutsushi/tagbar")
call minpac#add("tpope/vim-fugitive", {"type": "opt"})
call minpac#add("k-takata/minpac", {"type": "opt"})

" Customize VIM
language messages en
set cpoptions+=$
set diffopt=vertical
set encoding=utf-8
set guifont=DejaVu_Sans_Mono_for_Powerline:h11.5
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
colorscheme dracula

set listchars=tab:↦\ ,eol:↲
set showbreak=…

" Setup grep program
set grepprg=mack\ --nogroup\ --column\ -k\ --nocolor\ $*
set grepformat=%f:%l:%c:%m

" Setup scp
let g:netrw_scp_cmd='C:\"Program Files (x86)"\PuTTY\pscp.exe -q'
let g:netrw_silent=1

" Mappings
nmap <leader>l :set list!<CR>
nmap <leader>h :set hlsearch!<CR>
nmap <leader>r :set relativenumber<CR>
nmap <F8> :TagbarToggle<CR>
map  <F3> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

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

" Customize airline plugin
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.notexists = '∄'

let g:airline#extensions#tabline#enabled = 1

" Customize Tagbar
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autofocus = 1

if has("autocmd")
	filetype on
	autocmd FileType autohotkey	setlocal ts=4 sts=4 sw=4 noexpandtab autoindent number
	autocmd FileType autohotkey	let b:comment_leader=";"
endif

" Customize UltiSnips
let g:UltiSnipsSnippetsDir = $VIM . "/vimfiles/UltiSnips"
let g:UltiSnipsEditSplit = "vertical"

