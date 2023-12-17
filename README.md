# Calculator

This is a simple calculator implemented in C using Lex and Yacc (Flex and Bison). It can handle assignments, arithmetic expressions, printing values, and exiting the program.

## Getting Started

### Prerequisites

Make sure you have the following installed on your system:

- Flex (Lexical Analyzer Generator)
- Bison (Parser Generator)
- GCC (GNU Compiler Collection)

### Installation

 
 ```bash
# Clone the repository:
git clone https://github.com/Narennnnn/Calculator.git
cd calculator
```

```bash
# Generate the lexer and parser
yacc -d calculator.y
lex calculator.l
```


```bash
# Compile the code
gcc lex.yy.c y.tab.c -o calculator

```


```bash
# Run the compiled program
./calculator
```

```bash
a=100+1;
b=a-100;
print b;
exit;

```