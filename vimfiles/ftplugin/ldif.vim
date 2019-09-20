" Vim filetype plugin file
" Filetype:	LDIF
" Author:	Klaus-Peter Schreiner ( kpschreiner13 AT gmail DOT com )
" Last Update:

if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

setlocal omnifunc=ldifcomplete#CompleteLDIF
