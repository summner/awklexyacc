%{
	#include <stdio.h>	
	int liczba;
%}
%%
^\ *[0-9]+\ *		{ 
	sscanf(yytext, "%d", &liczba);
	if (liczba%5 == 0) printf("%s(+)", yytext); else printf("%s(-)", yytext);
	}
%%
int yywrap() { return 1; }
int main() { return yylex(); }