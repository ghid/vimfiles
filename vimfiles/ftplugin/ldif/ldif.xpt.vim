XPTemplate priority=personal

let s:f = g:XPTfuncs()

function! s:f.password(pw_pattern)
    let pattern = (a:pw_pattern != ''
                \ ? ' --pattern=' . a:pw_pattern
                \ : '')
    return system('pwgen' . pattern)
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
# Create a group (CAUTION: An existing group will be overwritten!)
dn: CN=`groupCn^,`OU=groups,DC=viessmann,DC=net^
objectclass: top
objectclass: groupOfNames
objectclass: ibm-nestedGroup
cn: `groupCn^
`Include:member^
`cursor^

# ldapadd -v -h lx150w05 -D cn=KundenManager,ou=admins,dc=viessmann,dc=net -w ? -f `^expand("%")^

XPT member " Add a member entries
member: CN=`user^,`OU=Mitarbeiter^`,DC=Viessmann,DC=Net^
`member...^member: CN=`user^,`OU=Mitarbeiter^`,DC=Viessmann,DC=Net^
`member...^

XPT addMember " Add a member to an existing group
dn: cn=`groupCn^,`ou=groups,dc=viessmann,dc=net^
changetype: modify
add: member
`Include:member^

XPT deleteMember " Remove a member from a group
dn: cn=`groupCn^,`ou=groups,dc=viessmann,dc=net^
changetype: modify
delete: member
`Include:member^

XPT techuser " Generate an user
dn: cn=`userCn^,`ou=admins^`,dc=viessmann,dc=net^
objectclass: top
objectclass: person
objectclass: organizationalPerson
objectclass: inetOrgPerson
objectclass: viPerson
cn: `userCn^
sn: `userCn^
viuid: `userCn^
displayname: `userCn^
uid: `userCn^
description: `TicketID^ Supporter: `supporter^
mail: `userCn^@viessmann.com
userpassword: `password('A$AAAaAAAaAA')^

dn: cn=AG_Atlassian_TechUser,ou=groups,dc=viessmann,dc=net
changetype: modify
add: member
member: cn=`userCn^,ou=admins,dc=viessmann,dc=Net

# dn: cn=AG_Jira_TechUser,ou=groups,dc=viessmann,dc=net
# changetype: modify
# add: member
# member: cn=`userCn^,ou=admins,dc=Viessmann,dc=Net

# dn: cn=AG_Confluence_TechUser,ou=groups,dc=viessmann,dc=net
# changetype: modify
# add: member
# member: cn=`userCn^,ou=admins,dc=viessmann,dc=Net

# dn: cn=AG_GIT_TechUser,ou=groups,dc=viessmann,dc=net
# changetype: modify
# add: member
# member: cn=`userCn^,ou=admins,dc=viessmann,dc=Net


