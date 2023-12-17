# Calculator

This is a simple calculator implemented in C using Lex and Yacc (Flex and Bison). It can handle assignments, arithmetic expressions, printing values, and exiting the program.

## Features

1. **Arithmetic Operations:**
   - Addition (`+`), Subtraction (`-`), Multiplication (`*`), Division (`/`), and Exponentiation (`^`) are supported.

2. **Mathematical Functions:**
   - The calculator includes the following mathematical functions:
     - `EXP(x)`: Exponential function.
     - `SIN(x)`: Sine function.
     - `COS(x)`: Cosine function.
     - `TAN(x)`: Tangent function.
     - `ABS(x)`: Absolute value function.
     - `LOG(x)`: Natural logarithm function.

3. **Variable Assignments:**
   - Assign values to variables using the assignment operator (`=`). For example: `a = 10;`

4. **Printing Values:**
   - Use the `print` command to display the value of a variable or an expression. For example: `print a + b;`

5. **Exit Command:**
   - Terminate the program using the `exit` command.

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
# link math library
gcc lex.yy.c y.tab.c -o calculator -lm


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