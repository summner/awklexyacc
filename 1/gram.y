%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
#define ERR_FLAG -13
%}
%%
S : T { if ($1 == 1) { puts("OK"); } else { puts("Error."); } }
T : L { $$ = $1; }
T : T L { if ($1 == $2 + 1) $$ = $2; else $$ = ERR_FLAG; }
L : G '\n' { $$ = $1; }
G : '*' { $$ = 1; }
G : G '*' { $$ = $1 + 1; }

%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line %d\n", fmt, yylineno);
}
int main() { return yyparse(); }
