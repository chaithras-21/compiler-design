/**
* Evaluate an infix expression
*/

%token NUM
%start S
%left '+' '-'
%left '*' '/'

%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%%
S   : E { printf("Result: %d\n", $$); return 0; }
    ;

E   : E '+' E { $$ = $1 + $3; }
    | E '-' E { $$ = $1 - $3; }
    | E '*' E { $$ = $1 * $3; }
    | E '/' E { $$ = $1 / $3; }
    | '(' E ')' { $$ = $2; }
    | NUM { $$ = $1; }
    ;
%%

int yywrap() {}

int main() {
    printf("Enter infix expression: ");
    yyparse();
}

int yyerror() {
    printf("Invalid expression\n");
    exit(0);
}