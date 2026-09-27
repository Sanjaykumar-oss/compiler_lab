%{
#include "calculator.tab.h"
#include <stdlib.h>
%}

%option noyywrap

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       ;
\n          return '\n';

"+"         return '+';
"-"         return '-';
"*"         return '*';
"/"         return '/';
"("         return '(';
")"         return ')';

.           ;

%%