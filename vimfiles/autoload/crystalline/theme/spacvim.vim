function! crystalline#theme#spacvim#set_theme() abort
  if (&background ==? 'light')
    hi CrystallineNormalMode        guibg=#eead0e guifg=#212026
    hi CrystallineInsertMode        guibg=#86dc2f guifg=#212026
    hi CrystallineVisualMode        guibg=#b2b2b2 guifg=#212026
    hi CrystallineReplaceMode       guibg=#ff82b1 guifg=#212026
    hi Crystalline                  guibg=#E7E5EB guifg=#655370
    hi CrystallineInactive          guibg=#f3f3f3 guifg=#828c99
    hi CrystallineFill              guibg=#f3f3f3 guifg=#828c99
    hi CrystallineEmphasize         guibg=#e7e5eb guifg=#6d3e94 gui=bold
    hi CrystallineTab               guibg=#d3d3e7 guifg=#655370
    hi CrystallineTabType           guibg=#d2ceda guifg=#f3f3f3
    hi CrystallineTabSel            guibg=#d9d8d7 guifg=#828c99
    hi CrystallineTabFill           guibg=#f3f3f3 guifg=#828c99
    hi CrystallineOk                guibg=#f3f3f3 guifg=#42ae2c
    hi CrystallineInfo              guibg=#f3f3f3 guifg=#21b8c7
    hi CrystallineWarn              guibg=#f3f3f3 guifg=#eead0e
    hi CrystallineError             guibg=#f3f3f3 guifg=#e0211d
    hi CrystallineBufferNoActive    guibg=#eead0e guifg=#e7e5eb
    hi CrystallineBufferNoInactive  guibg=#e7e5eb guifg=#828c99
  else
    hi CrystallineNormalMode        guibg=#eead0e guifg=#212026
    hi CrystallineInsertMode        guibg=#86dc2f guifg=#212026
    hi CrystallineVisualMode        guibg=#b2b2b2 guifg=#212026
    hi CrystallineReplaceMode       guibg=#ff82b1 guifg=#212026
    hi Crystalline                  guibg=#212026 guifg=#a094a2
    hi CrystallineInactive          guibg=#212026 guifg=#828c99
    hi CrystallineFill              guibg=#212026 guifg=#a094a2
    hi CrystallineEmphasize         guibg=#212026 guifg=#6d3e94 gui=bold
    hi CrystallineTab               guibg=#5d4d7a guifg=#a094a2
    hi CrystallineTabType           guibg=#5d4d7a guifg=#a094a2
    hi CrystallineTabSel            guibg=#d9d8d7 guifg=#828c99
    hi CrystallineTabFill           guibg=#212026 guifg=#a094a2
    hi CrystallineOk                guibg=#212026 guifg=#42ae2c
    hi CrystallineInfo              guibg=#212026 guifg=#21b8c7
    hi CrystallineWarn              guibg=#212026 guifg=#eead0e
    hi CrystallineError             guibg=#212026 guifg=#e0211d
    hi CrystallineBufferNoActive    guibg=#eead0e guifg=#e7e5eb
    hi CrystallineBufferNoInactive  guibg=#655370 guifg=#a094a2
  endif

  " base #655370
  " base-dim #a094a2
  " war #dc752f
  " err #e0211d
  " suc #42ae2c
  " bg1 #fbf8ef
  " bg2 #efeae9
  " bg3 #e3dedd
  " bg4 #d2ceda
  " #edf2e9
  " #edf1ed
endfunction

" vim:set et sw=2 ts=2 fdm=marker:
