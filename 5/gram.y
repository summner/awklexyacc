%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  #include <stdio.h>
  extern int yylineno;
%}
%token num
%%
S : { printf("["); } P { printf("]"); }
  ;
P : num ':' num { if($1 == 0)printf("%d",$3); $$=$1-1; }
  | P ',' num   { if($1==0)printf("%d",$3); $$=$1-1; }

%%
void yyerror(const char *fmt,...) {  printf("%s in line %d\n", fmt, yylineno); }
int main() { return yyparse(); }

