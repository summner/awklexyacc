%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
%}
%%

%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line %d\n", fmt, yylineno);
}
int main() { return yyparse(); }
