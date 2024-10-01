%{
#include<stdio.h>
int c=0; m=0;
%}
%%
"//"[^\n]* {c++; printf("Single file comment\n");}
"/*"[^*|*^/]+"*/" {m++; printf("Multiline comment\n");}
.+ {printf("Invalid comment");}
%%

int main()
{
yylex();
printf("c=%d m=%d", c,m);
return 0;
}
