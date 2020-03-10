function! SetMyWinPos()
    let monitorInfo=system('WhereAmI.exe')
    " Laptop
    if monitorInfo=='1[0:30:1638:921]'
        set lines=33
        set columns=145
        winpos 3 45
    " Dockingstation Office
    elseif monitorInfo=='1[0:30:1680:1050][1680:30:3360:1050]'
        set lines=40
        set columns=166
        winpos 1682 35
    else
        echo "office.vim - Unkwon location: " . monitorInfo
    endif
endfunction
