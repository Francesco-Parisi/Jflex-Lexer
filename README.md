# Jflex-Lexer

Realizzazione di un Lexer in Java, utilizzando Jflex.

Esercitazione 2 del Corso Compilatori dell'Università degli studi di Salerno.
## Regular Expression

|Definizione Regolare | Espressione Regolare|
|-------------------|-------------------|
|LineTerminator | \r\|\n\|\r\n |
|InputCharacter | [^\r\n] | 
|WhiteSpace | {LineTerminator} \| [ \t\f] |
|Comment | {TraditionalComment} \| {EndOfLineComment} | {DocumentationComment} |
|TraditionalComment | "/*" [^*] ~"*/"  \| "/*" "*"+ "/" |
|EndOfLineComment |  "//" {InputCharacter}* {LineTerminator}? |
|DocumentationComment | "/**" {CommentContent} "*"+ "/" |
|CommentContent | ( [^*] \| \*+ [^/*] )* |
|||
|Identifier | [:jletter:] [:jletterdigit:]* |
|||
|IntegerLiteral | 0\|([1-9][0-9]*)(E[+\|-][0-9]*)?|
|||
|FloatLiteral | ((0\|[1-9][0-9]*))\.[0-9]+(E[+\|-]?[0-9]+)? |

## Lexical Table

|Lessema|Token|Attributo|
|---|---|---------|
|**Delimitatori**|
|* *|-|-|
|*\n*|-|-|
|*\t*|-|-|
|*"*|-|-|
||||
|**Separatori**|
|(|-|OPT|
|)|-|QTT|
|{|-|OPG|
|}|-|QTG|
|[|-|OPQ|
|]|-|QTQ|
|,|-|VIR|
|;|-|PVIR|
||||
|**Relop**|
|<|RELOP|MIN|
|<=|RELOP|MINEQ|
|=|RELOP|EQ|
|<>|RELOP|DIS|
|>|RELOP|MAX|
|>=|RELOP|MAXEQ|
|<--|RELOP|ASSIGN|
||||
|**Identificatori**|
|id|-|-|
||||
|**Numeri**|
|numero|-|-|
||||
|**Operatori Aritmetici**|
|+|AOP|ADD|
|-|AOP|SUB|
|*|AOP|MUL|
|/|AOP|DIV|
|%|AOP|MOD|
|**Operatori Logici**|
|&&|LOP|AND|
|\| \||LOP|OR|

## Note
GLI SPAZI E I COMMENTI SONO STATI IGNORATI CON LE SEGUENTI ISTRUZIONI:

{Comment} { /* ignore */ }

{Whitespace} { /* ignore */ }

LE STRINGHE NON SONO STATE GESTITE.
