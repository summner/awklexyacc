%{
	#include <stdio.h>	
%}
%%
^\ +		;
%%
int yywrap() { return 1; }
int main() { return yylex(); }