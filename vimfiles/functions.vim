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

function! ToggleComment()
	if exists("b:comment_leader") == 0
		return
	endif
	let currentline = getline(line("."))
	let line = matchlist(currentline, '^\(\s*\)\(' . b:comment_leader . '\)\?\s*\(.*\)$')
	if line[2] == b:comment_leader
		call setline(line("."), line[1] . line[3])
	else
		call setline(line("."), line[1] . "; " . line[3])
	endif
endfunction

