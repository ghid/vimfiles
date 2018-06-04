source $VIMRUNTIME/vimrc_example.vim

" Setup minpac
source $HOME/vimfiles/packages.vim

" Customize VIM
language messages en
set cpoptions+=$
set diffopt=vertical
set encoding=utf-8
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
" colorscheme srcery
colorscheme falcon
" Put in a background colour for gui with use of falcon theme
if has("gui_running") && colors_name == "falcon"
  highlight Normal guifg=#d4d4d9 ctermfg=188 guibg=#0b0b1a ctermbg=233 gui=NONE cterm=NONE
  highlight NonText guifg=#3e3e40 ctermfg=237 guibg=#0b0b1a ctermbg=233 gui=NONE cterm=NONE
  highlight FoldColumn guifg=#646466 ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
endif

set listchars=tab:➔\ ,eol:↩
set showbreak=…\ 

" Maintain undo history between sessions
set undofile
set undodir=$HOME/vimfiles/undodir

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
noremap <leader>ef :tabnew<CR>:edit $HOME/vimfiles/autoload/functions.vim<CR>
noremap <leader>ep :tabnew<CR>:edit $HOME/vimfiles/packages.vim<CR>
noremap <F8> :TagbarToggle<CR>
noremap <F3> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
noremap <leader>/ :call functions#ToggleComment()<CR>
nnoremap <leader>R :!ahk %<CR><CR>
nnoremap <leader>D :!ahkd c v %<CR><CR>
nnoremap <leader>QQ :qa!<CR>
nnoremap <silent> <leader>ml :call functions#AppendModeline()<CR>

" Commands
command! -register CopyMatches call functions#CopyMatches(<q-reg>)

if has("autocmd")
	autocmd GUIEnter * simalt ~x
	filetype on
	filetype plugin indent on
	" augroup AHK
	" 	autocmd!
	" 	autocmd FileType autohotkey	setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab number
	" 	autocmd FileType autohotkey	let b:comment_leader="; "
	" 	autocmd FileType autohotkey	set commentstring=;%s
	" augroup END
	augroup BAT
		autocmd!
		autocmd FileType dosbatch	let b:comment_leader="rem "
	augroup END
	augroup VIMFILE
		autocmd!
		autocmd FileType vim 		let b:comment_leader="\" "
	augroup END
	augroup LUA
		autocmd!
		autocmd Filetype lua		let b:comment_leader="-- "
	augroup END
endif

" source $HOME\vimfiles\functions.vim

" Customize Lightline
let g:lightline = {
	\ 'colorscheme': 'falcon',
	\ 'active': {
	\	'left': [['mode', 'paste'],
	\		 ['gitbranch', 'readonly', 'filename', 'modified']]
	\ },
	\ 'component_expand': {
	\	'gitbranch': 'fugitive#head',
	\ },
	\ 'component_type': {
	\	'gitbranch': 'branch',
	\ }
	\ }

" Customize Tagbar
let g:tagbar_iconchars = ['▶', '◢']
let g:tagbar_autofocus = 1

" Customize UltiSnips
" let g:UltiSnipsSnippetsDir = $HOME . "/vimfiles/UltiSnips"
" let g:UltiSnipsEditSplit = "vertical"

" Customize SimpleSnippets
let g:SimpleSnippets_search_path = $HOME."/vimfiles/snippets/"

