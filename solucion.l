%option noyywrap
/********* DECLARACIONES **********/
%{

#include <iostream>
#include <fstream>
#include <vector>
#include "color.h"
#include <string>
#include <iomanip>
using namespace std;

//ifstream fquiniela, frtado;
ifstream fichero;
vector< pair<string, char> > partidos;
vector< pair<string, char> > quinielas;
pair<int,int> resultado;
string algo;
int i = 0;
int j = 0;
bool fichero2 = false;
void mostrarEstadisticas();
int posPartido(string a_buscar);
void mostrarEquiposGanadores();
void mostrarEquiposPerdedores();
void mostrarEquiposEmpatados();
%}

%%

[-] {
        algo += "-";
};

X   {
    quinielas.push_back(make_pair(algo,'X'));
};

[a-zA-z]    {
        algo += yytext;
};

[" "] {
    if (!fichero2){
        if (i == 0){
            i++;
        }
        else{
            i = 0;
        }
    }
};

[0-9]   {

    if (!fichero2){
        int a;
        a = atoi(yytext);
        if (j == 0){
            resultado.first = a;
            j++;
        }
        else{
            resultado.second = a;
            j=0;
        }
    }
    else{
        quinielas.push_back(make_pair(algo,*(yytext)));
    }
};

\t {};

\n {
    if (!fichero2){
        if (resultado.first > resultado.second)
            partidos.push_back(make_pair(algo,'1'));
        else if (resultado.first < resultado.second)
            partidos.push_back(make_pair(algo,'2'));
        else
            partidos.push_back(make_pair(algo,'X'));
    }

    algo = "";
};

%%

/********* PROCEDIMIENTOS **********/

int main(int argc, char ** argv) {

    if (argc != 3){
        cout << _RED("Numero de argumentos incorrecto") << endl;
        exit(1);
    }

    cout << CYN("Leyendo datos...") << endl;
    fichero.open(argv[1]);

    if (!fichero){
        cout << _RED("Nombre del fichero erroneo") << endl;
        exit(2);
    }

    yyFlexLexer flujo(&fichero, 0);
    flujo.yylex();

    fichero.close();
    fichero2 = true;
    fichero.open(argv[2]);

    if (!fichero){
        cout << _RED("Nombre del segundo fichero erroneo") << endl;
        exit(2);
    }
    yyFlexLexer flujo2(&fichero, 0);
    flujo2.yylex();
    fichero.close();

    cout << GRN("¡Se han leido los datos correctamente!") << endl << endl;

    mostrarEstadisticas();
    
    return 0;
}

void mostrarEstadisticas() {
    int aciertos = 0;
    int id;

    for (int i = 0; i < quinielas.size(); i++){
        cout << "\x1B[33m" << quinielas[i].first << "\x1B[0m";

        for (int j=quinielas[i].first.length(); j<=30; j++){
            cout<<" ";
        }
        cout << "Tu prediccion: " << quinielas[i].second << "\t\t";

        id = posPartido(quinielas[i].first);
        cout << "Resultado: " << partidos[id].second << "\t\t";
        
        if (quinielas[i].second == partidos[id].second){
            cout << GRN("¡Acierto! ✓") << endl;
            aciertos++;
        }
        else{
            cout << RED("Has fallado") << endl;
        }
    }

    cout << endl << endl << BOLD("Has acertado:")<< " " << "\x1B[1m" << aciertos << "\x1B[0m"<< BOLD("/") << "\x1B[1m" << partidos.size() << "\x1B[0m" << endl;
    cout << endl << endl << UNDL("Equipos que han ganado:") << endl << endl;
    mostrarEquiposGanadores();

    cout << endl << endl << UNDL("Equipos que han perdido:") << endl << endl;
    mostrarEquiposPerdedores();

    cout << endl << endl << UNDL("Equipos que han empatado:") << endl << endl;
    mostrarEquiposEmpatados();
}

int posPartido(string a_buscar){
    int pos = -1;

    for (int i = 0; i < partidos.size(); i++){
        if (a_buscar == partidos[i].first){
            pos =  i;
        }
    }

    return pos;
}

void mostrarEquiposGanadores(){
    int pos;
    string equipos_ganadores;
    for (int i = 0; i < partidos.size(); i++){
        if (partidos[i].second == '1'){
            pos = partidos[i].first.find("-");
            equipos_ganadores+= "\t" + partidos[i].first.substr(0,pos);
            equipos_ganadores+="\n";
        }
        if (partidos[i].second == '2'){
            pos = partidos[i].first.find("-");
            equipos_ganadores+= "\t" + partidos[i].first.substr(pos+1,partidos[i].first.length());
            equipos_ganadores+="\n";
        }
    }

    cout << equipos_ganadores << endl;
}

void mostrarEquiposPerdedores(){
    int pos;
    string equipos_perdedores;
    for (int i = 0; i < partidos.size(); i++){
        if (partidos[i].second == '1'){
            pos = partidos[i].first.find("-");
            equipos_perdedores+= "\t" + partidos[i].first.substr(pos+1,partidos[i].first.length());
            equipos_perdedores+="\n";
        }
        if (partidos[i].second == '2'){
            pos = partidos[i].first.find("-");
            equipos_perdedores+= "\t" + partidos[i].first.substr(0,pos);
            equipos_perdedores+="\n";
        }
    }

    cout << equipos_perdedores << endl;
}

void mostrarEquiposEmpatados(){
    string equipos_empatados;
    int pos;
    for (int i = 0; i < partidos.size(); i++){
        if (partidos[i].second == 'X'){
            pos = partidos[i].first.find("-");
            equipos_empatados+= "\t" + partidos[i].first.substr(pos+1,partidos[i].first.length()) + "\n";
            equipos_empatados+= "\t" + partidos[i].first.substr(0,pos);
            equipos_empatados+="\n";
        }
    }

    cout << equipos_empatados << endl;
}