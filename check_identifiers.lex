    /* lex code to determine whether input is identifier or not */
%{
	#include<stdio.h>
%}
    //rule section
%%
^[a-zA-Z_][a-zA-Z0-9_]* printf("Valid identifier");
^[^a-zA-Z_] printf("Invalid Identifier");
. ;
%%
int yywrap(){
    return 1;
}
void main(void)
{
    yylex();
}
