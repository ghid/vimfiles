" =============================================================================
" Filename: autoload/lightline/colorscheme/pencil.vim
" Author: kpschreiner
" License: MIT License
" =============================================================================

if lightline#colorscheme#background() ==# 'light'
  let g:lightline#colorscheme#pencil#palette = g:lightline#colorscheme#pencil_light#palette
else
  let g:lightline#colorscheme#pencil#palette = g:lightline#colorscheme#pencil_dark#palette
endif
