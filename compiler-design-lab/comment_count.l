/**
* Count number of single line and multi line comments
*/

allchar [a-zA-Z0-9\n\/ ]
single_line \/\/
multi_line \/\*{allchar}*\*\/
ignore {allchar}

%{
    #include <stdio.h>
    int single_count = 0, multi_count = 0;
%}

%%
{single_line} { single_count++; }
{multi_line} { multi_count++; }
{ignore} { ; }
%%

int yywrap() {}

int main() {
    yyin = fopen("input_comment.c", "r+");
    yylex();
    printf("Number of single line comments: %d\n", single_count);
    printf("Number of multi line comments: %d\n", multi_count);
}