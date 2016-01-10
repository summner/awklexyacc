%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
#define ERR_FLAG -13
%}
%%
S : A B { if ($1 == $2) { puts("Ok"); } else { puts("Error.");  } }
A : A 'a' { $$ = $1 + 1; }
	| 'a' { $$ = 1; } ;

B : B 'b' { $$ = $1 + 1; }
	| 'b' { $$ = 1; } ;


%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line %d\n", fmt, yylineno);
}
int main() { return yyparse(); }
