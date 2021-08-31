/**
* Count number of printfs and scanfs in file, replace it with writef and readf
*/

printf printf
scanf scanf
other .
newline \n

%{
    #include <stdio.h>
    int printf_count = 0, scanf_count = 0;
%}

%%
{printf} { printf_count++; fprintf(yyout, "readf"); }
{scanf} { scanf_count++; fprintf(yyout, "writef"); }
{other} { fprintf(yyout, "%s", yytext); }
{newline} { fprintf(yyout, "\n"); }
%%

int yywrap() {}

int main() {
    yyin = fopen("input_printf_scanf.c", "r+");
    yyout = fopen("output_writef_readf.c", "w+");
    yylex();
    printf("Number of printfs are %d and scanfs are %d\n", printf_count, scanf_count);
}