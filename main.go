//go:generate goyacc -p xx -o parser.go expr.y
//go:generate $GOPATH/bin/flexgo -G -o lexer.go expr.l

package main

import (
	"fmt"
	"log"
	"os"
)

func main() {
	for {
		if _, err := os.Stdout.WriteString("> "); err != nil {
			log.Fatalf("WriteString: %s", err)
		}

		var lexer = Lexer{
			lexer: *NewScanner(),
		}
		lexer.lexer.Filename = "<stdin>"

		xxParse(&lexer)

		fmt.Printf("Result: %f\n", result)
	}
}
