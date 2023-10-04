//package Analizadores;

//import java_cup.runtime.*;
import java.util.LinkedList;

%%

%public
%class Lexer
%unicode
%char
%column
%line
%ignorecase
%standalone

%{
    //Lista de errores lexicos
    
%}


/*----Macros-----*/
 
FinDeLinea          = \r|\n|\r\n
EntradaDeCaracter   = [^\r\n]
EspacioEnBlanco     = {FinDeLinea} | [ \t\f]

/* comentarios */ 
comentario          = {ComentatioTradicional} | {ComentarioFinDeLinea} | {ComentarioDeDocumentacion}

// Tipos de comentario
ComentatioTradicional       = "#*" [^*] ~"*#" | "#*" "*"+ "#"
ComentarioFinDeLinea        = "#" {EntradaDeCaracter}* {FinDeLinea}?
ComentarioDeDocumentacion   = "#*" {ContenidoDeComentario} "*"+ "#"
ContenidoDeComentario       = ( [^*] | \*+ [^#*] )*

/* Variables para cadendas de texto*/
CadenaDeTexto = \" ({EntradaDeCaracter}* {FinDeLinea}?)*\"

/* Identificador */
Letra = [A-ZÑ_]
Digito = [0-9]
Identificador = {Letra}({Letra}|{Digito})*

/* Número */
NumeroEntero = 0 | [1-9]{Digito}* | -[1-9]{Digito}*

/* Número Real */
NumeroReal = ({NumeroEntero}|-0)"."{Digito}+

%%
/*----Reglas lexicas----*/

/* Comentarios o espacios en blanco */

<YYINITIAL> "!" { System.out.println("Se encontro el lexema " + yytext()); }

<YYINITIAL> "using" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "end" { System.out.println("Se encontro el lexema " + yytext()); }

/* Variable Constante */
<YYINITIAL> "const" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "var" { System.out.println("Se encontro el lexema " + yytext()); }

/* Bloques */
<YYINITIAL> "begin" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "loop" { System.out.println("Se encontro el lexema " + yytext()); }

/* Estructuras de control */
<YYINITIAL> "if" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "else" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "repeat" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "while" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "do" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "switch" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "case" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "break" { System.out.println("Se encontro el lexema " + yytext()); }

/* Librerías incluidas */
<YYINITIAL> "motors" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "sensors" { System.out.println("Se encontro el lexema " + yytext()); }

/* Tipos de dato */
<YYINITIAL> "int" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "real" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "boolean" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "string" { System.out.println("Se encontro el lexema " + yytext()); }

/* Booleanos literales */
<YYINITIAL> "true" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "false" { System.out.println("Se encontro el lexema " + yytext()); }

/* Operadores LÓGICOS */
<YYINITIAL> "AND" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "OR" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "NOT" { System.out.println("Se encontro el lexema " + yytext()); }

/* Operadores aritméticos */
<YYINITIAL> "+" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "-" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "/" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "*" { System.out.println("Se encontro el lexema " + yytext()); }

/* Operadores relacionales */
<YYINITIAL> ">" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "<" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> ">=" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "<=" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "==" { System.out.println("Se encontro el lexema " + yytext()); }

/* Números real y entero */
<YYINITIAL> {NumeroEntero} { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> {NumeroReal} { System.out.println("Se encontro el lexema " + yytext()); }

/* Operadores de agrupación */
<YYINITIAL> "(" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> ")" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "{" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "}" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "[" { System.out.println("Se encontro el lexema " + yytext()); }
<YYINITIAL> "]" { System.out.println("Se encontro el lexema " + yytext()); }

<YYINITIAL> {CadenaDeTexto} { System.out.println("Se encontro el la cadena " + yytext());}
<YYINITIAL> {comentario} { System.out.println("Se encontro el comentario" + yytext());}
<YYINITIAL> {EspacioEnBlanco} {/**/}



[^]                              { throw new RuntimeException("Error lexico Caracter ilegal en el lenguaje \""+yytext()+
                                                              "\" at line "+yyline+", column "+yycolumn); }