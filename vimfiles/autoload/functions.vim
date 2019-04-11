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
	if exists("*WebDevIconsGetFileTypeSymbol")
		let fe_symbol = ' '
	else
		let fe_symbol = ''
	endif
	return winwidth(0) > 70 ? (&fileencoding !=# ''
				\	? &fileencoding . fe_symbol : 'no enc') : ''
endfunction

function! functions#LightlineReadonly()
	if exists("*WebDevIconsGetFileTypeSymbol")
		return &readonly ? '' : ''
	endif
	return &readonly ? '' : ''
endfunction

function! functions#LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	if exists("*WebDevIconsGetFileTypeSymbol")
		let modified = &modified ? '  ' : '   '
	else
		let modified = &modified ? ' ●' : '   '
	endif
	return filename . modified
endfunction

function! functions#LightlineFugitive()
	if exists('*fugitive#head')
		if exists("*WebDevIconsGetFileTypeSymbol")
			let br_symbol = ''
		else
			let br_symbol = ''
		let branch = fugitive#head()
		return branch !=# '' ? br_symbol.' '.branch : ''
	endif
	return ''
endfunction

function! functions#LightlineALEOk()
	if ale#linter#Get(&filetype) != [] && ale#statusline#Count(bufnr("%"))["total"] == 0
		return (exists("*WebDevIconsGetFileTypeSymbol") ? " " : "✓ ")
	endif
	return ""
endfunction

function! functions#LightlineALEErrors()
	let ale_errors = ale#statusline#Count(bufnr("%"))["0"]
	if ale_errors > 0
		return (exists("*WebDevIconsGetFileTypeSymbol") ? " " : "✗ ") . ale_errors
	endif
	return ""
endfunction

function! functions#LightlineALEWarnings()
	let ale_warnings = ale#statusline#Count(bufnr("%"))["1"]
	if ale_warnings > 0
		return (exists("*WebDevIconsGetFileTypeSymbol") ? " " : "∆ ") . ale_warnings
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

