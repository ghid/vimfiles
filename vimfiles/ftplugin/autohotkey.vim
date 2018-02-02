" See c:/etc/ctags.conf for more
let g:tagbar_type_autohotkey = {
	\ 'ctagstype' : 'autohotkey',
	\ 'kinds'     : [
		\ 'n:note',
		\ 'i:include:0:1',
		\ 'h:hotkey:0:1',
		\ 'c:class:0:1',
		\ 'f:function:0:1',
		\ 'l:label:0:1'
		\ ],
	\ 'sro' : '.'
\ }

let g:tagbar_iconchars = ['▶', '◢']
