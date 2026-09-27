%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%left UMINUS

%%

input:
    expr '\n' { printf("Result: %d\n", $1); }
    ;

expr:
      expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '(' expr ')'  { $$ = $2; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | NUMBER { $$ = $1; }
    ;

%%

int main()
{
    printf("Enter the expression: ");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid operation!\n");
    return 0;
}