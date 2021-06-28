source $VIMRUNTIME/vimrc_example.vim

"{{{1 General Customization
"{{{2 Setup minpac
" source $HOME/vimfiles/packages.vim
"}}}

"{{{2 Setup vim-plug
source $HOME/vimfiles/plugged.vim
"}}}

"{{{2 Customize VIM 
language messages en
" set guifont=Fira_Code_Medium:h14:W500:cANSI:qCLEARTYPE{{{}}}
" set guitablabel=%N\ %t\ 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set colorcolumn=80
set signcolumn=yes
set nocursorline
set cpoptions+=$
set diffopt=vertical
set directory=$HOME/vimfiles/swapdir
set encoding=utf-8
set formatoptions-=o
" set guifont=Victor_Mono_Medium:h16:W500:cANSI:qDRAFT
" set guifont=VictorMono_Nerd_Font_Mono:h16:W600:cANSI:qDRAFT
set guicursor=i-v-n:block-blinkon0
" set guifont=CaskaydiaCove_Nerd_Font_Mono:h14:cANSI:qDRAFT
set guifont=Cascadia_Code_iCursive_Cg:h14:cANSI:qDRAFT
" set guifont=Fira_Code_iCursive_S12:h15:cANSI:qDRAFT
set guioptions=-TMrL
set guioptions=c
set hidden
set incsearch
set langmenu=en_US.UTF-8
set laststatus=2
set listchars=tab:\›\ ,eol:¬
set nocompatible
set relativenumber
set number
set cursorline
set noerrorbells
set belloff=all
set noshowmode
set path+=**
set pythonthreedll=python39.dll
set renderoptions=type:directx,renmode:5,taamode:1,gamma:10,contrast:1,geom:1
set scrolloff=8
set showbreak=●
set showtabline=2
set smartindent
set wildignore+=NTUSER.DAT*,.git/**,node_modules/**
if filereadable($HOME . "/vimfiles/" . $MYVIMPROFILE) | source $HOME/vimfiles/$MYVIMPROFILE | endif
"}}}2

"{{{2 Customize Colorscheme
if (has("termguicolors"))
	set termguicolors
endif
if (strftime("%H")>=8 && strftime("%H")<=18)
	" colorscheme yang
	set background=light
else
	" colorscheme yin
	set background=dark
endif
set background=dark
colorscheme gruvbox-material
" colorscheme yui
" colorscheme nofrils-acme
" call functions#TweakHighlights()
" highlight CursorLine guibg=NONE guifg=NONE gui=underline
"}}}2

"{{{2 Maintain undo history between sessions
set noswapfile
set nobackup
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
" let g:netrw_scp_cmd='C:\"Program Files"\PuTTY\pscp.exe -q'
let g:netrw_scp_cmd='C:/msys64/mingw64/bin/pscp.exe -q'
let g:netrw_silent=1
"}}}

"{{{2 Setup grep program 
set grepprg=mack\ --nogroup\ --column\ -k\ --nocolor\ --filename\ $*
set grepformat=%f:%l:%c:%m
"}}}2

"{{{2 Setup shell
" set shell=c:\Windows\System32\cmd.exe\ /k\ c:\opt\cmder\1.3.12\vendor\init.bat
set shell=c:\Windows\System32\cmd.exe
" set shell=c:/msys64/usr/bin/bash
"}}}2

"{{{2 Mappings
let mapleader = " "
nnoremap <F5> :redraw!
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>C <C-w>c
nnoremap <leader>L :set list!<CR>
nnoremap <leader>ch :let @/=''<CR>
vnoremap <leader>c "+y
vnoremap <leader>x "+x
noremap <leader>p "+p
noremap <leader>ev :tabnew<CR>:edit $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>:call functions#SetupCanvas()<CR>
noremap <leader>ef :tabnew<CR>:edit $HOME/vimfiles/autoload/functions.vim<CR>
noremap <leader>ep :tabnew<CR>:edit $HOME/vimfiles/plugged.vim<CR>
noremap <expr> <leader>es ":vsplit $HOME/vimfiles/ftplugin/" . &filetype . "/" . &filetype . ".xpt.vim<CR>"
noremap <leader>/ :call functions#ToggleComment()<CR>
nnoremap <leader>R :QuickRun<CR>
vnoremap <leader>R :QuickRun<CR>
nnoremap <leader>QQ :qa!<CR>
nnoremap <silent> <leader>ml :call functions#AppendModeline()<CR>
inoremap <C-l> <right>
inoremap <S-Return>	<C-o>A
nnoremap <S-Return> A
inoremap <C-Return> <C-o>o
inoremap <C-BS> <Esc>diwa
nnoremap <leader>al :ALELint<CR><C-l>
nnoremap <leader>an :ALENext<CR><C-l>
noremap <leader>ap :ALEPrevious<CR><C-l>
vnoremap <leader>be c<c-r>=system('b64enc -e ' . &fenc, @")<cr><esc>
vnoremap <leader>bd c<c-r>=system('b64dec -e ' . &fenc, @")<cr><esc>
noremap <C-Left> :bprev<CR>
noremap <C-Right> :bnext<CR>
nnoremap - :Fern . -toggle -drawer<CR>
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <leader>gd <Plug>(coc-definitions)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :Files!<CR>
nmap <leader>ob <Plug>(openbrowser-open)
"}}}2

"{{{2 Setup Statusline & Tabline
call functions#Statusline()
"}}}

"{{{2 Commands
command! -register CopyMatches call functions#CopyMatches(<q-reg>)
command! DarkMode  colorscheme nofrils-dark
			\ | let g:crystalline_theme="nofrils_dark"
			\ | call functions#TweakHighlights()
			\ | call crystalline#apply_current_theme() 
command! LightMode colorscheme nofrils-acme
			\ | let g:crystalline_theme="nofrils_acme"
			\ | call functions#TweakHighlights()
			\ | call crystalline#apply_current_theme() 
command! BrightMode colorscheme nofrils-light
			\ | let g:crystalline_theme="nofrils_light"
			\ | call functions#TweakHighlights()
			\ | call crystalline#apply_current_theme() 
command! SepiaMode colorscheme nofrils-sepia
			\ | let g:crystalline_theme="nofrils_sepia"
			\ | call functions#TweakHighlights()
			\ | call crystalline#apply_current_theme() 
"}}}2

"{{{2 Auto Commands
if has("autocmd")
	autocmd GUIEnter * call functions#SetupCanvas()
	autocmd ColorScheme * call functions#Statusline()
	filetype on
	filetype plugin indent on
	" set omnifunc=syntaxcomplete#Complete
	augroup VIM
		autocmd!
		autocmd FileType vim let b:comment_leader="\" "
	augroup END
	augroup AHK
		autocmd!
		autocmd FileType autohotkey setlocal fileencoding=utf-8 commentstring=;%s
		autocmd FileType autohotkey let b:comment_leader="; "
		autocmd FileType autohotkey let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"', "'":"'"}
		" autocmd FileType autohotkey RainbowParentheses
	augroup JVM
		autocmd!
		autocmd FileType groovy,java,scala,kotlin setlocal commentstring=//%s
		autocmd FileType groovy,java,scals,kotlin let b:comment_leader="// "
		autocmd FileType groovy,java let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"', "'":"'"}
		" autocmd FileType groovy RainbowParentheses
	augroup BAT
		autocmd!
		autocmd FileType dosbatch let b:comment_leader=":: "
	augroup END
	augroup LDIF
		autocmd!
		autocmd FileType ldif setlocal textwidth=76 wrap commentstring=#%s
	augroup END
	augroup LUA
		autocmd!
		autocmd FileType lua let b:comment_leader="-- "
	augroup END
	augroup WEB
		autocmd!
		autocmd FileType css,scss,sass,html,json,jsp,yaml
					\ setlocal tabstop=2 shiftwidth=2 softtabstop=2
	augroup END
	augroup MARKDOWN
		autocmd!
		autocmd FileType markdown setlocal textwidth=80
	augroup END
	augroup PLANTUML
		autocmd!
		autocmd FileType puml,plantuml
					\ setlocal tabstop=2 shiftwidth=2 softtabstop=2
		autocmd FileType puml,plantuml let b:comment_leader="' "
		autocmd FileType puml,plantuml let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"'}
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
					\ setlocal textwidth=80 softtabstop=0 smarttab nocindent
		autocmd FileType haskell let b:comment_leader="-- "
	augroup END
	augroup YAML
		autocmd!
		autocmd FileType yaml
					\ setlocal tabstop=2 shiftwidth=2	
		autocmd FileType yaml let b:comment_leader="# "
	augroup END
	augroup XPT.VIM
		autocmd!
		autocmd FileType xpt.vim let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"', "'":"'", '`':'^'}
	augroup END
	augroup my-glyph-palette
	  autocmd! *
	  autocmd FileType fern call glyph_palette#apply()
	  " autocmd FileType nerdtree,startify call glyph_palette#apply()
	augroup END
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
"{{{2 Crystalline
" let g:crystalline_statusline_fn = 'functions#StatusLine'
" let g:crystalline_tabline_fn = 'functions#TabLine'
" let g:crystalline_theme = substitute(colors_name, "-", "_", "")
" let g:crystalline_tab_mod = " * "
"}}}2

"{{{2 Emmet
let g:user_emmet_leader_key = '<c-z>'
"}}}2

"{{{2 YouCompleteMe
" let g:ycm_seed_identifiers_with_syntax = 1
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
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]node_modules|\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|dll|class)$'
			\ }
"}}}2

"{{{2 NERDTree
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
" let g:NERDTreeDirArrowExpandable = '▶'
" let g:NERDTreeDirArrowCollapsible = '▼'
" let NERDTreeQuitOnOpen = 1 
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
let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_open_list = 0
let g:ale_jq_executable = "C:/opt/bin/jq.exe"
let g:ale_xml_xmllint_executable = "C:/opt/bin/xmllint.exe"
let g:ale_xml_xmlstarlet_executable = "C:/opt/bin/xml.exe"
let g:ale_autohotkey_ahklint_executable = "C:/opt/bin/ahklint.exe"
let g:ale_ldif_ldiflint_executable = "C:/opt/bin/ldiflint.exe"
let g:ale_yaml_yamllint_executable = "C:/Users/srp/AppData/Roaming/Python/Python39/Scripts/yamllint.exe"
"}}}2

"{{{2 vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1
"}}}2

"{{{2 haskell-vim
let g:haskell_classic_highlighting = 1
"}}}2

"{{{2 Rainbow Parentheses
" let g:rainbow#pairs = [['(',')'], ['[',']']]
" let g:rainbow#max_level = 16
"}}}

"{{{2 Quickrun
let g:quickrun_config = {}
let g:quickrun_config.plantuml = {
			\ 'command': 'plantuml',
			\ 'exec': 'java -jar c:/var/java/lib/plantuml.jar %o %s',
			\ 'cmdopt': '-overwrite',
			\ 'outputter': 'browser',
			\ 'outputter/browser/name': '%{expand("%:p:r:t").".png"}', }
let g:quickrun_config.markdown = {
			\ 'type': 'markdown/pandoc',
			\ 'cmdopt': '',
			\ 'outputter': 'browser', }
let g:quickrun_config.autohotkey = {
			\ 'exec': 'ahk c q -a %{expand("%")}',
			\ 'outputter/buffer/opener': 'new' }
let g:quickrun_config.groovy = {
			\ 'command' : 'groovy'
			\, 'cmdopt' : '' }
let g:quickrun_config.ballerina = {
			\ 'exec' : 'c:/opt/ballerina/bin/bal.bat run %{expand("%")}' }
"}}}

"{{{2 Fern
let g:fern#renderer = "nerdfont"
"}}}

"{{{2 vim-lsc
" let g:lsc_server_commands = {'java': 'c:/var/lsp/java-language-server/dist/lang_server_windows.cmd'}
"}}}
 
"{{{2 Hexokinase
let g:Hexokinase_highlighters = [ 'sign_column' ]
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'text', 'vim', 'colortemplate']
"}}}

"{{{2 FZF
let g:fzf_preview_window = []
"}}}

"{{{2 Python-Syntax
let g:python_highlight_string_formatting=1
let g:python_highlight_string_format=1
"}}}
"}}}1

" vim:tw=78:ts=4:sts=4:sw=4:noet:ft=vim:nobomb
" vim:fdm=marker
