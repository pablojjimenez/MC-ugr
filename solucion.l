/********* DECLARACIONES **********/
%{

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
using namespace std;

ifstream fquiniela, frtado;
vector< pair<string, char> > partidos;
char * algo;
mostrarInfo(char * a);
%}

%%

[A-za-z]+ {
    algo = yyText();
}

%%

/********* PROCEDIMIENTOS **********/

int main(int argc, char ** argv) {

    fquiniela.open(argv[1]);
    if(fquiniela == 0) {
        cerr << "ERROR\n";
        return 1;
    }

    yyFlexLexer flujo(&fquiniela, 0);
    flujo.yylex();
    mostrarInfo(algo);

    cout << algo << endl;

    return 0;
}

mostrarInfo(char * a) {
    cout << a << endl;
}