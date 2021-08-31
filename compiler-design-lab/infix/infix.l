number [0-9]+

%{
    #include <stdlib.h>
    #include "y.tab.h"
    extern int yylval;
%}

%%
{number} { yylval = atoi(yytext); return NUM; }
\+ { return '+'; }
- { return '-'; }
\* { return '*'; }
\/ { return '/'; }
\( { return '('; }
\) { return ')'; }
. { return yytext[0]; }
\n { return 0; }
%%