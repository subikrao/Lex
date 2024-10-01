%{
    #include<stdio.h>
    #include<stdlib.h>
    int flag,c,j;
%}
%%
[0-9]+ {
    c=atoi(yytext);
    if(c==2){
        printf("\nPrime number.");
    }
    else if(c==0 || c==1){
        printf("\nPrime number.");
    }
    else{
        for(j=2; j<c; j++){
            if(c%j==0){
                flag=1;
            }
        }
        if(flag==1){
            printf("\nNot prime.");
        }
        else{
            printf("\nPrime number.");
        }
    }
}
%%
void main(){
    yylex();
}