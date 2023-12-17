%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
%%
"print"				   {return print;}
"exit"				   {return exit_command;}
"SIN"				   {return SIN;}
"COS"				   {return COS;}
"TAN"				   {return TAN;}
"SQRT"				   {return SQRT;}
"LOG"				   {return LOG;}
[a-zA-Z]			   {yylval.id = yytext[0]; return identifier;}
[0-9]+                 {yylval.num = atof(yytext); return number;}  /* Use atof for floating-point numbers */
[ \t\n]                ;
[-+=;()*/]           	   {return yytext[0];}
.                      {ECHO; yyerror ("unexpected character");}
%%
int yywrap (void) {return 1;}
