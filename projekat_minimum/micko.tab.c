/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "micko.y" /* yacc.c:339  */

	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "defs.h"
	#include "symtab.h"
	#include "codegen.h"

	int yyparse(void);
	int yylex(void);
	int yyerror(char *s);
	void warning(char *s);
	extern int yylineno;

	int out_lin = 0;
	int lab_num = -1;
	FILE *output;
	
	char char_buffer[CHAR_BUFFER_LENGTH];
	int error_count = 0;
	int warning_count = 0;
	int var_num = 0;
	int fun_idx = -1;
	int fcall_idx = -1;

	int temp_var = NO_TYPE;
	int param_count = 0;
	int arg_count = 0;

	int cur_fun_ret_t;     //Povratni tip funkcije
	int cur_fun_returned;  //Proverava da li je funkcija vratila vrednost
	
	int lit_last_in_mem;   //Vraca najmanji indeks literala koji se nalazio u listi simbola
	int check_num = -1;
	int when_num = 0;
	int check_count = 0;
	int compared_idx = 0;
	int currently_in_check = 0;
	
	int lab_para_num = -1;
	int lab_check_num = -1;
	
	int lab_usl_num = -1;
	
	int pushed_reg = 0;
	int saved_type = 0;
	
	int num_exp_called_for_var = 0;
	
	int was_a_fun = 0;
	
	int first_decled = 0;
	int var_num_saver = 0;
	int begin_id = 0;
	int end_id = 0;
	
	int already_subbed = 0;

#line 125 "micko.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "micko.tab.h".  */
#ifndef YY_YY_MICKO_TAB_H_INCLUDED
# define YY_YY_MICKO_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    _TYPE = 258,
    _IF = 259,
    _ELSE = 260,
    _RETURN = 261,
    _ID = 262,
    _INT_NUMBER = 263,
    _UINT_NUMBER = 264,
    _LPAREN = 265,
    _RPAREN = 266,
    _LBRACKET = 267,
    _RBRACKET = 268,
    _ASSIGN = 269,
    _SEMICOLON = 270,
    _AROP = 271,
    _RELOP = 272,
    _SELECT = 273,
    _FROM = 274,
    _WHERE = 275,
    _COMMA = 276,
    _INC_OP = 277,
    _PARA = 278,
    _PASO = 279,
    _COLON = 280,
    _CHECK = 281,
    _WHEN = 282,
    _FINISH = 283,
    _LSBRAC = 284,
    _RSBRAC = 285,
    _ARROW = 286,
    _OTHERWISE = 287,
    _QMARK = 288,
    ONLY_IF = 289
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 60 "micko.y" /* yacc.c:355  */

	int i;
	char *s;

#line 205 "micko.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_MICKO_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 222 "micko.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   156

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  35
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  55
/* YYNRULES -- Number of rules.  */
#define YYNRULES  88
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  167

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   289

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   107,   107,   114,   116,   120,   133,   145,   159,   160,
     165,   185,   185,   164,   198,   200,   205,   212,   226,   231,
     240,   225,   249,   251,   256,   255,   277,   291,   311,   323,
     348,   350,   354,   355,   356,   357,   358,   359,   360,   361,
     362,   367,   386,   366,   401,   407,   406,   418,   419,   424,
     427,   435,   434,   457,   465,   466,   465,   524,   551,   555,
     575,   581,   580,   632,   636,   645,   649,   651,   679,   706,
     707,   712,   723,   711,   739,   740,   744,   757,   773,   775,
     781,   785,   780,   797,   808,   817,   826,   830,   831
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "_TYPE", "_IF", "_ELSE", "_RETURN",
  "_ID", "_INT_NUMBER", "_UINT_NUMBER", "_LPAREN", "_RPAREN", "_LBRACKET",
  "_RBRACKET", "_ASSIGN", "_SEMICOLON", "_AROP", "_RELOP", "_SELECT",
  "_FROM", "_WHERE", "_COMMA", "_INC_OP", "_PARA", "_PASO", "_COLON",
  "_CHECK", "_WHEN", "_FINISH", "_LSBRAC", "_RSBRAC", "_ARROW",
  "_OTHERWISE", "_QMARK", "ONLY_IF", "$accept", "program", "glob_vars",
  "g_variable", "g_var_poss", "function_list", "function", "$@1", "$@2",
  "$@3", "parameter", "func_with_par", "body", "$@4", "$@5", "$@6",
  "variable_list", "variable", "$@7", "var_poss", "statement_list",
  "statement", "check_exp", "$@8", "$@9", "otherwise", "$@10", "whenPart",
  "finish_par", "when", "$@11", "void_func", "para_statement", "@12",
  "$@13", "inc_statement", "compound_statement", "assignment_statement",
  "num_exp", "$@14", "exp", "literal", "function_call", "$@15", "$@16",
  "argument", "has_args", "if_statement", "if_part", "@17", "$@18",
  "rel_exp", "return_statement", "select_statement", "arg_select", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289
};
# endif

