XPTemplate priority=lang

let s:f = g:XPTfuncs()

XPTinclude
      \ _common/common

XPT include " #Include ..
#Include `cursor^

XPT class " class .. [extends ..]
class `className^ `extends...{{^extends `parentClass^ `}}^{

    `cursor^

}

XPT property " Defines a property with get / set
`propertyName^[`^] {
`get...^
XSETm get...|post
    get {
        return this.`R("propertyName")^
    }
XSETm END
`set...^
XSETm set...|post
    set {
        return this.`R("propertyName")^ := value
    }
XSETm END
}`cursor^

XPT requires " requires() \{ return [..] \}
requires() {
    return [`cursor^]
}

XPT version " version() \{ return ".." \}
version() {
    return "`1.0.0^"
}`cursor^

XPT if " if (..) \{..\}
if (`expression^) {
    `cursor^
}

XPT ifelse " if (..) \{..\} else \{..\}
if (`expression^) {
    `statements^
} else {
    `cursor^
}

XPT ifelseif " if (..) \{..\} else if (..) \{..\}
if (`expression^) {
    `statements^
} else if (`anotherExpression^) {
    `cursor^
}

XPT ifelseifelse " if (..) \{..\} else if (..) \{..\} else \{..\}
if (`expression^) {
    `statements^
} else if (`anotherExpression^) {
    `anotherStatements^
} else {
    `cursor^
}

XPT for " for <key>,<value> in <list> \{..\}"
for `_^, `value^ in `list^ {
    `cursor^
}

XPT switch wrap " switch .. \{case ..:\} [default:..]
switch `switchValue^ {
`...^`Include:case^
`...^
}
..XPT

XPT case wrap " case ..:
case `constant^:
    `cursor^

XPT default " default:..
default:
    `cursor^

