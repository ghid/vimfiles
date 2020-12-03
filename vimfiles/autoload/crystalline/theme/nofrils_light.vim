function! crystalline#theme#nofrils_light#set_theme() abort
    call crystalline#generate_theme({
          \ 'NormalMode':  [[231,  71], ['white', '#000080']],
          \ 'InsertMode':  [[231,  31], ['white', '#008000']],
          \ 'VisualMode':  [[231, 136], ['white', '#875f00']],
          \ 'ReplaceMode': [[231, 167], ['white', '#800000']],
          \ '':            [[  0,   0], ['#dadada', '#a8a8a8']],
          \ 'Inactive':    [[  0,   0], ['#dadada', '#a8a8a8']],
          \ 'Fill':        [[  0,   0], ['#dadada', '#a8a8a8']],
          \ 'Tab':         [[  0,   0], ['#dadada', '#a8a8a8']],
          \ 'TabType':     [[  0,   0], ['white',   '#585858']],
          \ 'TabSel':      [[  0,   0], ['#dadada', '#000080']],
          \ 'TabFill':     [[  0,   0], ['#dadada', 'NONE']],
          \ })
    hi CrystallineOk                guibg=#a8a8a8 guifg=#008000
    hi CrystallineInfo              guibg=#a8a8a8 guifg=#000080
    hi CrystallineWarn              guibg=#a8a8a8 guifg=#808000
    hi CrystallineError             guibg=#a8a8a8 guifg=#800000
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