#define YYPACT_NINF -119

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-119)))

#define YYTABLE_NINF -84

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
    -119,    12,    20,  -119,     8,  -119,    44,  -119,    15,     5,
      41,  -119,    40,  -119,    51,  -119,  -119,  -119,    56,    53,
    -119,    43,  -119,    50,    62,    54,    60,  -119,  -119,  -119,
    -119,    67,  -119,  -119,  -119,    66,    45,    63,    21,    64,
      22,    -4,  -119,    69,    68,    52,    72,  -119,  -119,  -119,
    -119,  -119,  -119,  -119,    71,  -119,    77,  -119,  -119,    46,
    -119,    80,  -119,    -6,  -119,  -119,    46,  -119,    75,  -119,
    -119,  -119,    46,    76,    82,     1,  -119,   -10,  -119,    86,
    -119,  -119,    45,    78,    81,    46,  -119,    85,    83,  -119,
      87,    84,  -119,  -119,  -119,    90,    91,    94,  -119,  -119,
      46,    88,  -119,  -119,    46,    46,  -119,    46,    89,  -119,
      92,    74,    78,    46,    96,    97,  -119,    78,    99,    93,
     101,    32,   100,   102,    45,    95,  -119,    46,    46,    98,
    -119,  -119,    46,    78,   104,    32,   103,   106,   105,   107,
      32,     6,   108,    46,  -119,   109,  -119,  -119,   113,   108,
     112,  -119,  -119,    32,   110,   111,  -119,  -119,  -119,   123,
      45,    45,  -119,  -119,  -119,    45,  -119
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     0,     0,     1,     0,     4,     2,     8,     6,     0,
       0,     9,     0,     5,     0,    10,    11,     7,    14,     0,
      12,    15,    16,     0,     0,     0,     0,    18,    13,    17,
      22,    19,    24,    30,    23,     0,    20,    26,     0,     0,
       0,    71,    30,     0,     0,     0,     0,    31,    40,    39,
      38,    37,    32,    33,     0,    34,    78,    35,    36,     0,
      25,     0,    80,    64,    69,    70,     0,    85,    61,    60,
      63,    65,     0,     0,     0,     0,    87,     0,    54,     0,
      21,    53,     0,    27,    28,     0,    67,    61,    60,    84,
       0,    61,    57,    72,    58,     0,     0,     0,    41,    79,
       0,    61,    81,    66,     0,     0,    59,    74,     0,    88,
       0,     0,    29,     0,     0,     0,    62,    76,     0,    75,
       0,     0,     0,    61,     0,     0,    73,     0,     0,     0,
      42,    82,     0,    77,     0,     0,     0,     0,     0,     0,
       0,    44,    49,     0,    86,     0,    51,    45,     0,    49,
       0,    47,    68,     0,     0,     0,    43,    48,    50,     0,
       0,     0,    55,    52,    46,     0,    56
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
    -119,  -119,  -119,  -119,  -119,  -119,   115,  -119,  -119,  -119,
    -119,  -119,  -119,  -119,  -119,  -119,  -119,  -119,  -119,  -119,
     114,   -81,  -119,  -119,  -119,  -119,  -119,  -119,   -47,   -25,
    -119,  -119,  -119,  -119,  -119,  -119,  -119,  -119,   -38,  -119,
     -60,  -118,   -36,  -119,  -119,  -119,  -119,  -119,  -119,  -119,
    -119,   -11,  -119,  -119,  -119
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,     5,     9,     6,     7,    12,    18,    23,
      20,    21,    28,    30,    33,    46,    31,    34,    35,    38,
      36,    47,    48,   111,   136,   148,   155,   141,   151,   142,
     154,    49,    50,    97,   165,    51,    52,    53,   101,    90,
      69,    70,    71,    74,   107,   118,   119,    55,    56,    85,
     114,   102,    57,    58,    77
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      54,    99,    68,   129,   -71,    39,    88,    40,    41,    95,
      72,    96,     3,    42,    94,     8,    86,   139,    73,    43,
      13,    83,   146,     4,    44,   -10,    14,    45,    87,    63,
      64,    65,    66,   140,    91,   159,    60,    67,   147,    54,
      64,    65,    61,   131,   115,   116,    54,    10,    15,    39,
      16,    40,    41,    63,    64,    65,    66,    42,    17,    19,
      22,    25,   112,    43,    24,    26,    27,    29,    44,   117,
      32,    45,   137,    37,    62,   123,    76,    59,    78,   163,
     164,    79,    82,   152,   166,    80,    81,    84,    54,   133,
      89,    92,    93,    98,   -61,   100,   103,   108,   109,   106,
     104,   110,   157,   105,   122,   113,   121,   124,   125,   120,
     126,   128,   130,   -83,   127,   138,   149,   134,     0,     0,
     144,    11,     0,   135,    54,    54,   156,   158,   132,    54,
     140,   143,   145,   153,   162,     0,   150,     0,     0,     0,
       0,   160,   161,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75
};

