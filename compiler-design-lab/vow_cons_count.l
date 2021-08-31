/**
* Count number of vowels and consonants in a word
* Works well
*/

%{
    #include <stdio.h>
    int vow_count = 0;
    int cons_count = 0;
%}

%%
[aeiouAEIOU] { vow_count++; }
[a-zA-Z] { cons_count++; }
\n { return 0; }
%%

int yywrap() {}

int main() {
    printf("Enter string: ");
    yylex();
    printf("Number of vowels = %d and consonants = %d\n", vow_count, cons_count);
}