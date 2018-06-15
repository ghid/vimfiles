" Vim completion script
" Filetype:	LDIF
" Author:	Klaus-Peter Schreiner ( kpschreiner13 AT gmail DOT com )

function! ldifcomplete#CompleteLDIF(findstart, base)
	let s:words = split("add changetype control delete deleteoldrdn dn increment newrdn newsuperior moddn modify modrdn replace version")
	if a:findstart
		let line = getline('.')
		let start = col('.') - 1
		while start > 0 && line[start - 1] =~ '\a'
			let start -= 1
		endwhile
		return start
	else
		let res = []
		for m in s:words
			if m =~ '^' . a:base
				call add(res, m)
			endif
		endfor
		return res
	endif
endfunction

