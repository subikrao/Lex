%{
    #include<stdio.h>
    int count=0;
%}
digit [0-9]
letter [a-zA-Z_]
%%
{letter}({letter}|{digit})* count++;
%%

int main()
{
    yylex();
    printf("Number of identifiers= %d", count);
    return 0;
}