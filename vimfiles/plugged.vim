if empty(glob('$HOME\vimfiles\autoload\plug.vim'))
  silent execute "!curl -fLo " . expand('$HOME\vimfiles\autoload\plug.vim')
      \ . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/vimfiles/pack/plugged')

" Plug 'ayu-theme/ayu-vim'
" Plug 'liuchengxu/space-vim-theme'
" Plug 'relastle/bluewery.vim'
" Plug 'atelierbram/Base2Tone-vim'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'ghid/spacvim'
Plug 'cideM/yui'
Plug 'pgdouyon/vim-yin-yang'
Plug 'ajgrf/parchment'
Plug 'robertmeta/nofrils'
Plug 'clinstid/eink.vim'

Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'rbong/vim-crystalline'
Plug 'itchyny/vim-gitbranch'
Plug 'mattn/emmet-vim'
Plug 'lifepillar/vim-colortemplate'
Plug 'cocopon/colorswatch.vim'
Plug 'godlygeek/tabular'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jceb/vim-orgmode'
" Plug 'hsitz/VimOrganizer'
" Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating'
Plug 'inkarkat/vim-SyntaxRange', { 'for': 'org' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-scripts/Align', { 'on': ['Align', 'AlignCtrl'] }
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'davidoc/taskpaper.vim', { 'for': 'taskpaper' }
" Plug 'RRethy/vim-hexokinase', { 'do': 'mingw32-make hexokinase', 'on': ['HexokinaseToggle', 'HexokinaseTurnOn'] }
" Plug 'chrisbra/Colorizer'
" Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'
Plug 'drmingdrmer/xptemplate'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'Marzipanzerfaust/vim-indent-ahk'
" Plug 'wsdjeg/vim-todo', { 'on': 'OpenTodo' }
" Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun', { 'for': ['gradle', 'go', 'groovy', 'haskell', 'java', 
            \ 'javascript', 'kotlin', 'markdown', 'plantuml', 'scala',
            \ 'autohotkey', 'python', 'vim'] }
Plug 'tyru/open-browser.vim', { 'for': ['markdown', 'plantuml', 'org', 'groovy'] }
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'gko/vim-coloresque'
Plug 'martinda/Jenkinsfile-vim-syntax'
" Plug 'ap/vim-buftabline'
Plug 'pacha/vem-tabline'

" Plug 'mattn/vim-metarw-webdav'
" Plug 'kana/vim-metarw'
" Plug 'mattn/davc', { 'do': 'go get github.com/mattn/davc' }

call plug#end()
