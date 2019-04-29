set packpath=$HOME\vimfiles,$VIMRUNTIME,$HOME\vimfiles\after

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update() | call functions#SetupCanvas()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean() | call functions#SetupCanvas()

if !exists("*minpac#init")
	finish
endif

call minpac#init()
call minpac#add("k-takata/minpac", {"type": "opt"})

" Add colorschemes
call minpac#add("roosta/vim-srcery")
call minpac#add("fenetikm/falcon")
call minpac#add("patstockwell/vim-monokai-tasty")
call minpac#add("cocopon/iceberg.vim")
call minpac#add("NLKNguyen/papercolor-theme")
call minpac#add("mhartington/oceanic-next")

" Add plugins
call minpac#add("HerringtonDarkholme/yats.vim")
call minpac#add("MaxMEllon/vim-jsx-pretty")
call minpac#add("cakebaker/scss-syntax.vim")
call minpac#add("cocopon/colorswatch.vim")
call minpac#add("cohama/lexima.vim")
call minpac#add("ctrlpvim/ctrlp.vim")
call minpac#add("davidoc/taskpaper.vim", {"type": "opt"})
call minpac#add("dhruvasagar/vim-table-mode")
call minpac#add("elzr/vim-json")
call minpac#add("garbas/vim-snipmate")
call minpac#add("ghid/vim-autohotkey")
call minpac#add("ghid/vim-hexokinase")
call minpac#add("godlygeek/tabular")
call minpac#add("itchyny/lightline.vim")
call minpac#add("junegunn/goyo.vim", {"type": "opt"})
call minpac#add("junegunn/limelight.vim", {"type": "opt"})
call minpac#add("marcweber/vim-addon-mw-utils")
call minpac#add("mattn/emmet-vim")
call minpac#add("othree/html5.vim")
call minpac#add("pangloss/vim-javascript")
call minpac#add("plasticboy/vim-markdown")
call minpac#add("scrooloose/nerdtree")
call minpac#add("tomtom/tlib_vim")
call minpac#add("tpope/vim-fugitive")
call minpac#add("tpope/vim-vinegar")
call minpac#add("vim-scripts/Align", {"type": "opt"})
call minpac#add("w0rp/ale")

" Haskell support
" call minpac#add("eagletmt/ghcmod-vim")
call minpac#add("neovimhaskell/haskell-vim")

