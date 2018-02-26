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

		// Lexer is our adapter; NewScanner() produces the flexgo lexer
		var lexer = Lexer{
			lexer: *NewScanner(),
		}

		// xxParse comes from the parser which uses the lexer adapter.
		xxParse(&lexer)

		// After Ctrl + D, the result will be printed.
		fmt.Printf("Result: %f\n", result)
	}
}
