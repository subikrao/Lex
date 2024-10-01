digit [0-9]
identifier [a-zA-Z_][a-zA-Z0-9_]*
keyword ["while"|"for"|"if"|"else"|"switch"|"return"]
datatype ["int"|"float"|"char"|"double"]
relational [">="|"<="|"!="|"=="|"<"|">"]

%{
#include<stdio.h>
int heads=0, keys=0, relops=0, single=0, multi=0, ide=0, pre=0, dtypes=0, digs=0;
%}
%%
{digit} {digs++; fprintf(yyout, "Digit: %s\n", yytext); }
"int"|"float"|"char"|"double" {dtypes++;  fprintf(yyout, "Datatype: %s\n", yytext); }
"<"{identifier}".h>" {heads++; fprintf(yyout, "Header file: %s\n", yytext); }
"#"{identifier} {pre++;  fprintf(yyout, "Preprocessor directive: %s\n", yytext); }
"//"[^\n]* {single++;  fprintf(yyout, "Single line comment: %s\n", yytext); } 
"/*"[^*|*^/]+"*/" {multi++;  fprintf(yyout, "Multi line comment: \n%s\n", yytext); } 
"while"|"for"|"if"|"else"|"switch"|"return" {keys++;  fprintf(yyout, "Keyword: %s\n", yytext); }
{identifier} ide++;
">="|"<="|"!="|"=="|"<"|">" {relops++;  fprintf(yyout, "Relational operator: %s\n", yytext); }
. fprintf(yyout, "\n");
%%
int main(void)
{
	yyin=fopen("input.c","r");
	yyout=fopen("output.txt","w");
	yylex();
	fprintf(yyout, "number of header files = %d\n", heads);
	fprintf(yyout, "number of preprocessor directives = %d\n", pre);
	fprintf(yyout, "Single line comment = %d\n", single);
	fprintf(yyout, "Multiline comment = %d\n", multi);
	fprintf(yyout, "keywords = %d\n", keys);
	fprintf(yyout, "relational operators = %d\n", relops);
	fprintf(yyout, "identifiers = %d\n", ide);
	fprintf(yyout, "datatypes= %d\n", dtypes);
	fprintf(yyout, "digits= %d\n", digs);

	fclose(yyin);
	fclose(yyout);
	return 0;
}
