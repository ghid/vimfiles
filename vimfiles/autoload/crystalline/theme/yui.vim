function! crystalline#theme#yui#set_theme() abort
    call crystalline#generate_theme({
          \ 'NormalMode':  [[231,  71], ['#efeae5', '#125ea9']],
          \ 'InsertMode':  [[231,  31], ['#efeae5', '#336f15']],
          \ 'VisualMode':  [[231, 136], ['#72645f', '#f9ffa3']],
          \ 'ReplaceMode': [[231, 167], ['#efeae5', '#e44c22']],
          \ '':            [[  0,   0], ['#72645f', '#d2bdb7']],
          \ 'Inactive':    [[  0,   0], ['#eae0d6', '#9f918c']],
          \ 'Fill':        [[  0,   0], ['#72645f', '#eae0d6']],
          \ 'Tab':         [[  0,   0], ['#72645f', '#d2bdb7']],
          \ 'TabType':     [[  0,   0], ['#72645f', '#d2bdb7']],
          \ 'TabSel':      [[  0,   0], ['#408000', '#e8ffd1']],
          \ 'TabFill':     [[  0,   0], ['#72645f', '#eae0d6']],
          \ })
    hi CrystallineOk                guibg=#eae0d6 guifg=#336f15
    hi CrystallineInfo              guibg=#eae0d6 guifg=#125ea9
    hi CrystallineWarn              guibg=#eae0d6 guifg=#f9ffa3
    hi CrystallineError             guibg=#eae0d6 guifg=#e44c22
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
