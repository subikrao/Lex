%{
	int nchar, nword, nline;
%}
%%
\n	{ nline++; nchar++; }
[^ \t\n]+ { nword++, nchar += yyleng; }
.	{ nchar++; }
%%
int main(void){
	yylex();
	printf("Number of characters: %d\t Number of words: %d\t Number of lines: %d\n", nchar, nword, nline);
	return 0;
}
