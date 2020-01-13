function! SetMyWinPos()
    let monitorInfo=system('WhereAmI')
    " Laptop
    if monitorInfo=='1[0:38:2048:1152]'
        set lines=33
        set columns=145
        winpos 3 45
    " Dockingstation Office
    else
        set lines=40
        set columns=166
        winpos 1682 35
    endif
endfunction
