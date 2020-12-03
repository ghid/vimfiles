function! crystalline#theme#parchment#set_theme() abort
    call crystalline#generate_theme({
          \ 'NormalMode':  [[231,  71], ['#ffffea', '#004488']],
          \ 'InsertMode':  [[231,  31], ['#ffffea', '#005500']],
          \ 'VisualMode':  [[231, 136], ['#ffffea', '#663311']],
          \ 'ReplaceMode': [[231, 167], ['#ffffea', '#880000']],
          \ '':            [[  0,   0], ['#000000', '#eeeecc']],
          \ 'Inactive':    [[  0,   0], ['#000000', '#eeeecc']],
          \ 'Fill':        [[  0,   0], ['#000000', '#eeeecc']],
          \ 'Tab':         [[  0,   0], ['#000000', '#eeeecc']],
          \ 'TabType':     [[  0,   0], ['#000000', '#eeeecc']],
          \ 'TabSel':      [[  0,   0], ['#eaeaea', '#004488']],
          \ 'TabFill':     [[  0,   0], ['#000000', '#eeeecc']],
          \ })
    hi CrystallineOk                guibg=#eeeecc guifg=#005500
    hi CrystallineInfo              guibg=#eeeecc guifg=#004488
    hi CrystallineWarn              guibg=#eeeecc guifg=#663311
    hi CrystallineError             guibg=#eeeecc guifg=#880000
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
