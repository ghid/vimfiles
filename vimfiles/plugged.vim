if empty(glob('$HOME\vimfiles\autoload\plug.vim'))
  silent execute "!curl -fLo " . expand('$HOME\vimfiles\autoload\plug.vim')
      \ . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/vimfiles/pack/plugged')

Plug 'ayu-theme/ayu-vim'
" Plug 'liuchengxu/space-vim-theme'
Plug 'ghid/spacvim'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rbong/vim-crystalline'
Plug 'mattn/emmet-vim'
Plug 'lifepillar/vim-colortemplate'
Plug 'cocopon/colorswatch.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-table-mode'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-scripts/Align', { 'on': ['Align', 'AlignCtrl'] }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'davidoc/taskpaper.vim', { 'for': 'taskpaper' }
Plug 'RRethy/vim-hexokinase', { 'do': 'mingw32-make hexokinase', 'on': ['HexokinaseToggle', 'HexokinaseTurnOn'] }
Plug 'chrisbra/Colorizer'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'drmingdrmer/xptemplate'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'Marzipanzerfaust/vim-indent-ahk'
" Plug 'wsdjeg/vim-todo', { 'on': 'OpenTodo' }

call plug#end()
