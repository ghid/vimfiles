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
	call SetMyWinPos()
endfunction

function! functions#TweakHighlights()
	" highlight Cursor guifg=fg guibg=bg gui=reverse
	highlight ColorColumn gui=undercurl
	" highlight link xmlTagN xmlEndTag
	highlight Underlined gui=underline
	highlight String gui=underline
	highlight Comment gui=italic
	highlight Keyword gui=bold
	highlight Statement gui=bold
	" highlight qferror guifg=#EC5F67 guibg=NONE gui=NONE
	call matchadd('ColorColumn', '\%82v', 100)
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


function! functions#Statusline()
	let g:currentmode={
		\ 'n'  : "Normal",
		\ 'no' : 'Normal·Operator Pending',
		\ 'v'  : 'Visual',
		\ 'V'  : 'V·Line',
		\ '' : 'V·Block',
		\ 's'  : 'Select',
		\ 'S'  : 'S·Line',
		\ '' : 'S·Block',
		\ 'i'  : 'Insert',
		\ 'R'  : 'Replace',
		\ 'Rv' : 'V·Replace',
		\ 'c'  : 'Command',
		\ 'cv' : 'Vim Ex',
		\ 'ce' : 'Ex',
		\ 'r'  : 'Prompt',
		\ 'rm' : 'More',
		\ 'r?' : 'Confirm',
		\ '!'  : 'Shell',
		\ 't'  : 'Terminal'
		\}

	set statusline=
	set statusline+=\ %{toupper(g:currentmode[mode()])}\  " The current mode
	set statusline+=%1*\ %{functions#GitBranch()}\  
	set statusline+=\ %{functions#DiagnosticStatus()}
	set statusline+=\ %{functions#SpellCheck()}\ 
	set statusline+=%=                                       " Right Side
	set statusline+=\ Ln\ %l,\ Col\ %v\                   " Line, Column
	set statusline+=\ Spaces:\ %{&tabstop}\                  " Spaces
	set statusline+=\ %{''.toupper(&fenc!=''?&fenc:&enc).''}\    " Encoding
	set statusline+=\ %{(&ff==#'dos'?'CRLF':&ff==#'unix'?'LF':&ff==#'mac'?'CR':&ff)}\ 
	set statusline+=\ %Y\                                 " FileType
	set statusline+=\ %{functions#FileSize()}\ 
	set statusline+=%{(&readonly?'':'\ ')}\ 
	set statusline+=%{(&modified?'●\ ':'\ ')}\ 

	highlight link User1 Statusline
	" if &background ==? 'light'
		" hi User1 ctermfg=007 ctermbg=239 guibg=#6D2B7B guifg=#ffffff
	" else
		" hi User1 ctermfg=007 ctermbg=236 guibg=#007acc guifg=#ffffff
	" endif
endfunction

function! functions#TabLine()
  let l:vimlabel = has("nvim") ?  " NVIM " : ""
  return crystalline#bufferline(2, len(l:vimlabel), 0) . '%=%#CrystallineTab#' . l:vimlabel
endfunction

function! functions#StatusLine_spacevim(current, width)
  return  functions#BufferNumber(a:current)
		\ . (a:current
		\		? crystalline#mode() . '%#Crystalline#'
        \       . ' %{functions#DirtyFlag()} %{functions#FileSize()} %#CrystallineEmphasize#%{functions#Filename()}%h%w'
		\		. ' %#CrystallineTab# %{functions#Filetype()} '
        \		. '%#CrystallineFill#%{functions#GitBranch()} '
		\		: '%#CrystallineInactive#'
        \       . ' %{functions#DirtyFlag()} %{functions#FileSize()} %#CrystallineEmphasize#%{functions#Filename()}%h%w'
		\		. ' %#Crystalline# %{functions#Filetype()} %#CrystallineFill#')
        \ . '%=' . (a:current ? functions#ALEState() : '%#CrystallineFill#')
		\		. (a:current ? '%#CrystallineEmphasize#%{functions#SpellCheck()}' : '')
        \		. (a:width > 80
		\		? '%#CrystallineTab# %{&ff} %{&enc} |%4l:%2v '
		\		. '%#Crystalline# %3p%% '
		\		: '')
endfunction

function! functions#StatusLine(current, width)
	return (a:current
				\ ? crystalline#mode() . '%#Crystalline#'
				\ . ' %{functions#DirtyFlag()} %{functions#FileSize()} %{functions#Filename()}%h%w '
				\ . '%#CrystallineFill#%{functions#GitBranch()} '
				\ : '%#CrystallineInactive#'
				\ . ' %{functions#DirtyFlag()} %{functions#FileSize()} %{functions#Filename()}%h%w'
				\ . ' %#Crystalline# %{functions#Filetype()} %#CrystallineFill#')
				\ . '%=' . (a:current ? functions#ALEState() : '%#CrystallineFill#')
				\ . (a:current ? '%#CrystallineFill#%{functions#SpellCheck()}' : '')
				\ . (a:width > 80
				\ ? '%#CrystallineTab# %{&ff} | %{functions#Encoding()} | %{functions#Filetype()} '
				\ . '%#CrystallineInactive# %3p%% %#CrystallineTabSel#%4l:%2v '
				\ : '')
endfunction

function! functions#BufferNumber(current)
	if (a:current)
		return crystalline#mode_color() . " %n "
	else
		return "%#CrystallineBufferNoInactive# %n "
	endif
endfunction

function! functions#DirtyFlag()
	return (&modified ? "*" : "-")
endfunction

function! functions#FileSize()
	let fileSize = line2byte('$') + len(getline('$'))
	if fileSize < 0
		return "-"
	endif
	let dimensions = ["", "k", "m", "g"]
	let n = 0
	while n < len(dimensions) && floor(fileSize / 1024.0) > 0
		let fileSize /= 1024.0
		let n += 1
	endwhile
	return printf("%.*f%s", n, fileSize, dimensions[n])
endfunction

function! functions#Filename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	return filename . (&readonly ? ' ' :'')
endfunction

function! functions#Filetype()
	return &ft !=# '' ? &ft : 'No Type'
endfunction

function! functions#Encoding()
	return (&fenc !=# '' ? &fenc : &enc) . (&bomb ? '+bom' : '')
endfunction

function! functions#GitBranch()
	if exists("b:gitbranch")
		return b:gitbranch
	endif
	let b:gitbranch = ''
	if exists("*gitbranch#name")
		let branch = gitbranch#name()
		let b:gitbranch = (branch !=# '' ? ' '.branch.'' : '')
	endif
	return b:gitbranch
endfunction

function! functions#SpellCheck()
	return &spell ? '⌕ ' . &spelllang.''  : ''
endfunction

function! functions#DiagnosticStatus() abort
	let errors = 0
	let warnings = 0
	let infos = 0
	let hints = 0
	let info = get(b:, 'coc_diagnostic_info', {})
	if !empty(info)
		let errors += info['error']
		let warnings += info['warning']
		let infos += info['information']
		let hints += info['hint']
	endif
	if exists("*ale#linter#Get")
		let errors += ale#statusline#Count(bufnr("%"))["error"]
		let warnings += ale#statusline#Count(bufnr("%"))["warning"]
		let infos += ale#statusline#Count(bufnr("%"))["info"]
	endif
	let msgs = []
	if errors > 0 | call add(msgs, 'E: ' . errors) | endif
	if warnings > 0 | call add(msgs, 'W: ' . warnings) | endif
	if infos > 0 | call add(msgs, 'I: ' . infos) | endif
	if hints > 0 | call add(msgs, 'H: ' . hints) | endif
	return join(msgs, ' ')
endfunction

" vim:tw=78:ts=4:sts=4:sw=4:noet:ft=vim:nobomb