static const yytype_int16 yycheck[] =
{
      36,    82,    40,   121,    10,     4,    66,     6,     7,    19,
      14,    21,     0,    12,    13,     7,    22,   135,    22,    18,
      15,    59,   140,     3,    23,    10,    21,    26,    66,     7,
       8,     9,    10,    27,    72,   153,    15,    15,    32,    75,
       8,     9,    21,   124,   104,   105,    82,     3,     7,     4,
      10,     6,     7,     7,     8,     9,    10,    12,     7,     3,
       7,    11,   100,    18,    21,     3,    12,     7,    23,   107,
       3,    26,   132,     7,    10,   113,     7,    14,    10,   160,
     161,    29,     5,   143,   165,    13,    15,     7,   124,   127,
      15,    15,    10,     7,    16,    14,    11,     7,     7,    15,
      17,     7,   149,    16,    30,    17,    14,    11,    11,    20,
      11,    10,    12,    11,    21,    11,   141,   128,    -1,    -1,
      15,     6,    -1,    25,   160,   161,    13,    15,    33,   165,
      27,    25,    25,    24,    11,    -1,    28,    -1,    -1,    -1,
      -1,    31,    31,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    42
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    36,    37,     0,     3,    38,    40,    41,     7,    39,
       3,    41,    42,    15,    21,     7,    10,     7,    43,     3,
      45,    46,     7,    44,    21,    11,     3,    12,    47,     7,
      48,    51,     3,    49,    52,    53,    55,     7,    54,     4,
       6,     7,    12,    18,    23,    26,    50,    56,    57,    66,
      67,    70,    71,    72,    77,    82,    83,    87,    88,    14,
      15,    21,    10,     7,     8,     9,    10,    15,    73,    75,
      76,    77,    14,    22,    78,    55,     7,    89,    10,    29,
      13,    15,     5,    73,     7,    84,    22,    73,    75,    15,
      74,    73,    15,    10,    13,    19,    21,    68,     7,    56,
      14,    73,    86,    11,    17,    16,    15,    79,     7,     7,
       7,    58,    73,    17,    85,    75,    75,    73,    80,    81,
      20,    14,    30,    73,    11,    11,    11,    21,    10,    76,
      12,    56,    33,    73,    86,    25,    59,    75,    11,    76,
      27,    62,    64,    25,    15,    25,    76,    32,    60,    64,
      28,    63,    75,    24,    65,    61,    13,    63,    15,    76,
      31,    31,    11,    56,    56,    69,    56
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    35,    36,    37,    37,    38,    39,    39,    40,    40,
      42,    43,    44,    41,    45,    45,    46,    46,    48,    49,
      50,    47,    51,    51,    53,    52,    54,    54,    54,    54,
      55,    55,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    58,    59,    57,    60,    61,    60,    62,    62,    63,
      63,    65,    64,    66,    68,    69,    67,    70,    71,    72,
      73,    74,    73,    75,    75,    75,    75,    75,    75,    76,
      76,    78,    79,    77,    80,    80,    81,    81,    82,    82,
      84,    85,    83,    86,    87,    87,    88,    89,    89
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     0,     2,     3,     1,     3,     1,     2,
       0,     0,     0,     9,     0,     1,     2,     4,     0,     0,
       0,     7,     0,     2,     0,     4,     1,     3,     3,     5,
       0,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     0,    10,     0,     0,     4,     2,     3,     0,
       2,     0,     5,     2,     0,     0,    14,     3,     3,     4,
       1,     0,     4,     1,     1,     1,     3,     2,     9,     1,
       1,     0,     0,     6,     0,     1,     1,     3,     1,     3,
       0,     0,     7,     3,     3,     2,     9,     1,     3
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 108 "micko.y" /* yacc.c:1646  */
    {
		if(lookup_symbol("main", FUN) == NO_INDEX)
			err("undefined reference to 'main'");
	}
#line 1421 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 121 "micko.y" /* yacc.c:1646  */
    {
  		if((yyvsp[-2].i) == VOID)
  			err("variables cannot be of 'void' type");
  			
  		int i = (yyvsp[-1].i);
  		for(i; i <= get_last_element(); i++)
  			set_type(i,(yyvsp[-2].i));
  	}
#line 1434 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 134 "micko.y" /* yacc.c:1646  */
    {
		int idx = lookup_symbol((yyvsp[0].s), GVAR);
		if(idx == NO_INDEX)
			idx = insert_symbol((yyvsp[0].s), GVAR, 0, NO_ATR, NO_ATR);
		else
			err("redefinition of variable '%s'", (yyvsp[0].s));
		(yyval.i) = idx;
		
		code("\n%s:",(yyvsp[0].s));
		code("\n\t\tWORD\t1");
	}
#line 1450 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 146 "micko.y" /* yacc.c:1646  */
    {
  		int idx = lookup_symbol((yyvsp[0].s), GVAR);
  		if(idx == NO_INDEX)
  			idx = insert_symbol((yyvsp[0].s), GVAR, 0, NO_ATR, NO_ATR);
  		else
  			err("redefinition of variable '%s'", (yyvsp[0].s));
  			
  		code("\n%s:",(yyvsp[0].s));
  		code("\n\t\tWORD\t1");
  	}
#line 1465 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 165 "micko.y" /* yacc.c:1646  */
    {
		if((yyvsp[-1].i) == VOID)
			cur_fun_ret_t = VOID;
		if((yyvsp[-1].i) == INT)
			cur_fun_ret_t = INT;
		if((yyvsp[-1].i) == UINT)
			cur_fun_ret_t = UINT;
		if((yyvsp[-1].i) == NO_TYPE)
			err("function '%s' doesn't have a return type",(yyvsp[0].s));
		fun_idx = lookup_symbol((yyvsp[0].s), FUN);
		if(fun_idx == NO_INDEX)
			fun_idx = insert_symbol((yyvsp[0].s), FUN, (yyvsp[-1].i), NO_ATR, NO_ATR);
		else
			err("redefinition of function '%s'", (yyvsp[0].s));
			
		code("\n%s:", (yyvsp[0].s));
		code("\n\t\tPUSH\t%%14");
		code("\n\t\tMOV \t%%15,%%14");
		
	}
#line 1490 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 185 "micko.y" /* yacc.c:1646  */
    {param_count = 0;}
#line 1496 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 185 "micko.y" /* yacc.c:1646  */
    {set_atr1(fun_idx, param_count);}
#line 1502 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 186 "micko.y" /* yacc.c:1646  */
    {
		
		clear_symbols(fun_idx + param_count + 1);
		var_num = 0;
		
		code("\n@%s_exit:", (yyvsp[-7].s));
		code("\n\t\tMOV \t%%14,%%15");
		code("\n\t\tPOP \t%%14");
		code("\n\t\tRET");
	}
#line 1517 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 206 "micko.y" /* yacc.c:1646  */
    {
		if((yyvsp[-1].i) == VOID)
			err("parameters and variables cannot be of VOID type");
		param_count++;
		insert_symbol((yyvsp[0].s), PAR, (yyvsp[-1].i), param_count, NO_ATR);
	}
#line 1528 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 213 "micko.y" /* yacc.c:1646  */
    {
		int idx = lookup_symbol((yyvsp[0].s), VAR|PAR);
		if(idx < fun_idx){
			param_count++;
			insert_symbol((yyvsp[0].s), PAR, (yyvsp[-1].i), param_count, NO_ATR);
		}
		else
			err("parameter '%s' already declared", (yyvsp[0].s));
	}
#line 1542 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 226 "micko.y" /* yacc.c:1646  */
    { 
  		cur_fun_returned = 0;
  		num_exp_called_for_var = 1;
  	}
#line 1551 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 231 "micko.y" /* yacc.c:1646  */
    {
    	/*
    	if((var_num - already_subbed) > 0)
    		code("\n\tSUBS\t%%15,$%d,%%15", (var_num - already_subbed) * 4);
	  	*/
	  	code("\n@%s_body:", get_name(fun_idx));
	  	
	  	num_exp_called_for_var = 0;
    }
#line 1565 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 240 "micko.y" /* yacc.c:1646  */
    {
		if(cur_fun_returned == 0){
			if(get_type(fun_idx) != VOID)
				warn("Function '%s' expected a return value", get_name(fun_idx));
		
	  }
	}
#line 1577 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 256 "micko.y" /* yacc.c:1646  */
    {
		first_decled = 0;
		var_num_saver = var_num;
		begin_id = get_last_element();
		if((yyvsp[0].i) == VOID)
			err("parameters and variables cannot be of VOID type"); 
		temp_var = (yyvsp[0].i); 
	}
#line 1590 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 264 "micko.y" /* yacc.c:1646  */
    {
		
		if(first_decled == var_num){
			int i = 1;
			for(i; i < (var_num - var_num_saver); i++)
				if(get_kind(begin_id + i) == VAR)
					gen_mov(end_id, begin_id + i);
		}
		
	}
#line 1605 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 278 "micko.y" /* yacc.c:1646  */
    {
	  
		if(lookup_symbol((yyvsp[0].s), VAR) == NO_INDEX){
			int idx_param_exists_check = lookup_symbol((yyvsp[0].s), PAR);
			if(idx_param_exists_check < fun_idx)
				(yyval.i) = insert_symbol((yyvsp[0].s), VAR, temp_var, ++var_num, NO_ATR);
			else
				err("redefinition of variable '%s'", (yyvsp[0].s));
		}          
		else
			err("redefinition of variable '%s'", (yyvsp[0].s));
		code("\n\t\tSUBS\t%%15,$%d,%%15",4);
	}
#line 1623 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 292 "micko.y" /* yacc.c:1646  */
    {
		int idx;
		if(lookup_symbol((yyvsp[-2].s), VAR) == NO_INDEX){
			int idx_param_exists_check = lookup_symbol((yyvsp[-2].s), PAR);
			if(idx_param_exists_check > fun_idx) 
				err("redefinition of parameter '%s'", (yyvsp[-2].s));
			if(temp_var == get_type((yyvsp[0].i))) 
				(yyval.i) = insert_symbol((yyvsp[-2].s), VAR, temp_var, ++var_num, NO_ATR);
			else
				err("assigning values aren't of the same type");
		} else {
			err("redefinition of variable '%s'", (yyvsp[-2].s));
		}
		
		first_decled = var_num;
		
		gen_mov((yyvsp[0].i),(yyval.i));
		code("\n\t\tSUBS\t%%15,$%d,%%15",4);
	}
#line 1647 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 312 "micko.y" /* yacc.c:1646  */
    {
		if(lookup_symbol((yyvsp[0].s), VAR) == NO_INDEX){
			int idx_param_exists_check = lookup_symbol((yyvsp[0].s), PAR);
			if(idx_param_exists_check > fun_idx) 
				err("redefinition of parameter '%s'", (yyvsp[0].s));
			(yyval.i) = insert_symbol((yyvsp[0].s), VAR, temp_var, ++var_num, NO_ATR);
		}
		else
			err("redefinition of '%s'", (yyvsp[0].s));
		code("\n\t\tSUBS\t%%15,$%d,%%15",4);
	}
#line 1663 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 324 "micko.y" /* yacc.c:1646  */
    {
		int idx;
		if(lookup_symbol((yyvsp[-2].s), VAR) == NO_INDEX){
			int idx_param_exists_check = lookup_symbol((yyvsp[-2].s), PAR);
			if(idx_param_exists_check > fun_idx) 
				err("redefinition of parameter '%s'", (yyvsp[-2].s));

		if(temp_var == get_type((yyvsp[0].i)))
			(yyval.i) = insert_symbol((yyvsp[-2].s), VAR, temp_var, ++var_num, NO_ATR);
		else
			err("assinging values aren't of the same type");
		} else 
			err("redefinition of '%s'", (yyvsp[-2].s));
		
		gen_mov((yyvsp[0].i), (yyval.i));
		code("\n\t\tSUBS\t%%15,$%d,%%15",4);
		
		if(first_decled == 0){
			first_decled = var_num;
			end_id = (yyval.i);
		}
		
	}
#line 1691 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 367 "micko.y" /* yacc.c:1646  */
    {
		int idx = lookup_symbol((yyvsp[0].s), VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol((yyvsp[0].s), GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", (yyvsp[0].s));
		}
		
		temp_var = get_type(idx);
		
		
		compared_idx = idx;	
		check_num++;
		when_num = 0;
		if(currently_in_check == 0){
			check_count++;
			currently_in_check++;
		}					
	}
#line 1715 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 386 "micko.y" /* yacc.c:1646  */
    { lit_last_in_mem = get_last_element(); }
#line 1721 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 387 "micko.y" /* yacc.c:1646  */
    {
    	int i = lit_last_in_mem;
    	for(i; i <= get_last_element(); i++)
    		if(get_kind(i) == LIT)
    			if(get_atr2(i) == 1)
    				set_atr2(i,0);
    				
    	check_num--;
    	if(currently_in_check != 0)
    		currently_in_check--;    	
    }
#line 1737 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 401 "micko.y" /* yacc.c:1646  */
    {
  		code("\n@%dcheck%d_when%d:",check_count,check_num,when_num);
  		code("\n@%dcheck%d_when%d_body:",check_count,check_num,when_num);
  		code("\n@%dcheck%d_end:",check_count,check_num);
  	}
#line 1747 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 407 "micko.y" /* yacc.c:1646  */
    {
  		code("\n@%dcheck%d_when%d:",check_count,check_num,when_num);
  		code("\n@%dcheck%d_when%d_body:",check_count,check_num,when_num);
  	}
#line 1756 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 412 "micko.y" /* yacc.c:1646  */
    {
  		code("\n@%dcheck%d_end:",check_count,check_num);
  	}
#line 1764 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 424 "micko.y" /* yacc.c:1646  */
    {
  		code("\n\t\tJMP\t@%dcheck%d_when%d_body",check_count,check_num,when_num);
  	}
#line 1772 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 428 "micko.y" /* yacc.c:1646  */
    {
  		code("\n\t\tJMP\t@%dcheck%d_end",check_count, check_num);
  	}
#line 1780 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 435 "micko.y" /* yacc.c:1646  */
    {
  		code("\n@%dcheck%d_when%d:",check_count,check_num,when_num);
  		gen_cmp(compared_idx,(yyvsp[0].i));
  		when_num++;
  		code("\n\t\tJNE\t@%dcheck%d_when%d",check_count,check_num,when_num);
  		code("\n@%dcheck%d_when%d_body:", check_count,check_num,when_num-1);
  		
  	}
#line 1793 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 443 "micko.y" /* yacc.c:1646  */
    {
  		if(get_type((yyvsp[-3].i)) != temp_var)
  			err("check exp and const exp aren't the same type");
  	
  		if((yyvsp[-3].i) < lit_last_in_mem)
  			lit_last_in_mem = (yyvsp[-3].i);
  		if(get_atr2((yyvsp[-3].i)) == 1)
  			err("all constants in check statement must be unique");
  		else
  			set_atr2((yyvsp[-3].i),1); 
  	}
#line 1809 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 458 "micko.y" /* yacc.c:1646  */
    {
		if(get_type(fcall_idx) != VOID)
			err("Function '%s' has a return value", get_name(fcall_idx));
	}
#line 1818 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 465 "micko.y" /* yacc.c:1646  */
    {(yyval.i) = ++lab_para_num;}
#line 1824 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 466 "micko.y" /* yacc.c:1646  */
    {	
		int idx = lookup_symbol((yyvsp[-8].s), VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol((yyvsp[-8].s), GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", (yyvsp[-8].s));
		}
			
			
		if(get_type(idx) != get_type((yyvsp[-6].i)) || get_type((yyvsp[-4].i)) != get_type((yyvsp[-1].i)))
			err("in PASO exp, expression parameters aren't of the same type");
		if(get_type(idx) != get_type((yyvsp[-4].i)))
			err("in PASO exp, expression parameters aren't of the same type");
		int lit1 = atoi(get_name((yyvsp[-6].i)));
		int lit2 = atoi(get_name((yyvsp[-4].i)));
		if(lit2 <= lit1)
			err("in PASO exp, parameter 1 must be less than parameter 2");
			
		gen_mov((yyvsp[-6].i),idx);
		code("\n@para%d_begin:", (yyvsp[-9].i));
		gen_cmp(idx,(yyvsp[-4].i));
		
		int t = get_type(idx);
		if(t == INT)
			code("\n\t\tJGES\t@para%d_end", (yyvsp[-9].i));
		else
			code("\n\t\tJGEU\t@para%d_end", (yyvsp[-9].i));
			
		
		
	}
#line 1860 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 497 "micko.y" /* yacc.c:1646  */
    {
		int idx = lookup_symbol((yyvsp[-10].s), VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol((yyvsp[-10].s), GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", (yyvsp[-10].s));
		}
		
		int t = get_type(idx);
	
		if(t == INT)
			code("\n\t\tADDS\t");
		else
			code("\n\t\tADDU\t");
			
		gen_sym_name(idx);
		code(",");
		gen_sym_name((yyvsp[-3].i));
		code(",");
		gen_sym_name(idx);
		
		code("\n\t\tJMP\t@para%d_begin", (yyvsp[-11].i));
		code("\n@para%d_end:", (yyvsp[-11].i));
	}
#line 1889 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 525 "micko.y" /* yacc.c:1646  */
    {
		int idx = lookup_symbol((yyvsp[-2].s), VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol((yyvsp[-2].s), GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", (yyvsp[-2].s));
		}
			
			
		int t1 = get_type(idx);
		if(t1 == INT){
			code("\n\t\tADDS\t");
			gen_sym_name(idx);
			code(",$1,");
			gen_sym_name(idx);
		}
		else{
			code("\n\t\tADDU\t");
			gen_sym_name(idx);
			code(",$1,");
			gen_sym_name(idx);
		}
	}
#line 1917 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 556 "micko.y" /* yacc.c:1646  */
    {
		int idx = lookup_symbol((yyvsp[-3].s), VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol((yyvsp[-3].s), GVAR);
			if(idx == NO_INDEX)
				err("invalid lvalue '%s' in assignment", (yyvsp[-3].s));
				
			if(get_type(idx) != get_type((yyvsp[-1].i)))
				err("incompatible types in assignment");
		}
		else
			if(get_type(idx) != get_type((yyvsp[-1].i)))
				err("incompatible types in assignment");
				
		gen_mov((yyvsp[-1].i), idx);
	}
#line 1938 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 576 "micko.y" /* yacc.c:1646  */
    {
  		(yyval.i) = (yyvsp[0].i);		
  	}
#line 1946 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 581 "micko.y" /* yacc.c:1646  */
    {
  		
  		if((yyvsp[0].i) == FUN_REG){
  			saved_type = get_type((yyvsp[0].i));
  			pushed_reg++;
  			code("\n\tPUSH\t");
  			gen_sym_name((yyvsp[0].i));
  		}
  		
  	}
#line 1961 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 591 "micko.y" /* yacc.c:1646  */
    {
	 	
		int temp_reg;
		if(pushed_reg != 0){
			pushed_reg--;
			temp_reg = take_reg();
			set_type(temp_reg,saved_type);
			code("\n\tPOP \t");
			gen_sym_name(temp_reg);
			(yyval.i) = FUN_REG;
			was_a_fun = 1;
		}
		else{
			temp_reg = (yyvsp[-3].i);
		}
			
		if(get_type(temp_reg) != get_type((yyvsp[0].i)))
			err("invalid operands : arithmetic operation");
			
				
		int t1 = get_type(temp_reg);
		code("\n\t\t%s\t", ar_instructions[(yyvsp[-1].i) + (t1 - 1) * AROP_NUMBER]);
		gen_sym_name(temp_reg);
		code(",");
		gen_sym_name((yyvsp[0].i));
		code(",");
		
		free_if_reg(temp_reg);
		free_if_reg((yyvsp[0].i));
		
		if(was_a_fun == 0)
			(yyval.i) = take_reg();
		else
			was_a_fun = 0;
		gen_sym_name((yyval.i));
		set_type((yyval.i), t1);
		
	}
#line 2004 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 633 "micko.y" /* yacc.c:1646  */
    {
  		(yyval.i) = (yyvsp[0].i);
  	}
#line 2012 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 637 "micko.y" /* yacc.c:1646  */
    {
		(yyval.i) = lookup_symbol((yyvsp[0].s), VAR|PAR);
		if((yyval.i) == NO_INDEX || (yyval.i) < fun_idx){
			(yyval.i) = lookup_symbol((yyvsp[0].s), GVAR);
			if((yyval.i) == NO_INDEX)
				err("'%s' undeclared", (yyvsp[0].s));
		}
	}
#line 2025 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 646 "micko.y" /* yacc.c:1646  */
    {
  		(yyval.i) = FUN_REG;
  	}
#line 2033 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 650 "micko.y" /* yacc.c:1646  */
    { (yyval.i) = (yyvsp[-1].i); }
#line 2039 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 652 "micko.y" /* yacc.c:1646  */
    {
		int idx = lookup_symbol((yyvsp[-1].s), VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol((yyvsp[-1].s), GVAR);
			if(idx == NO_INDEX)
				err("'%s' undeclared", (yyvsp[-1].s));
		}
		
		(yyval.i) = take_reg();
		set_type((yyval.i), get_type(idx));
		
		gen_mov(idx, (yyval.i));
		
		int t1 = get_type(idx);
  		if(t1 == INT){
	  		code("\n\t\tADDS\t");
	  		gen_sym_name(idx);
	  		code(", $1, ");
	  		gen_sym_name(idx);
  		}  				
  		else{
  			code("\n\t\tADDU\t");
	  		gen_sym_name(idx);
	  		code(", $1, ");
	  		gen_sym_name(idx);
	  	}
	}
#line 2071 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 680 "micko.y" /* yacc.c:1646  */
    {
  		(yyval.i) = take_reg();
  		set_type((yyval.i),get_type((yyvsp[-2].i)));
  		
  		if(get_type((yyvsp[-7].i)) != get_type((yyvsp[-5].i)))
  			err("compared expressions aren't of the same type");
  		if(get_type((yyvsp[-2].i)) != get_type((yyvsp[0].i)))
  			err("assigning expressions aren't of the same type");
  			
  		code("\n@usl_izr_begin%d:", ++lab_usl_num);
  		gen_cmp((yyvsp[-7].i),(yyvsp[-5].i));
  		
  		int help = (yyvsp[-6].i) + (get_type((yyvsp[-7].i)) - 1)*RELOP_NUMBER;
  		code("\n\t\t%s\t@usl_izr_true%d",jumps[help], lab_usl_num);
  		code("\n@usl_izr_false%d:", lab_usl_num);
  		
  		gen_mov((yyvsp[0].i),(yyval.i));
  		code("\n\t\tJMP\t@usl_izr_end%d",lab_usl_num);
  		
  		code("\n@usl_izr_true%d:",lab_usl_num);
  		gen_mov((yyvsp[-2].i),(yyval.i));
  		code("\n@usl_izr_end%d:", lab_usl_num);
  	}
#line 2099 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 706 "micko.y" /* yacc.c:1646  */
    { (yyval.i) = insert_literal((yyvsp[0].s), INT); }
#line 2105 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 707 "micko.y" /* yacc.c:1646  */
    { (yyval.i) = insert_literal((yyvsp[0].s), UINT); }
#line 2111 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 712 "micko.y" /* yacc.c:1646  */
    {
		fcall_idx = lookup_symbol((yyvsp[0].s), FUN);
		if(fcall_idx == NO_INDEX)
			err("'%s' is not a function", (yyvsp[0].s));
		/*	
		if(num_exp_called_for_var == 1){
			code("\n\tSUBS\t%%15,$%d,%%15", (var_num - already_subbed)*4);
			already_subbed = var_num;
		}
		*/
	}
#line 2127 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 723 "micko.y" /* yacc.c:1646  */
    {arg_count = 0;}
#line 2133 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 724 "micko.y" /* yacc.c:1646  */
    {
		if(get_atr1(fcall_idx) != (yyvsp[-1].i))
			err("Wrong number of args to function '%s'", get_name(fcall_idx));
			
		code("\n\t\tCALL\t%s", get_name(fcall_idx));
		
		if((yyvsp[-1].i) > 0)
			code("\n\t\tADDS\t%%15,$%d,%%15", ((yyvsp[-1].i) * 4));
		
		set_type(FUN_REG, get_type(fcall_idx));
		(yyval.i) = FUN_REG;
	}
#line 2150 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 739 "micko.y" /* yacc.c:1646  */
    { (yyval.i) = 0; }
#line 2156 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 740 "micko.y" /* yacc.c:1646  */
    { (yyval.i) = (yyvsp[0].i); }
#line 2162 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 745 "micko.y" /* yacc.c:1646  */
    {
		arg_count++;
		if(get_type(fcall_idx + arg_count) != get_type((yyvsp[0].i)))
			err("Incompatible type of argument in '%s'", get_name(fcall_idx));
			
		
		code("\n\t\tPUSH\t");
		gen_sym_name((yyvsp[0].i));
		free_if_reg((yyvsp[0].i));
	  
		(yyval.i) = arg_count;
	}
#line 2179 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 758 "micko.y" /* yacc.c:1646  */
    {
		arg_count++;
		if(get_type(fcall_idx + arg_count) != get_type((yyvsp[0].i)))
			err("Incompatible type of argument in '%s'", get_name(fcall_idx));
			
		
		code("\n\t\tPUSH\t");
		gen_sym_name((yyvsp[0].i));
		free_if_reg((yyvsp[0].i));
		
		(yyval.i) = arg_count;
	}
#line 2196 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 774 "micko.y" /* yacc.c:1646  */
    { code("\n@exit%d:", (yyvsp[0].i));}
#line 2202 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 776 "micko.y" /* yacc.c:1646  */
    { code("\n@exit%d:", (yyvsp[-2].i));}
#line 2208 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 781 "micko.y" /* yacc.c:1646  */
    {
  	(yyval.i) = ++lab_num;
  	code("\n@if%d:", lab_num);
  }
#line 2217 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 785 "micko.y" /* yacc.c:1646  */
    {
  	code("\n\t\t%s\t@false%d", opp_jumps[(yyvsp[0].i)], (yyvsp[-1].i));
  	code("\n@true%d:", (yyvsp[-1].i));
  }
#line 2226 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 789 "micko.y" /* yacc.c:1646  */
    {
  	code("\n\t\tJMP \t@exit%d", (yyvsp[-4].i));
  	code("\n@false%d:", (yyvsp[-4].i));
  	(yyval.i) = (yyvsp[-4].i);
  }
#line 2236 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 798 "micko.y" /* yacc.c:1646  */
    {
		if(get_type((yyvsp[-2].i)) != get_type((yyvsp[0].i)))
			err("invalid operands : relational operator");
			
		(yyval.i) = (yyvsp[-1].i) + ((get_type((yyvsp[-2].i)) - 1)*RELOP_NUMBER);
		gen_cmp((yyvsp[-2].i),(yyvsp[0].i));
	}
#line 2248 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 809 "micko.y" /* yacc.c:1646  */
    {
		cur_fun_returned = 1;
		if(get_type(fun_idx) != get_type((yyvsp[-1].i)))
			err("Incompatible types in return '%s'", get_name(fun_idx));
			
		gen_mov((yyvsp[-1].i),FUN_REG);
		code("\n\t\tJMP \t@%s_exit",get_name(fun_idx));
	}
#line 2261 "micko.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 818 "micko.y" /* yacc.c:1646  */
    {
		cur_fun_returned = 1;
		if(get_type(fun_idx) != VOID)
			warn("Function '%s' expected a return value", get_name(fun_idx));
	}
#line 2271 "micko.tab.c" /* yacc.c:1646  */
    break;


#line 2275 "micko.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 834 "micko.y" /* yacc.c:1906  */


int yyerror(char *s) {
	fprintf(stderr, "\nline %d: ERROR: %s", yylineno, s);
	error_count++;
	return 0;
}
void warning(char *s){
	fprintf(stderr, "\nline %d: WARNING: %s", yylineno, s);
	warning_count++;
}

int main() {
	int synerr;
	init_symtab();
	output = fopen("output.asm", "w+");

	synerr = yyparse();

	clear_symtab();
	fclose(output);

	if(warning_count)
		printf("\n%d warning(s).\n", warning_count);
	if(error_count){
		remove("output.asm");
		printf("\n%d error(s).\n", error_count);
	}

	if(synerr)
		return -1;                  //syntax error
	else if(error_count)
		return error_count & 127;   //semantic errors
	else if(warning_count)
	return (warning_count & 127) + 127;  //warnings
	else
		return 0; //ok
}
