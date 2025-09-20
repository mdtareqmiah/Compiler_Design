%{
#include<stdio.h>
int ct=0;
%}

%%
"int"|"float"|"double"|"char"|" {printf("KEYWORD : %s\n", yytext); ct++;}
.    { }
%%

int main(){
    yylex();
    printf("Total token: %d\n",ct);
    return 0;
}

int yywrap(){
    return 1;
}

//keyword, identifier, constant, operator, separetor