/**
 * Construct a shift reduce parser for the grammar:
 * E -> E+E | E-E | a | b
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stack.h"

#define MAXSIZE 50

void printgrammar();
void printrow(Stack*, char*, const char*);
int printtable(Stack*, char*);
void checkprods(Stack*, char*, int*);

int main() {
    printgrammar();
    
    char input[50] = { 0 };
    printf("Enter input string: ");
    scanf("%s", input);
    if(strlen(input) == 0) {
        printf("REJECT\n");
        return 0;
    }
    strcat(input, "$");

    Stack* stack = __new();

    if(printtable(stack, input)) {
        printf("ACCEPT\n");
    }
    else {
        printf("REJECT\n");
    }

    __del(stack);
    return 0;
}

void printgrammar() {
    printf("The grammar is: \n");
    printf("E -> E + E\n");
    printf("E -> E - E\n");
    printf("E -> a\n");
    printf("E -> b\n");
    printf("\n");
}

void printrow(Stack* s, char* str, const char* action) {
    printstack(s);
    printf("\t\t%s\t\t%s\n", str, action);
}

int printtable(Stack* s, char* input) {
    printf("\nPARSING TABLE:\n");

    int ipstart = 0;
    do {
        checkprods(s, input, &ipstart);
    } while(strcmp((input+ipstart), ""));

    if(strstr(s->ele, "$E$") != NULL) {
        return 1;
    }
    else {
        return 0;
    }
}

void checkprods(Stack* s, char* str, int* strstart) {
    int prodchange;
    do {
        prodchange = 0;
        if(peek(s) == 'a') {
            printrow(s, str+(*strstart), "REDUCE E -> a");
            pop(s);
            push(s, 'E');
            prodchange++;
            continue;
        }
        if(peek(s) == 'b') {
            printrow(s, str+(*strstart), "REDUCE E -> b");
            pop(s);
            push(s, 'E');
            prodchange++;
            continue;
        }
        if(strstr(s->ele, "E+E") != NULL) {
            printrow(s, str+(*strstart), "REDUCE E -> E + E");
            pop(s);
            pop(s);
            pop(s);
            push(s, 'E');
            prodchange++;
            continue;
        }
        if(strstr(s->ele, "E-E") != NULL) {
            printrow(s, str+(*strstart), "REDUCE E -> E - E");
            pop(s);
            pop(s);
            pop(s);
            push(s, 'E');
            prodchange++;
            continue;
        }
    } while(prodchange != 0);

    printrow(s, str+(*strstart), "SHIFT");
    push(s, *(str + (*strstart)));
    (*strstart)++;
}