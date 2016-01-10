%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
%}
%%
S : C Smieci { puts("Error."); }
	| C { puts("Ok."); } 
;
Smieci : '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '\n' 
;
C : '|'  
	| '0' C '0'
	| '1' C '1' 
	| '2' C '2'
	| '3' C '3' 
	| '4' C '4'
	| '5' C '5' 
	| '6' C '6'
	| '7' C '7' 
;
%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line %d\n", fmt, yylineno);
}
int main() { return yyparse(); }
