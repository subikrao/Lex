%{
    #include<stdio.h>
    int flag =0;
%}

vowel [aeiouAEIOU]

%%
{vowel}.[a-zA-Z0-9.]+ {flag=1; printf("accepted");}
[a-zA-Z0-9]+ printf("not accepted");
%%

void main(){
    yylex();
}