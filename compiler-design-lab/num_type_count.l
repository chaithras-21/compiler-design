/**
* Count number of positive, negative and zero integers and fractions
* Corner cases handled
*/

number [0-9]
newline [\n]
dot \.
ispos \+?
neg -
div \/
morezero 0+
isposneg [+-]?
end end

%{
    #include <stdio.h>
    int posint = 0, negint = 0, zero = 0, posfrac = 0, negfrac = 0;
%}

%%
({newline}?{isposneg}{morezero}{dot}{morezero}{newline})|({newline}?{isposneg}{morezero}{newline}) { zero++; }
({ispos}{number}*{dot}{number}+)|({ispos}{number}*{dot}?{number}+{div}{ispos}{number}*{dot}?{number}+)|({neg}{number}*{dot}?{number}+{div}{neg}{number}*{dot}?{number}+) { posfrac++; }
({neg}{number}*{dot}{number}+)|({neg}{number}*{dot}?{number}+{div}{ispos}{number}*{dot}?{number}+)|({ispos}{number}*{dot}?{number}+{div}{neg}{number}*{dot}?{number}+) { negfrac++; }
({ispos}0*[1-9]{number}*) { posint++; }
({neg}0*[1-9]{number}*) { negint++; }
{newline} { ; }
{end} { return 0; }
%%

int yywrap() {}

int main() {
    yylex();
    printf("Positive integer count: %d\n", posint);
    printf("Negative integer count: %d\n", negint);
    printf("Positive fraction count: %d\n", posfrac);
    printf("Negative fraction count: %d\n", negfrac);
    printf("Zero count: %d\n", zero);
}