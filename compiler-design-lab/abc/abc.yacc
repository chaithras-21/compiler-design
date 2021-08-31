/** 
* Parse strings of pattern a^n b^(n+m) c^m
*/

%start S

%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%%
S   : A C
    ;

A   : 'a' A 'b'
    | 
    ;

C   : 'b' C 'c'
    | 
    ;
%%

int yywrap() {}

int main() {
    printf("Enter string: ");
    yyparse();
    printf("Valid string\n");
}

int yyerror() {
    printf("Invalid string\n");
    exit(0);
}