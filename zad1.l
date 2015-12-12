%{
	#include <stdio.h>	
	int pick_col;
	int col = 1;
	char buf[5];
%}
%s KOL
%%
<INITIAL>^\ *[0-9]+\ *		{ sscanf(yytext, "%d", &pick_col); BEGIN KOL; }
<KOL>.{5}\ 			{ sscanf(yytext, "%s", buf); if (col == pick_col) printf("%s\n", buf);  col++; }
\n					{ col = 1; }
%%
int yywrap() { return 1; }
int main() { return yylex(); }