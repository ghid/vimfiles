XPTemplate priority=personal+

let s:f = g:XPTfuncs()

XPTinclude
			\ _common/common

XPT cui " Command line user interface app boilerplate code
; ahk: console
#Warn all, StdOut

; @todo Define main project class
class `appName^ `extends...^{
XSETm extends...|post
extends `className^ 
XSETm END

	requires() {
		return [Ansi, OptParser, String]
	}
	`cursor^
	class Options {
		static n1 := 0
		static n2 := 0
		static help := false
	}

	; @todo Add neccessary methods
	add() {
		if (!System.typeOf(`appName^.Options.n1, "number")) {
			throw Exception("Add: n1 is not a number: " `appName^.Options.n1)
		}
		if (!System.typeOf(`appName^.Options.n2, "number")) {
			throw Exception("Add: n2 is not a number: " `appName^.Options.n2)
		}
		return `appName^.Options.n1 "+" `appName^.Options.n2
				. "=" (`appName^.Options.n1 + `appName^.Options.n2)
	}

	; @todo 'cli' method to create the CLI
	cli() {
		op := new OptParser("`appName^: -o <add|sub> "
				. " --n1=<value-1> --n2=<value-2>")
		op.add(new OptParser.Callback("o", "operation"
				, `appName^.Options, "operation"
				, "Operations", "operation"
				, ["Define which operation to be performed:"
				, ". add: perform addition"
				, ". sub: perform substraction"] , OptParser.OPT_ARG))
		op.add(new OptParser.String(0, "n1"
				, `appName^.Options, "n1", "value-1"
				, "The first value for the calculation"))
		op.add(new OptParser.String(0, "n2"
				, `appName^.Options, "n2", "value-2"
				, "The second value for the calculation"))
		op.add(new OptParser.Boolean("h", "help"
				, `appName^.Options, "help"
				, "Display usage", OptParser.OPT_HIDDEN))
		return op
	}

	; @todo 'run' method to parse and process cli options
	run(args) {
		try {
			rc := 1
			op := `appName^.cli()
			args := op.parse(args)
			if (`appName^.Options.help) {
				Ansi.writeLine(op.usage())
				rc := ""
			} else if (!`appName^.Options.operation) {
				throw Exception("Specify an operation")
			} else if (`appName^.Options.operation = "add") {
				Ansi.writeLine(`appName^.add())
			} else {
				throw Exception("Unimplemented operation: "
						. `appName^.Options.operation)
			}
		} catch e {
			Ansi.writeLine(e.message)
			Ansi.writeLine(op.usage())
			rc := 0
		}
		return rc
	}
}

; @todo Define other functions (e.g. callback functions for parser)
operations(aValue) {
	if (RegExMatch(aValue, "i)\^(add|sub)$", $)) {
		return $
	} else {
		throw Exception("Invalid operation: " aValue)
	}
}

; @todo Add #Directives - not testable code til exitapp...
#NoEnv ; notest-begin
#Include <app>
#Include <cui-libs>

; @todo Implement main routine
Main:
exitapp App.checkRequiredClasses(`appName^).run(A_Args) ; notest-end