" function! functions#HexokinaseColorNamesGet() abort
	" return {
				" \ "aliceblue": "#f0f8ff",
				" \ "antiquewhite": "#faebd7",
				" \ "aqua": "#00ffff",
				" \ "aquamarine": "#7fffd4",
				" \ "azure": "#f0ffff",
				" \ "beige": "#f5f5dc",
				" \ "bisque": "#ffe4c4",
				" \ "black": "#000000",
				" \ "blanchedalmond": "#ffebcd",
				" \ "blue": "#0000ff",
				" \ "blueviolet": "#8a2be2",
				" \ "brown": "#a52a2a",
				" \ "burlywood": "#deb887",
				" \ "cadetblue": "#5f9ea0",
				" \ "chartreuse": "#7fff00",
				" \ "chocolate": "#d2691e",
				" \ "coral": "#ff7f50",
				" \ "cornflowerblue": "#6495ed",
				" \ "cornsilk": "#fff8dc",
				" \ "crimson": "#dc143c",
				" \ "cyan": "#00ffff",
				" \ "darkblue": "#00008b",
				" \ "darkcyan": "#008b8b",
				" \ "darkgoldenrod": "#b8860b",
				" \ "darkgray": "#a9a9a9",
				" \ "darkgreen": "#006400",
				" \ "darkkhaki": "#bdb76b",
				" \ "darkmagenta": "#8b008b",
				" \ "darkolivegreen": "#556b2f",
				" \ "darkorange": "#ff8c00",
				" \ "darkorchid": "#9932cc",
				" \ "darkred": "#8b0000",
				" \ "darksalmon": "#e9967a",
				" \ "darkseagreen": "#8fbc8f",
				" \ "darkslateblue": "#483d8b",
				" \ "darkslategray": "#2f4f4f",
				" \ "darkturquoise": "#00ced1",
				" \ "darkviolet": "#9400d3",
				" \ "deeppink": "#ff1493",
				" \ "deepskyblue": "#00bfff",
				" \ "dimgray": "#696969",
				" \ "dodgerblue": "#1e90ff",
				" \ "firebrick": "#b22222",
				" \ "floralwhite": "#fffaf0",
				" \ "forestgreen": "#228b22",
				" \ "fuchsia": "#ff00ff",
				" \ "gainsboro": "#dcdcdc",
				" \ "ghostwhite": "#f8f8ff",
				" \ "gold": "#ffd700",
				" \ "goldenrod": "#daa520",
				" \ "gray": "#808080",
				" \ "green": "#008000",
				" \ "greenyellow": "#adff2f",
				" \ "honeydew": "#f0fff0",
				" \ "hotpink": "#ff69b4",
				" \ "indianred": "#cd5c5c",
				" \ "indigo": "#4b0082",
				" \ "ivory": "#fffff0",
				" \ "khaki": "#f0e68c",
				" \ "lavender": "#e6e6fa",
				" \ "lavenderblush": "#fff0f5",
				" \ "lawngreen": "#7cfc00",
				" \ "lemonchiffon": "#fffacd",
				" \ "lightblue": "#add8e6",
				" \ "lightcoral": "#f08080",
				" \ "lightcyan": "#e0ffff",
				" \ "lightgoldenrodyellow": "#fafad2",
				" \ "lightgray": "#d3d3d3",
				" \ "lightgreen": "#90ee90",
				" \ "lightpink": "#ffb6c1",
				" \ "lightsalmon": "#ffa07a",
				" \ "lightseagreen": "#20b2aa",
				" \ "lightskyblue": "#87cefa",
				" \ "lightslategray": "#778899",
				" \ "lightsteelblue": "#b0c4de",
				" \ "lightyellow": "#ffffe0",
				" \ "lime": "#00ff00",
				" \ "limegreen": "#32cd32",
				" \ "linen": "#faf0e6",
				" \ "magenta": "#ff00ff",
				" \ "maroon": "#800000",
				" \ "mediumaquamarine": "#66cdaa",
				" \ "mediumblue": "#0000cd",
				" \ "mediumorchid": "#ba55d3",
				" \ "mediumpurple": "#9370d8",
				" \ "mediumseagreen": "#3cb371",
				" \ "mediumslateblue": "#7b68ee",
				" \ "mediumspringgreen": "#00fa9a",
				" \ "mediumturquoise": "#48d1cc",
				" \ "mediumvioletred": "#c71585",
				" \ "midnightblue": "#191970",
				" \ "mintcream": "#f5fffa",
				" \ "mistyrose": "#ffe4e1",
				" \ "moccasin": "#ffe4b5",
				" \ "navajowhite": "#ffdead",
				" \ "navy": "#000080",
				" \ "oldlace": "#fdf5e6",
				" \ "olive": "#808000",
				" \ "olivedrab": "#6b8e23",
				" \ "orange": "#ffa500",
				" \ "orangered": "#ff4500",
				" \ "orchid": "#da70d6",
				" \ "palegoldenrod": "#eee8aa",
				" \ "palegreen": "#98fb98",
				" \ "paleturquoise": "#afeeee",
				" \ "palevioletred": "#db7093",
				" \ "papayawhip": "#ffefd5",
				" \ "peachpuff": "#ffdab9",
				" \ "peru": "#cd853f",
				" \ "pink": "#ffc0cb",
				" \ "plum": "#dda0dd",
				" \ "powderblue": "#b0e0e6",
				" \ "purple": "#800080",
				" \ "red": "#ff0000",
				" \ "rosybrown": "#bc8f8f",
				" \ "royalblue": "#4169e1",
				" \ "saddlebrown": "#8b4513",
				" \ "salmon": "#fa8072",
				" \ "sandybrown": "#f4a460",
				" \ "seagreen": "#2e8b57",
				" \ "seashell": "#fff5ee",
				" \ "sienna": "#a0522d",
				" \ "silver": "#c0c0c0",
				" \ "skyblue": "#87ceeb",
				" \ "slateblue": "#6a5acd",
				" \ "slategray": "#708090",
				" \ "snow": "#fffafa",
				" \ "springgreen": "#00ff7f",
				" \ "steelblue": "#4682b4",
				" \ "tan": "#d2b48c",
				" \ "teal": "#008080",
				" \ "thistle": "#d8bfd8",
				" \ "tomato": "#ff6347",
				" \ "turquoise": "#40e0d0",
				" \ "violet": "#ee82ee",
				" \ "wheat": "#f5deb3",
				" \ "white": "#ffffff",
				" \ "whitesmoke": "#f5f5f5",
				" \ "yellow": "#ffff00",
				" \ "yellowgreen": "#9acd32"
				" \ }
" endfunction
" 
" function! functions#HexokinaseHtmlColorNames(match) abort
	" let color_names = functions#HexokinaseColorNamesGet()
	" let match_lcase = tolower(a:match)
	" if has_key(color_names, match_lcase)
		" return color_names[match_lcase]
	" else
		" return ""
	" endif
" endfunction
" vim:tw=78:ts=4:sts=4:sw=4:noet:ft=vim:nobomb
