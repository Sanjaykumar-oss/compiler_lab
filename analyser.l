%{
#include <stdio.h>
#include <stdlib.h>
%}


%option noyywrap

%%

"#".* {
    printf("%s - PREPROCESSOR\n", yytext);
}

"int"|"char"|"float"|"double"|"void"|"signed"|"unsigned"|"short"|"long"|"if"|"else"|"switch"|"case"|"default"|"for"|"while"|"do"|"break"|"continue"|"return"|"auto"|"extern"|"const"|"static"|"register"|"volatile"|"struct"|"union"|"enum"|"typedef"|"goto"|"sizeof" {
    printf("%s - KEYWORD\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("%s - IDENTIFIER\n", yytext);
}

"+"|"-"|"*"|"/"|"%" {
    printf("%s - ARITHMETIC OPERATOR\n", yytext);
}

">"|"<"|">="|"<="|"=="|"!=" {
    printf("%s - RELATIONAL OPERATOR\n", yytext);
}

"="|"+="|"-="|"*="|"/="|"%=" {
    printf("%s - ASSIGNMENT OPERATOR\n", yytext);
}

"&&"|"||"|"!" {
    printf("%s - LOGICAL OPERATOR\n", yytext);
}

"&"|"|"|"~"|"^"|"<<"|">>" {
    printf("%s - BITWISE OPERATOR\n", yytext);
}

[0-9]+ {
    printf("%s - INTEGER\n", yytext);
}

"//".* {
    printf("%s - SINGLE LINE COMMENT\n", yytext);
}

"/*"(.|\n)*"*/" {
    printf("%s - MULTILINE COMMENT\n", yytext);
}

\".*\" {
    printf("%s - STRING\n", yytext);
}

[.,;:\[\]] {
    printf("%s - PUNCTUATION\n", yytext);
}

[ \t\n]+ {
    /* Ignore whitespace */
}

%%

int main()
{
    FILE *file;

    file = fopen("input.c", "r");

    if (!file)
    {
        printf("File open error!\n");
        exit(0);
    }

    yyin = file;

    yylex();

    fclose(yyin);

    return 0;
}