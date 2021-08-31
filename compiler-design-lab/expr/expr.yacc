%token NUM ID OP

%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%%
S   : S OP S
    | ID
    | NUM
    ;
%%

int yywrap() {}

int main() {
    printf("Enter expression: ");
    yyparse();
    printf("Valid expression\n");
}

int yyerror() {
    printf("Invalid expression\n");
    exit(0);
}