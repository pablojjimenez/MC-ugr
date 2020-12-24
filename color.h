#ifndef _COLORS_
#define _COLORS_

// como parámetro del flujo de salida.
#define RST   "\x1B[0m"          // reset
#define KRED  "\x1B[31m"        // rojo
#define KGRN  "\x1B[32m"        // verde
#define KYEL  "\x1B[33m"        // amarillo
#define KBLU  "\x1B[34m"        // azul
#define KMAG  "\x1B[35m"        // magenta
#define KCYN  "\x1B[36m"        // azul cian
#define KWHT  "\x1B[37m"        // blanco

// Fondo de color
#define FGRN  "\u001B[42m"
#define FRED  "\u001B[41m"
#define FYEL  "\u001B[43m"
#define FBLU  "\u001B[44m"
#define FMAG  "\u001B[45m"
#define FCYN  "\u001B[46m"
#define FWHT  "\u001B[47m"
#define FBLK  "\u001B[40m"

// En forma de función:
#define RED(x) KRED x RST       // rojo
#define GRN(x) KGRN x RST       // verde
#define YEL(x) KYEL x RST       // amarillo
#define BLUE(x) KBLU x RST       // azul
#define MAG(x) KMAG x RST       // magenta
#define CYN(x) KCYN x RST       // azul cian
#define WHT(x) KWHT x RST       // negrita fuerte

#define BOLD(x) "\x1B[1m" x RST // negrita
#define UNDL(x) "\x1B[4m" x RST // Subrayado
#define CURS(x) "\x1B[3m" x RST // cursiva

#define _GRN(x) FGRN x RST
#define _RED(x) FRED x RST
#define _YEL(x) FYEL x RST
#define _BLU(x) FBLU x RST
#define _MAG(x) FMAG x RST
#define _CYN(x) FCYN x RST
#define _WHT(x) FWHT x RST
#define _BLK(x) FBLK x RST

#endif  /* _COLORS_ */