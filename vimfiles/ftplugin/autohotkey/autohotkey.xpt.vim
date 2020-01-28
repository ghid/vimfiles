XPTemplate priority=lang

let s:f = g:XPTfuncs()

XPTinclude
      \ _common/common

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

