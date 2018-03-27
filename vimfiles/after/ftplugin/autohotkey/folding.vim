function! AutoHotkeyFolds()
	let thisline=getline(v:lnum)
	if match(thisline, '^\s*;')>=0
		return "1"
	elseif match(thisline, '^\s*/\*')>=0
		let g:ahk_comment_block=1
		return "1"
	elseif match(thisline, '^\s*\*/')>=0
		let g:ahk_comment_block=0
		let stmt=matchlist(thisline, '^\s*\*/\s*\(.*\)')
		if stmt[1]==''
			return "1"
		else
			return "0"
		endif
	elseif g:ahk_comment_block==1
		return "1"
	else
		return "0"
	endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=AutoHotkeyFolds()
