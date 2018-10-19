set packpath=$HOME\vimfiles,$VIMRUNTIME,$HOME\vimfiles\after

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update() | simalt ~x
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists("*minpac#init")
	finish
endif

call minpac#init()
call minpac#add("k-takata/minpac", {"type": "opt"})

" Add colorschemes
" call minpac#add("roosta/vim-srcery")
" call minpac#add("rdavison/kimbie-vim")
" call minpac#add("morhetz/gruvbox")
call minpac#add("fenetikm/falcon")

" Add plugins
" call minpac#add("vim-airline/vim-airline")
call minpac#add("itchyny/lightline.vim")
" call minpac#add("SirVer/ultisnips", {"type": "opt"})
" call minpac#add("majutsushi/tagbar")
call minpac#add("tpope/vim-fugitive")
call minpac#add("vim-scripts/Align", {"type": "opt"})
call minpac#add("davidoc/taskpaper.vim", {"type": "opt"})
call minpac#add("junegunn/goyo.vim", {"type": "opt"})
" call minpac#add("emilyst/vim-xray")
" call minpac#add("vim-vdebug/vdebug")
" call minpac#add("andreyorst/SimpleSnippets.vim", {"type": "opt"})
call minpac#add("ghid/vim-autohotkey")
call minpac#add("tpope/vim-vinegar")
call minpac#add("ctrlpvim/ctrlp.vim")
call minpac#add("ryanoasis/vim-devicons")
" call minpac#add("Shutnik/jshint2.vim")
" call minpac#add("vim-scripts/AutoComplPop")
" call minpac#add("Yggdroot/indentLine")
call minpac#add("Valloric/YouCompleteMe")

call minpac#add("tomtom/tlib_vim")
call minpac#add("marcweber/vim-addon-mw-utils")
call minpac#add("garbas/vim-snipmate")

" Javascript/Typescript support
call minpac#add("leafgarland/typescript-vim")
call minpac#add("Quramy/tsuquyomi")
" call minpac#add("othree/javascript-libraries-syntax.vim")
" call minpac#add("Quramy/vim-js-pretty-template")

" HTML support
call minpac#add("mattn/emmet-vim")
call minpac#add("cakebaker/scss-syntax.vim")
call minpac#add("chrisbra/Colorizer")
