function! crystalline#theme#ayu#set_theme() abort
  if g:ayucolor == "light"
    hi CrystallineNormalMode          guibg=#36a3d9 guifg=#f3f3f3
    hi CrystallineInsertMode          guibg=#4cbf99 guifg=#f3f3f3
    hi CrystallineVisualMode          guibg=#f29718 guifg=#f3f3f3
    hi CrystallineReplaceMode         guibg=#ff3333 guifg=#f3f3f3
    hi Crystalline                    guibg=#d9d8d7 guifg=#6d4198
    hi CrystallineInactive            guibg=#f3f3f3 guifg=#828c99
    hi CrystallineFill                guibg=#f3f3f3 guifg=#828c99
    hi CrystallineEmphasize           guibg=#828c99 guifg=#f3f3f3
    hi CrystallineTab                 guibg=#d9d9d7 guifg=#5c6773
    hi CrystallineTabType             guibg=#828c99 guifg=#f3f3f3
    hi CrystallineTabSel              guibg=#d9d8d7 guifg=#828c99
    hi CrystallineTabFill             guibg=#f3f3f3 guifg=#828c99
    hi CrystallineOk                  guibg=#86b300 guifg=#f3f3f3
    hi CrystallineWarn                guibg=#e7c547 guifg=#f3f3f3
    hi CrystallineError               guibg=#f07178 guifg=#f3f3f3
    hi CrystallineBufferNoActive      guibg=#eead0e guifg=#e7e5eb
    hi CrystallineBufferNoInactive    guibg=#e7e5eb guifg=#828c99
    " #FAFAFA
    " #ABB0B6
    " #F07178
    " #A37ACC
    " #E7C547
    " #36A3D9
    " #4CBF99
    " #86B300
    " #F29718
    " #E6B673
    " #FF7733
    " #FF3333
    " #FF6A00
    " #FFFFFF
    " #D9D8D7
    " #F3F3F3
    " #F0EEE4
    " #5C6773
    " #828C99
  endif
endfunction


" vim:set et sw=2 ts=2 fdm=marker:
