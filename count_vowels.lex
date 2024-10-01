%{
    #include<stdio.h>
    int vcount =0, ccount=0;
%}
vowel [a|e|i|o|u|A|E|I|O|U]
%%
{vowel} {vcount++;}
. {ccount++;}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("\n Count of vowels= %d", vcount);
    printf("\n Count of consonants= %d \n", ccount);
    return 0;
}
