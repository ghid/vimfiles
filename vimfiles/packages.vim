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
call minpac#add("fenetikm/falcon")
" Add plugins
" call minpac#add("vim-airline/vim-airline")
call minpac#add("itchyny/lightline.vim")
call minpac#add("SirVer/ultisnips", {"type": "opt"})
" call minpac#add("majutsushi/tagbar")
call minpac#add("tpope/vim-fugitive")
call minpac#add("vim-scripts/Align", {"type": "opt"})
call minpac#add("davidoc/taskpaper.vim", {"type": "opt"})
call minpac#add("junegunn/goyo.vim", {"type": "opt"})
" call minpac#add("vim-vdebug/vdebug")
call minpac#add("andreyorst/SimpleSnippets.vim")
call minpac#add("ghid/vim-autohotkey")
call minpac#add("tpope/vim-vinegar")
" call minpac#add("Shutnik/jshint2.vim")
call minpac#add("vim-scripts/AutoComplPop")

" Typescript support
call minpac#add("leafgarland/typescript-vim")
call minpac#add("Quramy/tsuquyomi")

" HTML support
call minpac#add("mattn/emmet-vim")
call minpac#add("cakebaker/scss-syntax.vim")
call minpac#add("chrisbra/Colorizer")
