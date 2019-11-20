XPTemplate priority=personal+

XPT exdelay " Boilerplate code for Expansion Delay
set `test_expansion_delay^=pass
if !`test_expansion_delay^! NEQ pass (
    set `test_expansion_delay^=
    start /B /WAIT cmd.exe /V:ON /C "%0" %*
    goto:eof
)
set `test_expansion_delay^=
`cursor^

XPT depcheck " Check Dependencies for required programs
:check_dependency
    set cd_req_opt=%1
    set cd_file=%2
    set cd_path=%3
    set cd_full_path=
    set ERRORLEVEL=0

    if "%cd_path%"=="" (
        set cd_path=.;!PATH!
        for /D %%f in (%cd_file%) do if "%%~$cd_path:f"=="" set ERRORLEVEL=1
    ) else (
        if not exist %cd_path%\%cd_file% set ERRORLEVEL=1
    )
    if "%ERRORLEVEL%"=="1" if /I "%cd_req_opt:~0,3%"=="req" (
        echo error: Can't find %cd_file%
        exit
    )
goto:eof${0}
