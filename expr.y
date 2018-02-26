/*
 * Adapted from expr.y in package:
        golang.org/x/tools/cmd/goyacc/testdata/expr
 *
 * Credits to The Go Authors.
 */

%{
package main

import "math"

var result float64
%}

%union {
   val float64
}

%token NUMBER
%token PLUS MINUS MULT DIV EXPON
%token EOL
%token LB RB

%left  MINUS PLUS
%left  MULT DIV
%right EXPON

%type  <val> exp NUMBER

%%
input   :
        | input line
        ;

line    : EOL
        | exp EOL { result = $1 }

exp     : NUMBER { $$ = $1 }
        | exp PLUS  exp          { $$ = $1 + $3;   }
        | exp MINUS exp          { $$ = $1 - $3;   }
        | exp MULT  exp          { $$ = $1 * $3;   }
        | exp DIV   exp          { $$ = $1 / $3;   }
        | MINUS  exp %prec MINUS { $$ = -$2;       }
        | exp EXPON exp          { $$ = math.Pow($1,$3);}
        | LB exp RB                      { $$ = $2;        }
        ;

%%