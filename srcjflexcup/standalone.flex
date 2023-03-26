//Parte 1 - Codice Utente
package de.jflex.example.standalone;
import main.java.org.example.Token;
import java_cup.runtime.Symbol;

%%

//Parte 2 - Opzioni e Dichiarazioni
%public
%class Lexer
%unicode   //Definisce il set di caratteri su cui lavorerà lo scanner
%cup       //Modalità di compatibilità CUP per interfacciarsi con un parser
%line
%column

%{

  StringBuffer string = new StringBuffer();

  //Gestione dei Token riconosciuti
  private Symbol symbol(int type) {
       return new Symbol(type, yyline, yycolumn);
  }

  private Symbol symbol(int type, Object value) {
       return new Symbol(type, yyline, yycolumn, value);
  }

  //Inizializzazione della classe Lexer per Tester
  Lexer(){}
%}

//Definizioni regolari *****************

LineTerminator = \r|\n|\r\n   //Sequenza di escape
InputCharacter = [^\r\n]
Whitespace = {LineTerminator} | [ \t\f]

//Commenti
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent = ( [^*] | \*+ [^/*] )*

//jletter e jletterdigit sono classi di caratteri predefinite
Identifier = [:jletter:] [:jletterdigit:]*
IntegerLiteral = 0|([1-9][0-9]*)(E[+|-]?[0-9]*)?
FloatLiteral = ((0|[1-9][0-9]*))\.[0-9]+(E[+|-]?[0-9]+)?

%%

//Parte 3 - Regole Lessicali

<YYINITIAL> {       //Lo stato in cui il lexer inizia la scansione.

//Keywords
"if" 		{ return symbol(Token.IF); }
"then" 		{ return symbol(Token.THEN); }
"else" 		{ return symbol(Token.ELSE); }
"for" 		{ return symbol(Token.FOR); }
"while" 	{ return symbol(Token.WHILE); }
"int"       { return symbol(Token.INT); }
"float"     { return symbol(Token.FLOAT); }

//Letterali
{IntegerLiteral}	{ return symbol(Token.INT, yytext()); }
{FloatLiteral}	    { return symbol(Token.FLOAT, yytext()); }

//Separatori
"(" 	{ return symbol(Token.OPT); }
")" 	{ return symbol(Token.QTT); }
"{" 	{ return symbol(Token.OPG); }
"}" 	{ return symbol(Token.QTG); }
"[" 	{ return symbol(Token.OPQ); }
"]" 	{ return symbol(Token.QTQ); }
"," 	{ return symbol(Token.VIR); }
";" 	{ return symbol(Token.PVIR); }

//Relop
"<" 	{ return symbol(Token.MIN); }
"<=" 	{ return symbol(Token.MINEQ); }
"=" 	{ return symbol(Token.EQ); }
"<>" 	{ return symbol(Token.DIS); }
">" 	{ return symbol(Token.MAX); }
">=" 	{ return symbol(Token.MAXEQ); }
"<--" 	{ return symbol(Token.ASSIGN); }

//Operatori Aritmetici
"+" 	{ return symbol(Token.ADD); }
"-" 	{ return symbol(Token.SUB); }
"*" 	{ return symbol(Token.MUL); }
"/" 	{ return symbol(Token.DIV); }
"%" 	{ return symbol(Token.MOD); }

//Operatori Logici
"&&" 	{ return symbol(Token.AND); }
"||" 	{ return symbol(Token.OR); }

//Identificatori
{Identifier} { return symbol(Token.ID, yytext()); }

//Whitespace
{Whitespace} { /* ignore */ }

//Commenti
{Comment} { /* ignore */ }

}

<<EOF>> { return symbol(Token.EOF); }

//Error fallback
[^] {
           throw new Error("Illegal character '" + yytext() + "'");
      }
"<-" {
           throw new Error("Illegal character '" + yytext() + "'");
      }