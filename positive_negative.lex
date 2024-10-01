%{
    #include<stdio.h>
    int pos=0, neg=0;
%}
%%
^[-][0-9]+ {neg++; printf("Negative number");}
[0-9]+ {pos++; printf("Positive number");}
%%
void main(){
    yylex();
    printf("Count of positive numbers: %d", pos);
    printf("Count of negative numbers: %d", neg);
}