    /* lex code to determine whether input is floating point number or not */
digit [0-9]
letter [A-Za-z]
%{
#include<stdio.h>
%}

%%
{digit}+ printf("\ninteger number");
{digit}+"."{digit}+ printf("\nfloating point");
.+ {printf("\ninvalid number");}
%%

int main(void)
{
    printf("\nEnter  number: ");
    yylex();
    printf("\n");
    return 0;
}
