if empty(glob('$HOME\vimfiles\autoload\plug.vim'))
  silent execute "!curl -fLo " . expand('$HOME\vimfiles\autoload\plug.vim')
      \ . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/vimfiles/pack/plugged')

Plug 'cideM/yui'
Plug 'pgdouyon/vim-yin-yang'
" Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

Plug 'dense-analysis/ale'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mattn/emmet-vim'
Plug 'lifepillar/vim-colortemplate'
Plug 'cocopon/colorswatch.vim'
Plug 'godlygeek/tabular'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-vinegar'
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jceb/vim-orgmode'
Plug 'inkarkat/vim-SyntaxRange', { 'for': 'org' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-scripts/Align', { 'on': ['Align', 'AlignCtrl'] }
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'davidoc/taskpaper.vim', { 'for': 'taskpaper' }
Plug 'RRethy/vim-hexokinase', { 'do': 'mingw32-make hexokinase', 'on': ['HexokinaseToggle', 'HexokinaseTurnOn'] }
" Plug 'chrisbra/Colorizer'
" Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'
Plug 'drmingdrmer/xptemplate'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'Marzipanzerfaust/vim-indent-ahk'
Plug 'thinca/vim-quickrun', { 'for': ['gradle', 'go', 'groovy', 'haskell', 'java', 
            \ 'javascript', 'kotlin', 'markdown', 'plantuml', 'scala',
            \ 'autohotkey', 'python', 'vim'] }
Plug 'tyru/open-browser.vim', { 'for': ['json', 'markdown', 'plantuml', 'org', 'groovy'] }
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
" Plug 'gko/vim-coloresque'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'pacha/vem-tabline'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/glyph-palette.vim'
" Plug 'sainnhe/artify.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dbeniamine/cheat.sh-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'mattn/vim-metarw-webdav'
" Plug 'kana/vim-metarw'
" Plug 'mattn/davc', { 'do': 'go get github.com/mattn/davc' }

call plug#end()
