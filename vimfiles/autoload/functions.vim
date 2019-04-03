" Out-of-the-box MyDiff function
if !exists("*MyDiff")
	set diffexpr=functions#MyDiff()
	function! functions#MyDiff()
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

function! functions#SetupCanvas()
	set lines=99
	set columns=999
	winpos 0 5
endfunction

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
				\ &textwidth, &tabstop, &softtabstop, &shiftwidth,
				\ &expandtab ? '' : 'no', &filetype, &bomb ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction

" Toggles a line comment if b:comment_leader is set for the current filetype
function! functions#ToggleComment()
	if exists("b:comment_leader") == 0
		return
	endif
	let currentline = getline(line("."))
	let line = matchlist(currentline, '^\(\s*\)\('
		\ . b:comment_leader . '\)\?\(\s*\)\(.*\)$')
	if line[2] == b:comment_leader
		call setline(line(".")
					\ , line[1] . line[3] . line[4])
	else
		call setline(line(".")
					\ , line[1] . b:comment_leader . line[3] . line[4])
	endif
endfunction

function! functions#LightlineDevIconFiletype()
	if exists("*WebDevIconsGetFileTypeSymbol")
		let ft_symbol = WebDevIconsGetFileTypeSymbol()
	else
		let ft_symbol = ''
	endif
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype 
				\ . ' ' . ft_symbol : 'no ft') : ''
endfunction

function! functions#LightlineDevIconFileformat()
	if exists("*WebDevIconsGetFileFormatSymbol")
		let ff_symbol = WebDevIconsGetFileFormatSymbol()
	else
		let ff_symbol = ''
	endif
	return winwidth(0) > 70 ? (&fileformat
				\. ' ' . ff_symbol) : ''
endfunction

function! functions#LightlineFileEncoding()
	return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding . ' ' : 'no enc') : ''
endfunction

function! functions#LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! functions#LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? '  ' : '   '
	return filename . modified
endfunction

function! functions#LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction

function! functions#LightlineALEOk()
	if ale#linter#Get(&filetype) != [] && ale#statusline#Count(bufnr("%"))["total"] == 0
		return "" 
	endif
	return ""
endfunction

function! functions#LightlineALEErrors()
	let ale_errors = ale#statusline#Count(bufnr("%"))["0"]
	if ale_errors > 0
		return " " . ale_errors
	endif
	return ""
endfunction

function! functions#LightlineALEWarnings()
	let ale_warnings = ale#statusline#Count(bufnr("%"))["1"]
	if ale_warnings > 0
		return " " . ale_warnings
	endif
	return ""
endfunction

function! functions#LightlineSyntasticFirstLine()
	let syntastic_flag = split(SyntasticStatuslineFlag(), ";")
	return ' ' . syntastic_flag[0]
endfunction

function! functions#LightlineSyntasticErrors()
	let syntastic_flag = split(SyntasticStatuslineFlag(), ";")
	return ' ' . syntastic_flag[1]
endfunction

function! functions#LightlineSyntasticWarnings()
	let syntastic_flag = split(SyntasticStatuslineFlag(), ";")
	return ' ' . syntastic_flag[2]
endfunction
" vim:tw=78:ts=4:sts=4:sw=4:noet:ft=vim:nobomb
