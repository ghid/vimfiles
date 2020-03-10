XPTemplate priority=personal

let s:f = g:XPTfuncs()

function! s:f.password()
    return system('pwgen')
endfunction

XPTinclude
      \ _common/common

XPT version " Insert version directive
version: 1

XPT genpwd " Generate a password
dn: CN=`shortSign^,OU=Mitarbeiter,DC=Viessmann,DC=Net
changetype: modify
replace: userpassword
userpassword: `password()^

XPT createGroup " Create an LDAP group
# Create a group (Caution: An existing group will be overwritten!)
dn: CN=`groupCn^,`OU=groups,DC=viessmann,DC=net^
objectclass: top
objectclass: groupOfNames
objectclass: ibm-nestedGroup
cn: `groupCn^
`Include:member^
# If the group exist, it will be overwritten!

XPT member " Add a member entries
member: CN=`user^,`OU=Mitarbeiter,DC=Viessmann,DC=Net^
`member...^member: CN=`user^,`OU=Mitarbeiter,DC=Viessmann,DC=Net^
`member...^

XPT addMember " Add a member to an existing group
dn: cn=`groupCn^,`ou=groups,dc=viessmann,dc=net^
changetype: modify
add: member
`Include:member^

