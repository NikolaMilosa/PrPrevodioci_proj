%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "defs.h"
  #include "symtab.h"

  int yyparse(void);
  int yylex(void);
  int yyerror(char *s);
  void warning(char *s);
  extern int yylineno;

  char char_buffer[CHAR_BUFFER_LENGTH];
  int error_count = 0;
  int warning_count = 0;
  int var_num = 0;
  int fun_idx = -1;
  int fcall_idx = -1;

  int temp_var = NO_TYPE;
  int param_count = 0;
  int arg_count = 0;

  int brPar = 0;
%}

%union{
  int i;
  char *s;
}

%token <i> _TYPE
%token _IF
%token _ELSE
%token _RETURN
%token <s> _ID
%token <s> _INT_NUMBER
%token <s> _UINT_NUMBER
%token _LPAREN
%token _RPAREN
%token _LBRACKET
%token _RBRACKET
%token _ASSIGN
%token _SEMICOLON
%token <i> _AROP
%token <i> _RELOP

%token _SELECT
%token _FROM
%token _WHERE
%token _COMMA
%token <i>_INC_OP
%token <i> _DEC_OP

%type <i> num_exp exp literal function_call argument rel_exp var_poss

%nonassoc ONLY_IF
%nonassoc _ELSE

%%

program
  : function_list
	{
	  if(lookup_symbol("main", FUN) == NO_INDEX)
	    err("undefined reference to 'main'");
	}
  ;

function_list
  : function
  | function_list function
  ;

function
  : _TYPE _ID 
	{
	  fun_idx = lookup_symbol($2, FUN);
	  if(fun_idx == NO_INDEX)
	    fun_idx = insert_symbol($2, FUN, $1, NO_ATR, NO_ATR);
	  else
	    err("redefinition of function '%s'", $2);
	}
	_LPAREN {param_count = 0;} parameter _RPAREN body
	{
	  set_atr1(fun_idx, param_count);
	  set_atr2(fun_idx, temp_var);
	  clear_symbols(fun_idx + 1);
	  var_num = 0;
	}
  ;

parameter
  : /* empty */ { set_atr1(fun_idx, 0); }
  | _TYPE _ID
	{
	  insert_symbol($2, PAR, $1, ++param_count, NO_ATR);
	  temp_var = $1;
	}
  | parameter _COMMA _TYPE _ID
	{
	  int idx = lookup_symbol($4, VAR|PAR);
          if(idx == NO_INDEX)
            insert_symbol($4, PAR, $3, ++param_count, NO_ATR);
	  temp_var = $3;
	}
  ;

body
  : _LBRACKET variable_list statement_list _RBRACKET
  ;

variable_list
  : /* empty */
  | variable_list variable
  ;

variable
  : _TYPE { temp_var = $1; } var_poss _SEMICOLON
  ;

var_poss 
  : _ID
	{
	  if(lookup_symbol($1, VAR|PAR) == NO_INDEX)
	    insert_symbol($1, VAR, temp_var, ++var_num, NO_ATR);
          else
	    err("redefinition of '%s'", $1);
	} 
  | _ID _ASSIGN literal
	{
	  if(lookup_symbol($1, VAR|PAR) == NO_INDEX){
	   if(temp_var == get_type($3)) 
	    insert_symbol($1, VAR, temp_var, ++var_num, NO_ATR);
           else
	    err("assigning values aren't of the same type");
	 } else {
	    err("redefinition of '%s'", $1);
	 }
	}
  | var_poss _COMMA _ID 
	{
	  if(lookup_symbol($3, VAR|PAR) == NO_INDEX)
	    insert_symbol($3, VAR, temp_var, ++var_num, NO_ATR);
	  else
	    err("redefinition of '%s'", $3);
	}
  | var_poss _COMMA _ID _ASSIGN literal
	{
	  if(lookup_symbol($3, VAR|PAR) == NO_INDEX){
	    if(temp_var == get_type($5))
              insert_symbol($3, VAR, temp_var, ++var_num, NO_ATR);
            else
              err("assinging values aren't of the same type");
	  } else 
              err("redefinition of '%s'", $3);
	}
  ;

statement_list
  : /* empty */
  | statement_list statement
  ;

