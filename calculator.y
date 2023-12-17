%{
#include <math.h>
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}
%union { double num; char id; }
%start line
%token print
%token exit_command
%token <num> number
%token <id> identifier
%type <num> line exp term 
%type <id> assignment
%type <num> func
%%
line    : assignment ';'       {;}
        | exit_command ';'     { exit(EXIT_SUCCESS); }
        | print exp ';'        { printf("Printing %f\n", $2); }
        | line assignment ';'  {;}
        | line print exp ';'   { printf("Printing %f\n", $3); }
        | line exit_command ';' { exit(EXIT_SUCCESS); }
        ;

assignment : identifier '=' exp  { updateSymbolVal($1, $3); }
            ;

exp     : term                  { $$ = $1; }
        | exp '+' term          { $$ = $1 + $3; }
        | exp '-' term          { $$ = $1 - $3; }
        | exp '*' term          { $$ = $1 * $3; }
        | exp '/' term          { $$ = $1 / $3; }
        | exp '^' term          { $$ = pow($1, $3); } // Exponentiation
        | '(' exp ')'           { $$ = $2; } // Handle parentheses
        | func                 { $$ = $1; } // Handle functions
        ;

func    : SIN '(' exp ')'       { $$ = sin($3); }
        | COS '(' exp ')'       { $$ = cos($3); }
        | TAN '(' exp ')'       { $$ = tan($3); }
        | SQRT '(' exp ')'      { $$ = sqrt($3); }
        | LOG '(' exp ')'       { $$ = log($3); }
        ;

term    : number                { $$ = $1; }
        | identifier            { $$ = symbolVal($1); }
        ;

%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
