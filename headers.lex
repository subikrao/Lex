digit [0-9]
letter [A-Za-z]
%{
#include<stdio.h>
int count=0;
%}
%%
#include<[^>]+\.h> count++;
%%
int main(void)
{
	yyin=fopen("input.txt","r");
	yyout=fopen("output.txt","w");
	yylex();
	fprintf(yyout, "number of header files = %d\n", count);
	fclose(yyin);
	fclose(yyout);
	return 0;
}
