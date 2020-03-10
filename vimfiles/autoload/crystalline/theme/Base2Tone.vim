function! crystalline#theme#Base2Tone#set_theme() abort
  if (&background ==? 'light')
    call crystalline#generate_theme({
          \ 'NormalMode':  [[0, 0], ['#dee6f7', '#b29762']],
          \ 'InsertMode':  [[0, 0], ['#dee6f7', '#1659df']],
          \ 'VisualMode':  [[0, 0], ['#dee6f7', '#3d75e6']],
          \ 'ReplaceMode': [[0, 0], ['#dee6f7', '#063289']],
          \ '':            [[0, 0], ['#dee6f7', '#707a8f']],
          \ 'Inactive':    [[0, 0], ['#707a8f', '#b7c9eb']],
          \ 'Fill':        [[0, 0], ['#b29762', '#b7c9eb']],
          \ 'Tab':         [[0, 0], ['#dee6f7', '#8d95a5']],
          \ 'TabType':     [[0, 0], ['#dee6f7', '#3d75e6']],
          \ 'TabSel':      [[0, 0], ['#dee6f7', '#b29762']],
          \ 'TabFill':     [[0, 0], ['#dee6f7', '#dee6f7']],
          \ })
    hi CrystallineOk                guibg=#b7c9eb guifg=#42ae2c
    hi CrystallineInfo              guibg=#b7c9eb guifg=#21b8c7
    hi CrystallineWarn              guibg=#b7c9eb guifg=#eead0e
    hi CrystallineError             guibg=#b7c9eb guifg=#e0211d
  else
    call crystalline#generate_theme({
          \ 'NormalMode':  [[0, 0], ['#2a2734', '#8a75f5']],
          \ 'InsertMode':  [[0, 0], ['#2a2734', '#ffad5c']],
          \ 'VisualMode':  [[0, 0], ['#2a2734', '#9a86fd']],
          \ 'ReplaceMode': [[0, 0], ['#2a2734', '#6a51e6']],
          \ '':            [[0, 0], ['#2a2734', '#787391']],
          \ 'Inactive':    [[0, 0], ['#bab8c7', '#363342']],
          \ 'Fill':        [[0, 0], ['#8a75f5', '#363342']],
          \ 'Tab':         [[0, 0], ['#2a2734', '#8e8aa3']],
          \ 'TabType':     [[0, 0], ['#2a2734', '#9a86fd']],
          \ 'TabSel':      [[0, 0], ['#2a2734', '#8a75f5']],
          \ 'TabFill':     [[0, 0], ['#2a2734', '#363342']],
          \ })
    hi CrystallineOk                guibg=#363342 guifg=#42ae2c
    hi CrystallineInfo              guibg=#363342 guifg=#21b8c7
    hi CrystallineWarn              guibg=#363342 guifg=#eead0e
    hi CrystallineError             guibg=#363342 guifg=#e0211d
  endif
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
