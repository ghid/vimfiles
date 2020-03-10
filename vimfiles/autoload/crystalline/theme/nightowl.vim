function! crystalline#theme#nightowl#set_theme() abort
  if (&background ==? 'light')
    call crystalline#generate_theme({
          \ 'NormalMode':  [[231,  71], ['#f0f0f0', '#288ed7']],
          \ 'InsertMode':  [[231,  31], ['#f0f0f0', '#08916a']],
          \ 'VisualMode':  [[231, 136], ['#f0f0f0', '#f78c6c']],
          \ 'ReplaceMode': [[231, 167], ['#f0f0f0', '#de3d3b']],
          \ '':            [[  0,   0], ['#f0f0f0', '#90a7b2']],
          \ 'Inactive':    [[  0,   0], ['#112630', '#f0f0f0']],
          \ 'Fill':        [[  0,   0], ['#989fb1', '#f0f0f0']],
          \ 'Tab':         [[  0,   0], ['#989fb1', '#fbfbfb']],
          \ 'TabType':     [[  0,   0], ['#f0f0f0', '#90a7b2']],
          \ 'TabSel':      [[  0,   0], ['#403f53', '#d3e8f9']],
          \ 'TabFill':     [[  0,   0], ['#403f53', '#fbfbfb']],
          \ })
    hi CrystallineOk                guibg=#f0f0f0 guifg=#42ae2c
    hi CrystallineInfo              guibg=#f0f0f0 guifg=#21b8c7
    hi CrystallineWarn              guibg=#f0f0f0 guifg=#eead0e
    hi CrystallineError             guibg=#f0f0f0 guifg=#e0211d
  else
    call crystalline#generate_theme({
          \ 'NormalMode':  [[236, 114], ['#d6deeb', '#82aaff']],
          \ 'InsertMode':  [[236,  75], ['#d6deeb', '#addb67']],
          \ 'VisualMode':  [[236, 180], ['#d6deeb', '#f78c6c']],
          \ 'ReplaceMode': [[236, 168], ['#d6deeb', '#ff5874']],
          \ '':            [[  0,   0], ['#d6deeb', '#0a2a43']],
          \ 'Inactive':    [[  0,   0], ['#bab8c7', '#00121e']],
          \ 'Fill':        [[  0,   0], ['#3b546a', '#00121e']],
          \ 'Tab':         [[  0,   0], ['#3b546a', '#011627']],
          \ 'TabType':     [[  0,   0], ['#d6deeb', '#0a2a43']],
          \ 'TabSel':      [[  0,   0], ['#d6deeb', '#5f7d97']],
          \ 'TabFill':     [[  0,   0], ['#d6deeb', '#011627']],
          \ })
    hi CrystallineOk                guibg=#011627 guifg=#42ae2c
    hi CrystallineInfo              guibg=#011627 guifg=#21b8c7
    hi CrystallineWarn              guibg=#011627 guifg=#eead0e
    hi CrystallineError             guibg=#011627 guifg=#e0211d
  endif
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
