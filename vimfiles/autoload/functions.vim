" Out-of-the-box MyDiff function
if !exists("*MyDiff")
	set diffexpr=functions#MyDiff()
	function functions#MyDiff()
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
function! functions#CopyMatches(reg)
	let hits = []
	%s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
	let reg = empty(a:reg) ? '+' : a:reg
	execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! functions#AppendModeline()
	let l:modeline = printf(' vim:tw=%d:ts=%d:sts=%d:sw=%d:%set:ft=%s:%sbomb',
	\ &textwidth, &tabstop, &softtabstop, &shiftwidth, &expandtab ? '' : 'no', &filetype, &bomb ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction

" Toggles a line comment if b:comment_leader is set for the current filetype
function! functions#ToggleComment()
	if exists("b:comment_leader") == 0
		return
	endif
	let currentline = getline(line("."))
	let line = matchlist(currentline, '^\(\s*\)\(' . b:comment_leader . '\)\?\(\s*\)\(.*\)$')
	if line[2] == b:comment_leader
		call setline(line("."), line[1] . line[3] . line[4])
	else
		call setline(line("."), line[1] . b:comment_leader . line[3] . line[4])
	endif
endfunction

" Place the cursor one char to the right and enter insert mode. 
function! functions#OneToTheRight()
	let l = strlen(getline("."))
	let p = getpos(".")
	if l == p[2]
		call setline(".", getline(".") . "")
	endif
	call setpos(".", [bufnr(bufname("")), line("."), p[2]+1, 0])
endfunction
