%{
	#include <stdio.h>	
	int pick_col;
	int col = 1;
	char buf[5];

struct stack
{
    int stk[100];
    int top;
};
typedef struct stack STACK;
STACK s;
s.top = -1;
 
void push(void);
int  pop(void);
void display(void);

void push(void);
int  pop(void);
void display(void);
 
%}
%s KOL
%%
<INITIAL>^\ *[0-9]+\ *		{ sscanf(yytext, "%d", &pick_col); BEGIN KOL; }
<KOL>.{5}\ 			{ sscanf(yytext, "%s", buf); if (col == pick_col) printf("%s\n", buf);  col++; }
\n					{ col = 1; }
%%
int yywrap() { return 1; }
int main() { return yylex(); }
void push (int num)
{
    int num;
    if (s.top == (MAXSIZE - 1))
    {
        return;
    }
    else
    {
        s.top = s.top + 1;
        s.stk[s.top] = num;
    }
    return;
}
int pop ()
{
    int num;
    if (s.top == - 1)
    {
        return (s.top);
    }
    else
    {
        num = s.stk[s.top];
        s.top = s.top - 1;
    }
    return(num);
}