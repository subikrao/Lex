%{
	int nchar, nword, nline;
%}
%%
\n	{ nline++; }
[^ \t\n]+ { nword++, nchar += yyleng; }
.	{ nchar++; }
%%
int main(void){
	yyin=fopen("input.txt","r");
	yyout=fopen("output.txt","w");
	yylex();
	fprintf(yyout, "Number of characters: %d\t Number of words: %d\t Number of lines: %d\n", nchar, nword, nline);
	fclose(yyin);
	fclose(yyout);
	return 0;
}
