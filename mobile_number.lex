    /* lex code to check valid mobile_number */
%{
	/* Definition section */
%}
    /* rule section */
%%
[1-9][0-9]{9} {printf("\nMobile Number Valid\n");}
.+ {printf("\nMobile Number Invalid\n");}
%%
int yywrap(){
    return 1;
}
int main(void)
{
    printf("\nEnter mobile number: ");
    yylex();
    printf("\n");
    return 0;
}
