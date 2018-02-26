/*
 * expr.lex : Scanner for a simple
 *            expression parser.
 * Adapted from: github.com/pebbe/flexgo/examples/manual/expr.lex
 *
 * Credits to the original author.
 */

%top{
package main

import (
  "fmt"
  "io"
  "log"
  "os"
  "strconv"
)

// return type of yy.Lex()
// The adapter simply converts it to an int for goyacc.
type YYtype interface{}

// type of Scanner.Context
type YYcontext interface{}

}

%{

// Define a constant for end-of-file
const eof = 0

// These globals must be accessible to the goyacc parser.
// Bear in mind that the xx prefix is used because the parser is generated
// with this prefix in order to avoid name collisions.
var yylval *xxSymType
var err error // Actually, this is global for lexer action access.

%}

%%

[0-9]+     {
              yylval.val, err = strconv.ParseFloat(string(yytext), 64)
              if err != nil {
                fmt.Println("Number error:", err)
                return EOL
              }
              return NUMBER
}
[0-9]+\.[0-9]+ {
              yylval.val, err = strconv.ParseFloat(string(yytext), 64)
              if err != nil {
                fmt.Println("Number error:", err)
                return EOL
              }
              return NUMBER
}
"+"        return PLUS
"-"        return MINUS
"*"        return MULT
"/"        return DIV
"^"        return EXPON
"("        return LB
")"        return RB
\n         return EOL
<<EOF>>    return eof
[\t ]*     /* throw away whitespace */
.          { // yyerror("Illegal character");
              fmt.Println("Illegal character")
              return EOL
           }
%%