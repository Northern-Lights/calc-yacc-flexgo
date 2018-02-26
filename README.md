# What is this?

This is a proof-of-concept app that combines the goyacc parser:
	`golang.org/x/tools/cmd/goyacc/testdata/expr`

with the flexgo lexer:
	`github.com/pebbe/flexgo`

The idea is to use the two in tandem as bison and flex are used in C.

The generate directives below will produce `.go` files from the parser
and lexer files.  The prefixing is necessary to avoid name collisions
between the two tools when their `.go` outputs are destined for the
same package.

# Requirements

`goyacc` is expected to be in the `$PATH` while `flexgo` is expected to be
precisely in `$GOPATH/bin` in order for the generate directive to work.

# Building

You can simply run `make` to build the example program.  Or if you feel like doing it manually, read on...

To generate the lexer and parser files:

`go generate`

To build the example program:

`go build`

# Usage

To run the program:

`./calc-yacc-flexgo`

The application waits for the user to enter an expression.

__For this example, the END-OF-INPUT must be given after the expression is entered (i.e. the user presses Enter and gives a new line.)  For UNIX/Linux systems, this means that `Ctrl + D` must be given to see the result__  I hope to fix this soon to make the example easier and much more clear.