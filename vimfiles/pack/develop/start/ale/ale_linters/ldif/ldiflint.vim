" Author: kpschreiner13@gmail.com
" Description: This file adds support for checking LDIF files whth ldiflint.

" CLI options
let g:ale_ldif_ldiflint_executable = get(g:, 'ale_ldif_ldiflint_executable', 'ldif')
let g:ale_ldif_ldiflint_options = get(g:, 'ale_ldif_ldiflint_options', '')

function! ale_linters#ldif#ldiflint#GetCommand(buffer) abort
    return '%e'
    \   . ale#Pad(ale#Var(a:buffer, 'ldif_ldiflint_options'))
    \   . ' --'
endfunction

function! ale_linters#ldif#ldiflint#Handle(buffer, lines) abort
    " Matches patterns lines like the following:
    " file/path:123.45: error level : error message
    " let l:pattern_message = '\v^([^:]+):(\d+\.\d+):\s*(.*)$'
    let l:pattern_message = '\v^(\d+)\.(\d+):\s*(.*):\s*(.*)$'

    " parse column token line like that:
    " file/path:123.45: parser error : Opening and ending tag mismatch: foo line 1 and bar
    " </bar>
    "       ^
    let l:pattern_column_token = '\v^\d+\.(\d+)\^$'

    let l:output = []

    for l:line in a:lines
        " Parse error/warning lines
        let l:match_message = matchlist(l:line, l:pattern_message)

        if !empty(l:match_message)
            let l:line = l:match_message[1] + 0
            let l:col = l:match_message[2] + 0
            if l:match_message[3] =~? 'warning'
                let l:type = 'W'
            elseif l:match_message[3] =~ 'info'
                let l:type = 'I'
            else
                let l:type = 'E'
            endif
            let l:text = l:match_message[4]

            call add(l:output, {
            \   'lnum': l:line,
            \   'col': l:col,
            \   'text': l:text,
            \   'type': l:type,
            \})

            continue
        endif

        " Parse column position
        let l:match_column_token = matchlist(l:line, l:pattern_column_token)

        if !empty(l:output) && !empty(l:match_column_token)
            let l:previous = l:output[len(l:output) - 1]
            let l:previous['col'] = len(l:match_column_token[1])

            continue
        endif
    endfor

    return l:output
endfunction

call ale#linter#Define('ldif', {
\   'name': 'ldiflint',
\   'output_stream': 'stderr',
\   'executable': {b -> ale#Var(b, 'ldif_ldiflint_executable')},
\   'command': function('ale_linters#ldif#ldiflint#GetCommand'),
\   'callback': 'ale_linters#ldif#ldiflint#Handle',
\ })
