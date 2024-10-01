digit [0-9]
letter [A-Za-z]
%{
	int count;
%}
%%
    /* match identifier */
^{letter}({letter}|{digit})* count++;
.+ printf("invalid  \n");
%%
int main(void)
{
	yyin=fopen("input.txt","r");
	yyout=fopen("output.txt","w");
	yylex();
	fprintf(yyout, "number of identifiers = %d\n", count);
	fclose(yyin);
	fclose(yyout);
	return 0;
}
