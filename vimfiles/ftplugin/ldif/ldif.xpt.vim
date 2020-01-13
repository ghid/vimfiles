XPTemplate priority=personal

let s:f = g:XPTfuncs()

function! s:f.password()
    return system('pwgen')
endfunction

XPTinclude
      \ _common/common


XPT genpwd " Generate a password
dn: CN=`shortSign^,OU=Mitarbeiter,DC=Viessmann,DC=Net
changetype: modify
replace: userPassword
userPassword: `password()^
`cursor^

