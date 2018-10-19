source $VIMRUNTIME/vimrc_example.vim

"{{{1 General Customization
"{{{2 Setup minpac
source $HOME/vimfiles/packages.vim
"}}}

"{{{2 Customize VIM 
language messages en
set nobackup
set cpoptions+=$
set diffopt=vertical
set encoding=utf-8
set guifont=FantasqueSansMono_NF:h13:cANSI:qDRAFT
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
set cursorline
set formatoptions-=t
set listchars=tab:┆\ ,eol:¬
set showbreak=…\ 
"}}}2

"{{{2 Customize Colorscheme
colorscheme falcon
set termguicolors
let g:falcon_lightline = 1
" Put in a background colour for gui with use of falcon theme
if has("gui_running") && colors_name == "falcon"
  highlight Normal guifg=#d4d4d9 ctermfg=188 guibg=#0b0b1a ctermbg=233 gui=NONE cterm=NONE
  highlight NonText guifg=#3e3e40 ctermfg=237 guibg=#0b0b1a ctermbg=233 gui=NONE cterm=NONE
  highlight FoldColumn guifg=#646466 ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
endif
highlight ColorColumn ctermbg=red ctermfg=white guibg=#151521
"}}}2

"{{{2 Maintain undo history between sessions
set undofile
set undodir=$HOME/vimfiles/undodir
"}}}

"{{{2 Setup netrw 
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g_netrw_altv = 1
" let g:netrw_winsize = 25
"}}}

"{{{2 Setup grep program 
set grepprg=mack\ --nogroup\ --column\ -k\ --nocolor\ --filename\ $*
set grepformat=%f:%l:%c:%m
"}}}2

"{{{2 Setup scp
let g:netrw_scp_cmd='C:\"Program Files"\PuTTY\pscp.exe -q'
let g:netrw_silent=1
"}}}2

"{{{2 Mappings
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
noremap <expr> <leader>es ":vsplit $HOME/vimfiles/snippets/" . &filetype . "<CR>"
noremap <leader>/ :call functions#ToggleComment()<CR>
nnoremap <leader>R :!ahk %<CR><CR>
nnoremap <leader>D :!ahkd c v %<CR><CR>
nnoremap <leader>QQ :qa!<CR>
nnoremap <leader>y :YcmCompleter 
nnoremap <leader>C :ColorToggle<CR>
nnoremap <silent> <leader>ml :call functions#AppendModeline()<CR>
inoremap '	''<left>
inoremap `	``<left>
inoremap "	""<left>
inoremap (	()<left>
inoremap {	{}<left>
inoremap [	[]<left>
inoremap <C-l>	<right>
inoremap <C-Bs>	<left>
inoremap <C-x>	<C-o>x
inoremap <C-Return>	<C-o>A
inoremap <S-Return>	<CR><C-o>==<C-o>O
imap <C-Tab> <Plug>snipMateShow
"}}}2

"{{{2 Commands
command! -register CopyMatches call functions#CopyMatches(<q-reg>)
"}}}2

"{{{2 Auto Commands
if has("autocmd")
	autocmd GUIEnter * simalt ~x
	filetype on
	filetype plugin indent on
	augroup VIM
		autocmd!
		autocmd FileType vim 
					\ setlocal tabstop=4 shiftwidth=2 softtabstop=2
					\ number noexpandtab autoindent
		autocmd FileType vim let b:comment_leader="\" "
	augroup END
	augroup BAT
		autocmd!
		autocmd FileType dosbatch let b:comment_leader="rem "
	augroup END
	augroup LUA
		autocmd!
		autocmd FileType lua let b:comment_leader="-- "
	augroup END
	augroup WEB
		autocmd!
		autocmd FileType css,scss,sass,html
					\ setlocal tabstop=2 shiftwidth=2 softtabstop=2
					\ noexpandtab number autoindent
					\ textwidth=80
	augroup END
	autocmd FileType * let &colorcolumn=&textwidth+1
	" augroup ProjectDrawer
		" autocmd!
		" autocmd VimEnter * :Vexplore
	" augroup END
endif
"}}}2
"}}}1

"{{{1 Plugin Customization
"{{{2 Lightline
let g:lightline = {
			\	'colorscheme': 'falcon',
			\	'active': {
			\		'left': [['mode', 'paste'],
			\			['gitbranch'],
			\			['readonly', 'filename']]
			\	},
			\	'component': {
			\		'percent': '%3p%%',
			\		'lineinfo': ' %3l:%-2v'
			\	},
			\	'component_expand': {
			\		'gitbranch': 'functions#LightlineFugitive',
			\		'readonly': 'functions#LightlineReadonly'
			\	},
			\	'component_function': {
			\		'filename': 'functions#LightlineFilename',
			\		'filetype': 'functions#DevIconFiletype',
			\		'fileformat': 'functions#DevIconFileformat'
			\	}
			\ }
"}}}2

"{{{2 Tagbar
" let g:tagbar_iconchars = ['▶', '◢']
" let g:tagbar_autofocus = 1
"}}}2

"{{{2 Emmet
let g:user_emmet_leader_key = '<c-z>'
"}}}2

"{{{2 YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_key_list_previous_completion = []
" let g:ycm_key_list_select_completion = []
let g:ycm_use_ultisnips_completer = 0 
let g:ycm_enable_diagnostic_signs = 0
"}}}2

"{{{2 SnipMate
let g:snipMate = {}
let g:snipMate.description_in_completion = 1
"}}}2

"{{{2 CtrlP 
let g:ctrlp_custom_ignore = '\v[\/]node_modules|\v[\/]\.(git|svn|hg)$'
"}}}2
"}}}1

" vim:tw=78:ts=4:sts=4:sw=4:noet:ft=vim:nobomb
" vim:fdm=marker:fdl=1
