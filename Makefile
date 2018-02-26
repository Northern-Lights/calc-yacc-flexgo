all:
	go generate
	go build

clean:
	rm lexer.go parser.go y.output calc-yacc-flexgo