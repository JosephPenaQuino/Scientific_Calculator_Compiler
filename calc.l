%{
#include <stdlib.h>
#include "calc.h"
#include "y.tab.h"
void yyerror(char *);
%}

%%
// Variables
[a-z]       { 
                yylval.sIndex = *yytext - 'a';
                return VARIABLE;
            }
// Zero Intenger
0           {
                yylval.iValue = atoi(yytext);
                return INTEGER;
            }
// Integer
[1-9][0-9]* {
                yylval.iValue = atoi(yytext);
                return INTEGER;
            }
// Unit operators and braces
[-()<>=+*/;{}.] {
                return *yytext;
             }

">="            return GE;
"<="            return LE;
"=="            return EQ;
"!="            return NE;
"while"         return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;

[ \t\n]+        ;       /* ignore whitespace */

.               yyerror("Unknown character");
%%
int yywrap(void) {
    return 1;
}
