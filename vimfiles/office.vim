function! SetMyWinPos()
    let monitorInfo=system('WhereAmI.exe')
    " Laptop
    if monitorInfo=='1[0:38:2048:1152]'
        set linespace=2
        set lines=30
        set columns=135
        winpos 7 46
    " Laptop 2K
    elseif monitorInfo=='1[0:38:1920:1080]'
        set linespace=2
        set lines=28
        set columns=127
        winpos 1 48
    " Laptop 4K
    elseif monitorInfo=='1[0:76:3840:2160]'
        set linespace=2
        set lines=29
        set columns=131
        winpos 6 90
    " Dockingstation Office
    elseif monitorInfo=='1[0:30:1680:1050][1680:30:3360:1050]'
        set lines=35
        set columns=151
        set linespace=2
        winpos 1677 33
    else
        echom "office.vim - Unkwown location: " . monitorInfo
    endif
endfunction
