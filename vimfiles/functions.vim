" Out-of-the-box MyDiff function
if !exists("*MyDiff")
  set diffexpr=MyDiff()
  function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        if empty(&shellxquote)
          let l:shxq_sav = ''
          set shellxquote&
        endif
        let cmd = '"' . $VIMRUNTIME . '\diff"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
      let &shellxquote=l:shxq_sav
    endif
  endfunction
endif

" Copy only the text that matches search hits into a given register.
" @example: :CopyMatches +	" Copy currently selected text to the +
" register
function! CopyMatches(reg)
	let hits = []
	%s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
	let reg = empty(a:reg) ? '+' : a:reg
	execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Toggles a line comment if b:comment_leader is set for the current filetype
function! ToggleComment()
	if exists("b:comment_leader") == 0
		return
	endif
	let currentline = getline(line("."))
	let line = matchlist(currentline, '^\(\s*\)\(' . b:comment_leader . '\)\?\s*\(.*\)$')
	if line[2] == b:comment_leader
		call setline(line("."), line[1] . line[3])
	else
		call setline(line("."), line[1] . b:comment_leader . line[3])
	endif
endfunction

" Edit snippts description for current filetype
function! SimpleSnippetsEditDescription()
	let ft = getbufvar(bufname("%"), "&filetype")
	if exists("g:SimpleSnippets_search_path")
		let path = g:SimpleSnippets_search_path
	else
		let path = $HOME."/.vim/snippets/"
	endif
	:exec ":split ".path.ft."/".ft.".snippets.descriptions.txt"
endfunction
command! -register SimpleSnippetsEditDescription call SimpleSnippetsEditDescription()
