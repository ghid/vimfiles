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
set renderoptions=type:directx,renmode:5,taamode:1,gamma:20,contrast:1,geom:1
" https://github.com/tonsky/FiraCode/releases
set guifont=Fira_Code_Retina:h14:cANSI:qDRAFT
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
set listchars=tab:\⡇\ ,eol:¬
set showbreak=…
set wildignore+=NTUSER.DAT*,.git/**,node_modules/**
" set scrolloff=999
"}}}2

"{{{2 Customize Colorscheme
colorscheme OceanicNext
" if(strftime("%h")>=8 && strftime("%h")<=16)
	" colorscheme typewriter
	" set background=light
	" let s:lightline_colorscheme = 'pencil_light'
" else
	" colorscheme typewriter-night
	" set background=dark
	" let s:lightline_colorscheme = 'pencil_dark'
" endif
if (has("termguicolors"))
	set termguicolors
endif
" let g:pencil_terminal_italics = 0
" let g:pencil_higher_contrast_ui = 1
" let g:monochrome_italic_comments = 1
" colorscheme monochrome
" Put in a background colour for gui with use of falcon theme
if has("gui_running") && has("colors_name") && colors_name == "falcon"
	let g:falcon_lightline = 1
	highlight Normal guifg=#d4d4d9 ctermfg=188 guibg=#0b0b1a ctermbg=233 gui=NONE cterm=NONE
	highlight NonText guifg=#3e3e40 ctermfg=237 guibg=#0b0b1a ctermbg=233 gui=NONE cterm=NONE
	highlight FoldColumn guifg=#646466 ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
	ljasldjj
endif
" highlight ColorColumn ctermbg=NONE ctermfg=white guibg=red guifg=white
" highlight ColorColumn guibg=#343D46 guifg=white
call matchadd('ColorColumn', '\%82v', 100)
"}}}2

"{{{2 Maintain undo history between sessions
set undofile
set undodir=$HOME/vimfiles/undodir
"}}}

"{{{2 Setup netrw 
" let g:netrw_banner = 1
" let g:netrw_liststyle = 1
" let g:netrw_browse_split = 4
" let g_netrw_altv = 1
" let g:netrw_winsize = 25
" let g:netrw_keepdir = 0
"}}}

"{{{2 Setup grep program 
set grepprg=mack\ --nogroup\ --column\ -k\ --nocolor\ --filename\ $*
set grepformat=%f:%l:%c:%m
"}}}2

"{{{2 Setup scp
let g:netrw_scp_cmd='C:\"Program Files"\PuTTY\pscp.exe -q'
let g:netrw_silent=1
"}}}2

"{{{2 Setup shell
" set shell=c:\Windows\System32\cmd.exe\ /k\ c:\opt\cmder\vendor\init.bat
"}}}2

"{{{2 Mappings
let mapleader=","
nnoremap <F5> <C-l>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>ch :let @/=''<CR>
nnoremap <leader>r :set relativenumber!<CR>
vnoremap <leader>c "+y
vnoremap <leader>x "+x
noremap <leader>p "+p
noremap <leader>ev :tabnew<CR>:edit $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>:call functions#SetupCanvas()<CR>
noremap <leader>ef :tabnew<CR>:edit $HOME/vimfiles/autoload/functions.vim<CR>
noremap <leader>ep :tabnew<CR>:edit $HOME/vimfiles/packages.vim<CR>
noremap <expr> <leader>es ":vsplit $HOME/vimfiles/snippets/" . &filetype . "<CR>"
noremap <leader>/ :call functions#ToggleComment()<CR>
nnoremap <leader>R :!ahk %<CR><CR>
nnoremap <leader>D :!ahkd c v %<CR><CR>
nnoremap <leader>QQ :qa!<CR>
" nnoremap <leader>y :YcmCompleter 
" nnoremap <leader>C :ColorToggle<CR>
nnoremap <silent> <leader>ml :call functions#AppendModeline()<CR>
inoremap <C-l> <right>
inoremap <S-Return>	<C-o>A
inoremap <C-Return> <C-o>o
noremap <C-n> :NERDTreeToggle<CR>
inoremap <C-BS> <Esc>diwa
nnoremap <leader>al :ALELint<CR>
nnoremap <leader>an :ALENext<CR>
nnoremap <leader>ap :ALEPrevious<CR>
nnoremap <leader>c :HexokinaseRefresh<CR>
nnoremap <leader>H :HexokinaseToggle<CR>
"}}}2

"{{{2 Commands
command! -register CopyMatches call functions#CopyMatches(<q-reg>)
"}}}2

"{{{2 Auto Commands
if has("autocmd")
	autocmd GUIEnter * call functions#SetupCanvas()
	filetype on
	filetype plugin indent on
	set omnifunc=syntaxcomplete#Complete
	augroup VIM
		autocmd!
		autocmd FileType vim 
					\ setlocal tabstop=4 shiftwidth=4 softtabstop=4
					\ number expandtab autoindent
		autocmd FileType vim let b:comment_leader="\" "
	augroup END
	augroup BAT
		autocmd!
		autocmd FileType dosbatch
					\ setlocal tabstop=4 shiftwidth=4 softtabstop=4
					\ number noexpandtab autoindent
					\ textwidth=80
		autocmd FileType dosbatch let b:comment_leader="rem "
	augroup END
	augroup LUA
		autocmd!
		autocmd FileType lua
					\ setlocal number autoindent noexpandtab textwidth=80
					\ tabstop=4 shiftwidth=4 softtabstop=4
		autocmd FileType lua let b:comment_leader="-- "
	augroup END
	augroup WEB
		autocmd!
		autocmd FileType css,scss,sass,html,json,yaml
					\ setlocal tabstop=2 shiftwidth=2 softtabstop=2
					\ noexpandtab number autoindent
					\ textwidth=80
	augroup END
	augroup MARKDOWN
		autocmd!
		autocmd FileType markdown setlocal textwidth=80
	augroup END
	augroup PY
		autocmd!
		autocmd FileType python
					\ setlocal number autoindent expandtab textwidth=80
					\ tabstop=4 shiftwidth=4 softtabstop=0 smarttab
		autocmd FileType python let b:comment_leader="#"
		autocmd FileType python let b:ale_fixers = ["black", "mypy"]
	augroup END
	augroup HASKELL
		autocmd!
		autocmd FileType haskell,lhaskell
					\ setlocal number autoindent expandtab textwidth=80
					\ tabstop=4 shiftwidth=4 softtabstop=0 smarttab
					\ nocindent
		autocmd FileType haskell let b:comment_leader="-- "
	augroup END
	" autocmd FileType * if(&textwidth != 0)
				" \ |		let &colorcolumn=&textwidth+1
				" \ | endif
	" augroup ProjectDrawer
		" autocmd!
		" autocmd VimEnter * :Vexplore
	" augroup END
endif
"}}}2


" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <C-x> :call <SID>SynStack()<CR>
"}}}1

"{{{1 Plugin Customization
"{{{2 Lightline
let g:lightline = {
			\	'colorscheme': 'oceanicnext',
			\	'component': {
			\		'percent': '≡%3p%%',
			\		'lineinfo': ' %3l:%-3v'
			\	},
			\   'component_type': {
			\       'lint_errors': 'error',
			\       'lint_warnings': 'warning'
			\   },
			\	'component_expand': {
			\		'gitbranch': 'functions#LightlineFugitive',
			\		'readonly': 'functions#LightlineReadonly'
			\	},
			\   'separator': { 'left': '', 'right': '' },
			\   'subseparator': { 'left': '|', 'right': '|' },
			\	'component_function': {
			\		'filename': 'functions#LightlineFilename',
			\		'filetype': 'functions#LightlineDevIconFiletype',
			\       'fileencoding': 'functions#LightlineFileencodingAndFormat',
			\       'lint_ok': 'functions#LightlineALEOk',
			\       'lint_errors': 'functions#LightlineALEErrors',
			\       'lint_warnings': 'functions#LightlineALEWarnings'
			\	},
			\	'active': {
			\		'left': [['mode', 'paste'],
			\			['gitbranch', 'filename'],
			\			['fileencoding', 'filetype', 'readonly']],
			\		'right': [['lineinfo'],
			\			['percent'],
			\			['lint_ok', 'lint_warnings', 'lint_errors']]
			\	}
			\ }
			" \   'separator': { 'left': '', 'right': '' },
			" \   'subseparator': { 'left': '', 'right': '' },
"}}}2

"{{{2 Emmet
let g:user_emmet_leader_key = '<c-z>'
"}}}2

"{{{2 YouCompleteMe
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_key_list_previous_completion = ['<Down>']
" let g:ycm_key_list_previous_completion = ['<Down>']
" let g:ycm_key_list_select_completion = ['<Right>']
" let g:ycm_key_list_stop_completion = ['<C-y']
" " let g:ycm_use_ultisnips_completer = 0 
" " let g:ycm_enable_diagnostic_signs = 0
" " let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_add_preview_to_completeopt = 0
" set completeopt-=preview
"}}}2

"{{{2 SnipMate
let g:snipMate = {}
let g:snipMate.description_in_completion = 1
"}}}2

"{{{2 Tagbar
" let g:tagbar_iconchars = ['', '']
" let g:tagbar_autofocus = 1
"}}}2

"{{{2 CtrlP 
let g:ctrlp_custom_ignore = '\v[\/]node_modules|\v[\/]\.(git|svn|hg)$'
"}}}2

"{{{2 NERDTree
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeQuitOnOpen = 1 
"}}}2

"{{{2 Syntastic
" let g:syntastic_javascript_checkers = ["eslint"]
" let g:syntastic_javascript_eslint_exe = "eslint"
" let g:syntastic_javascript_arg = " "
" let g:syntastic_check_on_open = 0
" let g:syntasitc_check_on_wq = 0
" let g:syntastic_map_mode = { "mode": "passive" }
" let g:syntastic_stl_format = "%F;%e;%w"
"}}}2

"{{{2 Ale
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
" let g:ale_sign_error = "⌦"
let g:ale_jq_executable = "C:/opt/bin/jq.exe"
"}}}2

"{{{2 vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1
"}}}2
"
"{{{2 Hexokinase
packadd vim-hexokinase
let g:Hexokinase_ftAutoload = ["css", "xml", "html", "scss", "sass"]
" let g:Hexokinase_patterns = { "\\c\\<\\(" . join(keys(functions#HexokinaseColorNamesGet()), "\\|") . "\\)\\>": function("functions#HexokinaseHtmlColorNames")}
let g:Hexokinase_patterns[hexokinase#patterns#colour_names#get_pattern()] = function('hexokinase#patterns#colour_names#process')
"}}}2

"{{{2 haskell-vim
let g:haskell_classic_highlighting = 1
"}}}2
"}}}1

" vim:tw=78:ts=4:sts=4:sw=4:noet:ft=vim:nobomb
" vim:fdm=marker:fdl=1
