number [0-9]+
identifier [a-zA-Z][a-zA-Z0-9]*
operator \+|-|\*|\/
newline \n

%{
    #include <stdlib.h>
    #include "y.tab.h"
    extern int yylval;
%}

%%
{number} { yylval = atoi(yytext); return NUM; }
{identifier} { return ID; }
{operator} { return OP; }
{newline} { return 0; }
%%