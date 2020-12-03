function! crystalline#theme#nofrils_acme#set_theme() abort
    call crystalline#generate_theme({
          \ 'NormalMode':  [[231,  71], ['white', '#000080']],
          \ 'InsertMode':  [[231,  31], ['white', '#008000']],
          \ 'VisualMode':  [[231, 136], ['white', '#875f00']],
          \ 'ReplaceMode': [[231, 167], ['white', '#800000']],
          \ '':            [[  0,   0], ['#000000', '#d7ffff']],
          \ 'Inactive':    [[  0,   0], ['#000000', '#d7ffff']],
          \ 'Fill':        [[  0,   0], ['#000000', '#d7ffff']],
          \ 'Tab':         [[  0,   0], ['#000000', '#d7ffff']],
          \ 'TabType':     [[  0,   0], ['white',   '#875f00']],
          \ 'TabSel':      [[  0,   0], ['#eaeaea', '#000080']],
          \ 'TabFill':     [[  0,   0], ['#000000', 'NONE']],
          \ })
    hi CrystallineOk                guibg=#d7ffff guifg=#008000
    hi CrystallineInfo              guibg=#d7ffff guifg=#5f005f
    hi CrystallineWarn              guibg=#d7ffff guifg=#ffd787
    hi CrystallineError             guibg=#d7ffff guifg=#ff5555
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
