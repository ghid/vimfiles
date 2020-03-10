function! crystalline#theme#onehalf#set_theme() abort
  if (&background ==? 'light')
    call crystalline#generate_theme({
          \ 'NormalMode':  [[231,  71], ['#fafafa', '#50a14f']],
          \ 'InsertMode':  [[231,  31], ['#fafafa', '#0184bc']],
          \ 'VisualMode':  [[231, 136], ['#fafafa', '#c18401']],
          \ 'ReplaceMode': [[231, 167], ['#fafafa', '#e45649']],
          \ '':            [[  0,   0], ['#dee6f7', '#707a8f']],
          \ 'Inactive':    [[  0,   0], ['#707a8f', '#b7c9eb']],
          \ 'Fill':        [[  0,   0], ['#b29762', '#b7c9eb']],
          \ 'Tab':         [[  0,   0], ['#dee6f7', '#8d95a5']],
          \ 'TabType':     [[  0,   0], ['#dee6f7', '#3d75e6']],
          \ 'TabSel':      [[  0,   0], ['#dee6f7', '#b29762']],
          \ 'TabFill':     [[  0,   0], ['#dee6f7', '#dee6f7']],
          \ })
    hi CrystallineOk                guibg=#b7c9eb guifg=#42ae2c
    hi CrystallineInfo              guibg=#b7c9eb guifg=#21b8c7
    hi CrystallineWarn              guibg=#b7c9eb guifg=#eead0e
    hi CrystallineError             guibg=#b7c9eb guifg=#e0211d
  else
    call crystalline#generate_theme({
          \ 'NormalMode':  [[236, 114], ['#282c34', '#98c379']],
          \ 'InsertMode':  [[236,  75], ['#282c34', '#61afef']],
          \ 'VisualMode':  [[236, 180], ['#282c34', '#e5c07b']],
          \ 'ReplaceMode': [[236, 168], ['#282c34', '#e06c75']],
          \ '':            [[  0,   0], ['#2a2734', '#787391']],
          \ 'Inactive':    [[  0,   0], ['#bab8c7', '#363342']],
          \ 'Fill':        [[  0,   0], ['#8a75f5', '#363342']],
          \ 'Tab':         [[  0,   0], ['#2a2734', '#8e8aa3']],
          \ 'TabType':     [[  0,   0], ['#2a2734', '#9a86fd']],
          \ 'TabSel':      [[  0,   0], ['#2a2734', '#8a75f5']],
          \ 'TabFill':     [[  0,   0], ['#2a2734', '#363342']],
          \ })
    hi CrystallineOk                guibg=#363342 guifg=#42ae2c
    hi CrystallineInfo              guibg=#363342 guifg=#21b8c7
    hi CrystallineWarn              guibg=#363342 guifg=#eead0e
    hi CrystallineError             guibg=#363342 guifg=#e0211d
  endif
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
