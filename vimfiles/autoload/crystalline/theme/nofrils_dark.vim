function! crystalline#theme#nofrils_dark#set_theme() abort
    call crystalline#generate_theme({
          \ 'NormalMode':  [[231,  71], ['white', '#000080']],
          \ 'InsertMode':  [[231,  31], ['white', '#008000']],
          \ 'VisualMode':  [[231, 136], ['white', '#808000']],
          \ 'ReplaceMode': [[231, 167], ['white', '#800000']],
          \ '':            [[  0,   0], ['#eeeeee', '#6c6c6c']],
          \ 'Inactive':    [[  0,   0], ['#eeeeee', '#6c6c6c']],
          \ 'Fill':        [[  0,   0], ['#eeeeee', '#6c6c6c']],
          \ 'Tab':         [[  0,   0], ['#eeeeee', '#6c6c6c']],
          \ 'TabType':     [[  0,   0], ['white',   '#808080']],
          \ 'TabSel':      [[  0,   0], ['#eeeeee', '#000080']],
          \ 'TabFill':     [[  0,   0], ['#eeeeee', 'NONE']],
          \ })
    hi CrystallineOk                guibg=#6c6c6c guifg=#00ff00
    hi CrystallineInfo              guibg=#6c6c6c guifg=#0000ff
    hi CrystallineWarn              guibg=#6c6c6c guifg=#ffff00
    hi CrystallineError             guibg=#6c6c6c guifg=#ff0000
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
