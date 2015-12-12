%{
	#include <stdio.h>	
	long liczba;
%}
%%
^\ *[0-9]*[05]\ *$		{ printf("%s(+)", yytext); }
^\ *[0-9]+\ *$		{ printf("%s(-)", yytext); }
%%
int yywrap() { return 1; }
int main() { return yylex(); }