# Makefile 
# MC 2020/2021

all:
	@echo "Compilando proyecto . . . ."
	flex++ *.l
	g++ lex.yy.cc -o programa color.h
	@echo "lanzando programa . . . ."
	clear
	@(./programa data/resultados.txt data/quiniela.txt)


compile:
	@echo "Compilando proyecto . . . ."
	flex++ *.l
	g++ lex.yy.cc -o programa color.h

clean:
	@(rm *.cc programa)