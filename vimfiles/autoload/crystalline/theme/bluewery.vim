function! crystalline#theme#bluewery#set_theme() abort
  if (&background ==? 'light')
    call crystalline#generate_theme({
          \ 'NormalMode':  [[231,  71], ['#CDC7B0', '#418182']],
          \ 'InsertMode':  [[231,  31], ['#294F5D', '#d65b7f']],
          \ 'VisualMode':  [[231, 136], ['#294F5D', '#4d8d77']],
          \ 'ReplaceMode': [[231, 167], ['#294F5D', '#978f65']],
          \ '':            [[  0,   0], ['#294F5D', '#B7C1AA']],
          \ 'Inactive':    [[  0,   0], ['#CDC7B0', '#294F5D']],
          \ 'Fill':        [[  0,   0], ['#294F5D', '#C7C1AA']],
          \ 'Tab':         [[  0,   0], ['#294F5D', '#B7C1AA']],
          \ 'TabType':     [[  0,   0], ['#294F5D', '#B7C1AA']],
          \ 'TabSel':      [[  0,   0], ['#CDC7B0', '#D16445']],
          \ 'TabFill':     [[  0,   0], ['#294F5D', '#C7C1AA']],
          \ })
    hi CrystallineOk                guibg=#C7C1AA guifg=#4d8d77
    hi CrystallineInfo              guibg=#C7C1AA guifg=#418182
    hi CrystallineWarn              guibg=#C7C1AA guifg=#FFF1AC
    hi CrystallineError             guibg=#C7C1AA guifg=#d16445
  else
    call crystalline#generate_theme({
          \ 'NormalMode':  [[236, 114], ['#244444', '#6FAEAF']],
          \ 'InsertMode':  [[236,  75], ['#244444', '#FB81A5']],
          \ 'VisualMode':  [[236, 180], ['#244444', '#5BC6A1']],
          \ 'ReplaceMode': [[236, 168], ['#244444', '#FFF1AC']],
          \ '':            [[  0,   0], ['#DAFAFC', '#296873']],
          \ 'Inactive':    [[  0,   0], ['#DAFAFC', '#296873']],
          \ 'Fill':        [[  0,   0], ['#DAFAFC', '#244444']],
          \ 'Tab':         [[  0,   0], ['#DAFAFC', '#296873']],
          \ 'TabType':     [[  0,   0], ['#DAFAFC', '#296973']],
          \ 'TabSel':      [[  0,   0], ['#DAFAFC', '#DE7353']],
          \ 'TabFill':     [[  0,   0], ['#244444', '#244444']],
          \ })
    hi CrystallineOk                guibg=#244444 guifg=#5bc6a1
    hi CrystallineInfo              guibg=#244444 guifg=#6faeaf
    hi CrystallineWarn              guibg=#244444 guifg=#fff1ac
    hi CrystallineError             guibg=#244444 guifg=#de7353
  endif
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
