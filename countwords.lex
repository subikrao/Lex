%{
	int nword;
%}
%%
[^ \t\n]+ { nword++; }
%%
int main(void){
	yyin=fopen("input.txt","r");
	yyout=fopen("output.txt","w");
	yylex();
	fprintf(yyout,"Number of words: %d\n\n",nword);
	fclose(yyin);
	fclose(yyout);
	return 0;
}
