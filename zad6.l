%{
	#include <stdio.h>	
	int liczba;

	#define MAXSIZE 100
	struct stack
	{
	    int stk[MAXSIZE];
	    int top;
	};
	typedef struct stack STACK;
	STACK s;
	 
	void push(int);
	int  pop(void);
	void display(void);
%}
%%
[0-9]+	{ sscanf(yytext, "%d", &liczba); push(liczba);}
\+		{ push(pop()+pop()); }
\-		{ push(pop()-pop()); }			
\*		{ push(pop()*pop()); }			
\/		{ push(pop()/pop()); }			
\n  	{ printf("%d\n", pop()); }
\ 		;
%%
int yywrap() { return 1; }
int main() { return yylex(); }
void push (int num)
{
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