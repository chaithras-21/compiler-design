typedef struct Stack {
    char ele[50];
    int top;
} Stack;

Stack* __new();
void __del(Stack*);
int push(Stack*, char);
int pop(Stack*);
char peek(Stack*);
int size(Stack*);
void printstack(Stack*);

Stack* __new() {
    Stack* this = malloc(sizeof(Stack));
    memset(this->ele, 0, 50);
    this->top = -1;
    push(this, '$');
    return this;
}

void __del(Stack* this) {
    free(this);
}

int push(Stack* this, char e) {
    // Check if stack is full
    if(size(this) == 50) {
        return -1;
    }

    this->top++;
    *(this->ele + this->top) = e;
    return 0;    
}

int pop(Stack* this) {
    // Check if stack is empty
    if(size(this) == 0) {
        return -1;
    }

    *(this->ele + this->top) = 0;
    this->top--;
    return 0;
}

char peek(Stack* this) {
    // Check if stack is empty
    if(size(this) == 0) {
        return 0;
    }

    return *(this->ele + this->top);
}

int size(Stack* this) {
    return (this->top + 1);
}

void printstack(Stack* this) {
    int stacksize = size(this);
    for(int i = 0; i < stacksize; i++) {
        printf("%c", *(this->ele + stacksize - i - 1));
    }
}