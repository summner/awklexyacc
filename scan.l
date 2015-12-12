%{
	#include <stdio.h>	
	long liczba;
%}
%%
^\ *[0-9]+\ *$		{ 
	sscanf(yytext, "%ld", &liczba);
	if (liczba%5 == 0) printf("%s(+)", yytext); else printf("%s(-)", yytext);
	}
%%
int yywrap() { return 1; }
int main() { return yylex(); }