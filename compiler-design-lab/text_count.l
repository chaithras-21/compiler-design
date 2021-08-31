/**
* Count number of words, characters and spaces in paragraph.
* Terminate paragraph with 5t0p on newline.
* Works well 
*/

space [ ]
char [0-9a-zA-Z]
newline [\n]
stop 5t0p

%{
    #include <stdio.h>
    int char_count = 0, space_count = 0, word_count = 0, line_count = 0;
%}

%%
{stop} { return 0; }
{space} { char_count++; space_count++; word_count++; }
{char} { char_count++; }
{newline} { word_count++; line_count++; }
. { char_count++; }
%%

int yywrap() {}

int main() {
    printf("Enter text: ");
    yylex();
    printf("Character count = %d\n", char_count);
    printf("Word count = %d\n", word_count);
    printf("Space count = %d\n", space_count);
    printf("Line count = %d\n", line_count);
}