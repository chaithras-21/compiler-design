/**
* Identify identifiers, keywords and operators in file
*/

char [a-zA-Z]
digit [0-9]
space [ ]
newline \n
keyword auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
id {char}({char}|{digit})*
one_char_op \+|-|\*|\/|<|>|=
multi_char_op <=|>=|==
ignore {space}|{newline}

%{
    #include <stdio.h>
%}

%%
{keyword} { printf("Keyword - %s\n", yytext); }
{id} { printf("Identifier - %s\n", yytext); }
{one_char_op}|{multi_char_op} { printf("Operators - %s\n", yytext); }
{ignore} { ; }
%%

int yywrap() {}

int main() {
    yyin = fopen("input_id_keyword.c", "r+");
    yylex();
}