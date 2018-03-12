set packpath=$VIM\vimfiles,$VIMRUNTIME,$VIM\vimfiles\after

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists("*minpac#init")
	finish
endif

call minpac#init()
call minpac#add("k-takata/minpac", {"type": "opt"})

" Add colorschemes
call minpac#add("roosta/vim-srcery")
call minpac#add("fenetikm/falcon")
" Add plugins
" call minpac#add("vim-airline/vim-airline")
call minpac#add("itchyny/lightline.vim")
call minpac#add("itchyny/vim-gitbranch")
call minpac#add("SirVer/ultisnips")
call minpac#add("majutsushi/tagbar")
call minpac#add("tpope/vim-fugitive", {"type": "opt"})
call minpac#add("vim-scripts/Align", {"type": "opt"})
call minpac#add("davidoc/taskpaper.vim")
call minpac#add("junegunn/goyo.vim", {"type": "opt"})
