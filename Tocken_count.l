%{
    #include<stdio.h>
    int keyw=0, ident=0, oprtot=0, sepra=0, spchr=0,cons=0;

%}

%%

"//".*  ;
"/*"([^*]|\*+[^*/])*"*/"    ;

("int"|"float"|"char"|"if"|"else"|"while"|"for"|"return"|"void"|"printf") { 
    printf("keyword: %s\n", yytext); keyw++; 
}

[a-zA-Z_][a-zA-Z0-9_]* { 
    printf("identifier: %s\n", yytext); ident++; 
}

[0-9]+(\.[0-9]+)? { 
    printf("Constant: %s\n", yytext); cons++; 
}

[ \t\n]+    ;
.           ;

%%

int main(){
    yyin = fopen("lexer_in.c","r");
    if(!yyin){
        printf("File Not Found!\n");
        return 1;
    }
    yylex();
    printf("\n=== Token count Summary ===\n");
    printf("keyword:    = %d\n",keyw);
    printf("identifier: = %d\n",ident);
    printf("Constant:   = %d\n",cons);
    return 0;
}

int yywrap(){
    return 1;
}