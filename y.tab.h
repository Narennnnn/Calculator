#ifndef _yy_defines_h_
#define _yy_defines_h_

#define print 257
#define exit_command 258
#define number 259
#define identifier 260
#define SIN 261
#define COS 262
#define TAN 263
#define SQRT 264
#define LOG 265
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE { double num; char id; } YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
