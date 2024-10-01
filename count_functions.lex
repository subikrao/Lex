digit [0-9]
identifier [a-zA-Z_][a-zA-Z0-9_]*
datatype "int"|"float"|"char"|"double"

%{
    #include<stdio.h>
    int type1=0, type2=0, type3=0;
%}

%%
{datatype}" "{identifier}"\(\)" {type1++; printf("type 1 function (without argument):  %s \n", yytext);}
{datatype}" "{identifier}"\("{datatype}" "{identifier}"\)" {type2++; printf("type 2 function (with one argument):  %s \n", yytext);}
{datatype}" "{identifier}"\("({datatype}" "{identifier}", ")+{datatype}" "{identifier}"\)" {type3++; printf("type 3 function (with n arguments):  %s \n", yytext);}
.+ printf(" nah not valid \n");
%%

int main(){
    yylex();
    printf("\n Number of functions without argument: %d", type1);
    printf("\n Number of functions with one argument: %d", type2);
    printf("\n Number of functions with multiple arguments: %d \n", type3);
    return 0;
    /*
    Ex4. Write a Lex program to identify :
    Functions without argument.
    Functions with one argument.
    Functions with n arguments.
    Ex5: Count the number of each type of functions you have identified in EX4.
    */
}