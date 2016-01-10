%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
%}
%%
S : A B C { if ($1 == $2 && $2 == $3 ) { puts("Ok."); } else { puts("Error."); }  }
A : A 'a' { $$ = $1 + 1; }
	| { $$ = 0; } ;
B : B 'b' { $$ = $1 + 1; }
	| { $$ = 0; } ;
C : C 'c' { $$ = $1 + 1; }
	| { $$ = 0; } ;
%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line %d\n", fmt, yylineno);
}
int main() { return yyparse(); }
