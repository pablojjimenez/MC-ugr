-------------------------------------
# Práctica 2. Expresiones Regulares con Flex++
-------------------------------------
Realizada por:
* Ángel Cabeza Martín
* Manuel Jurado Trillo
* Pablo Jiménez Jiménez

## 1. Descripción del problema abordado. 
El problema abordado consiste en un validador de quinielas de fútbol. 
Dada una quiniela en un fichero txt y los resultados de los partidos en otro txt, el programa comprueba la quiniela indicando los errores por partido y el cómputo final.

## 2. Explicación de cómo se ha abordado el problema.
La información extraída de los ficheros de entrada se almacena en una estructura de datos de tipo: `vector< pair<string, char> >` que almacena los partidos que se enfrentan y el resultado de la apuesta (1: gana el primer equipo, 2: gana el segundo equipo, 3: empate). Esto se compara con la quiniela del usuario. Finalmente, el programa vuelca unas estadísticas sobre tu jugada en la quiniela dada.

## 3. Un ejemplo de ejecución.
insertar foto

## 4. Ficheros creados en la práctica.
``` txt
.
├── color.h
├── data
│   ├── quiniela.txt
│   └── resultados.txt
├── Makefile
├── solucion.l
└── Memoria.pdf
1 directory, 6 files
```
- El fichero `color.h` para dar dinamismo a las salidas por consola.
- Los ficeros de `/data` son los ficheros de entrada del programa.
- El fichero `solucion.l` es el fichero lex.

##  5. Ficheros de entrada para el programa.
Se crean dos ficheros relacionados:
`quiniela.txt` con el formato `<equipo> <apuesta>` la apuesta puede ser **1** (gana el primer equipo), **2**(gana el segundo equipo) o **3** (empate).
`resultados.txt` con el formato `<equipo> <puntos> <equipo>`.

##  6. Compilar el programa
Hemos hecho un `Makefile` para facilitar la labor de compilación y ejecución.
solo es necesario hacer:
``` shell
$ make
```