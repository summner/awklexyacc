%{
	#include <stdio.h>	
	int ileZer = 0;
	int ileJedyn = 0 ;
%}
%s ONES
%s ZEROS
%s END
%%
<INITIAL>^\n	{ printf(" OK\n"); }
<INITIAL>^0	{ ileJedyn=0; ileZer = yyleng; printf("%s", yytext); BEGIN ZEROS; }
<ZEROS>0+		{ ileZer += yyleng; ECHO; }
<ZEROS>1		{ ileJedyn += 1; ECHO; BEGIN ONES; }
<ZEROS>.		{ ECHO; BEGIN END; }
<ONES>1+		{ ileJedyn += yyleng; ECHO; }
<ONES>\n		{ process(1); BEGIN INITIAL; }
<ONES>.			{ printf("%s", yytext); BEGIN END; }
<END>.*$		{ printf("%s", yytext); process(0); BEGIN INITIAL; }

%%
int yywrap() { return 1; }
int main() { return yylex(); }
int process(int res) {if (res && ileZer == ileJedyn) printf(" OK\n"); else printf(" Error");}