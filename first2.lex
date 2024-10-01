word [a-zA-Z]
%%
({word}*\n)* ECHO;
. ECHO;
%%
int yywrap(void)
{
return 1;
}
int main(void)
{
yylex();
return 0;
}