statement
  : compound_statement
  | assignment_statement
  | if_statement
  | return_statement
  | select_statement
  | inc_statement
  ;

inc_statement
  : _ID inc_dec _SEMICOLON
	{
	  int idx = lookup_symbol($1, VAR|PAR);
	  if(idx == NO_INDEX)
	    err("invalid lvalue '%s' in assignment", $1);
	}
  | inc_dec _ID _SEMICOLON
        {
	  int idx = lookup_symbol($2, VAR|PAR);
	  if(idx == NO_INDEX)
	    err("invalid lvalue '%s' in assignment", $2);
	}
  ;

inc_dec 
  : _INC_OP
  | _DEC_OP
  ;

compound_statement
  : _LBRACKET statement_list _RBRACKET
  ;

assignment_statement
  : _ID _ASSIGN num_exp _SEMICOLON
	{
	  int idx = lookup_symbol($1, VAR|PAR);
          if(idx == NO_INDEX)
	    err("invalid lvalue '%s' in assignment", $1);
	  else
	    if(get_type(idx) != get_type($3))
	      err("incompatible types in assignment");
	}
  ;

num_exp
  : exp
  | num_exp _AROP exp
	{
	  if(get_type($1) != get_type($3))
	    err("invalid operands : arithmetic operation");
	}
  ;

exp
  : literal
  | _ID
	{
	  $$ = lookup_symbol($1, VAR|PAR);
	  if($$ == NO_INDEX)
	    err("'%s' undeclared", $1); 
	}
  | function_call
  | _LPAREN num_exp _RPAREN
	{ $$ = $2; }
  | _ID inc_dec
	{
	  $$ = lookup_symbol($1, VAR|PAR);
	  if($$ == NO_INDEX)
	    err("'%s' undeclared", $1);
	}
  | inc_dec _ID
	{
	  $$ = lookup_symbol($2, VAR|PAR);
 	  if($$ == NO_INDEX)
	    err("'%s' undeclared", $2);
	}
  ;

literal
  : _INT_NUMBER { $$ = insert_literal($1, INT); }
  | _UINT_NUMBER { $$ = insert_literal($1, UINT); }
  ;

function_call
  : _ID 
	{
	  fcall_idx = lookup_symbol($1, FUN);
	  if(fcall_idx == NO_INDEX)
	    err("'%s' is not a function", $1);
	  brPar = get_atr1(fcall_idx);
	}
    _LPAREN {arg_count = 0;} argument _RPAREN
	{
	  if(get_atr1(fcall_idx) != $5)
	    err("Wrong number of args to function '%s'", get_name(fcall_idx));
	  set_type(FUN_REG, get_type(fcall_idx));
	  $$ = FUN_REG;
	}
  ;

argument
  : /* empty */ { $$ = 0; }
  | num_exp
	{
	  if(get_atr2(fcall_idx) != get_type($1))
	    err("Incompatible type of argument in '%s'", get_name(fcall_idx));
	  arg_count++;
	  $$ = arg_count;
	}
  | argument _COMMA num_exp
	{
	  if(get_atr2(fcall_idx) != get_type($3))
	    err("Incompatible type of argument in '%s'", get_name(fcall_idx));
	  arg_count++;
	  $$ = arg_count;
	}
  ;

if_statement
  : if_part %prec ONLY_IF
  | if_part _ELSE statement
  ;

if_part
  : _IF _LPAREN rel_exp _RPAREN statement
  ;

rel_exp
  : num_exp _RELOP num_exp
	{
	  if(get_type($1) != get_type($3))
	    err("invalid operands : relational operator");
	}
  ;

return_statement
  : _RETURN num_exp _SEMICOLON
	{
	  if(get_type(fun_idx) != get_type($2))
	    err("Incompatible types in return");
	}
  ;

select_statement
  : _SELECT arg_select _FROM _ID _WHERE _LPAREN rel_exp _RPAREN _SEMICOLON
  ;

arg_select 
  : _ID
  | arg_select _COMMA _ID
  ;

%%

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

  synerr = yyparse();

  clear_symtab();

  if(warning_count)
   printf("\n%d warning(s).\n", warning_count);
  if(error_count)
   printf("\n%d error(s).\n", error_count);

  if(synerr)
   return -1;
  else
   return error_count;
}
