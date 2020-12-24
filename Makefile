


all:
	@echo "Compilando proyecto . . . ."
	flex++ *.l
	g++ lex.yy.cc -o programa color.h
	@echo "lanzando programa . . . ."
	clear
	./programa data/resultado.txt

clean:
	@(rm *.cc programa)