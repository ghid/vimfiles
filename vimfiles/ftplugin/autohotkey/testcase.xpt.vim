XPTemplate priority=personal+

let s:f = g:XPTfuncs()

XPTinclude
            \ _common/common

XPT testcase " Testcase boilerplate code
; ahk: console

#Include <testcase-libs>
#Include %ScriptDir%\..\\`myClass^.ahk

class `myClass^substitute(V(),'.','\u&',"")^Test extends TestCase {

    @Test_`myTest^() {
        `cursor^()
    }
}

exitapp `myClass^substitute(V(),'.','\u&',"")^Test.runTests()

