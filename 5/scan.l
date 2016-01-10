%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
#define YYSTYPE int
extern YYSTYPE yyltype; 
extern YYSTYPE yylval;
  #include "y.tab.h"
%}
%%
\,        { return ','; }
\:        { return ':'; }
[0-9]+    { yylval = atoi(yytext);
            return num; }
[ \t\n]   { ; }

%%
int yywrap(void) { return 1; }



