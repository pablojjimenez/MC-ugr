%option noyywrap
/********* DECLARACIONES **********/
%{

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
using namespace std;

//ifstream fquiniela, frtado;
ifstream fichero;
//vector< pair<string, char> > partidos;
string algo;
int i = 0;
void mostrarInfo(string a);
%}

%%

[a-zA-z]    {
        algo += yytext;
};

[" "] {
    if (i == 0){
        algo += "-";
        i++;
    }
    else{
        i = 0;
    }
};

\n {
    cout << algo << endl;
};

%%

/********* PROCEDIMIENTOS **********/

int main(int argc, char ** argv) {

    fichero.open(argv[1]);

    yyFlexLexer flujo(&fichero, 0);
    flujo.yylex();

    cout << algo;
    return 0;
}

void mostrarInfo(string a) {
    cout << "HOla que ase" << endl;
    cout << a << endl;
}