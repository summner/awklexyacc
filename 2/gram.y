%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
#define ERR_FLAG -13
%}
%%
S : A B C D '\n' { if ($1 == $2 && $3 == $4 && $1 > 0 && $3 > 0) puts("OK.\n"); else puts("Error.\n"); }
A : A 'a' {$$ = $1 + 1; }
	| { $$ = 0; };
B : B 'b' {$$ = $1 + 1; }
	| { $$ = 0; };
C : C 'c' {$$ = $1 + 1; }
	| { $$ = 0; };
D : D 'd' {$$ = $1 + 1; }
	| { $$ = 0; };

%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line %d\n", fmt, yylineno);
}
int main() { return yyparse(); }
