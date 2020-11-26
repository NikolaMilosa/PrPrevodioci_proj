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

  int cur_fun_ret_t;    //Provera tipa
  int cur_fun_returned; //Proverava da li je funk vratila

  int local_var_help;   //Za kraj compound statement kako bi se dodatno definisao princip lokaliteta 
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
%token _PARA
%token _PASO
%token _COLON


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
	  if($1 == VOID)
	    cur_fun_ret_t = VOID;
	  if($1 == INT)
	    cur_fun_ret_t = INT;
          if($1 == UINT)
	    cur_fun_ret_t = UINT;
	  if($1 == NO_TYPE)
	    err("function '%s' doesn't have a return type",$2);
	  fun_idx = lookup_symbol($2, FUN);
	  if(fun_idx == NO_INDEX)
	    fun_idx = insert_symbol($2, FUN, $1, NO_ATR, NO_ATR);
	  else
	    err("redefinition of function '%s'", $2);
	}
	_LPAREN {param_count = 0;} parameter _RPAREN body
	{
	  set_atr1(fun_idx, param_count);
	  clear_symbols(fun_idx + param_count + 1);
	  var_num = 0;
	}
  ;

parameter
  : /* empty */ { set_atr1(fun_idx, 0); }
  | _TYPE _ID
	{
	  if($1 == VOID)
	   err("parameters and variables cannot be of VOID type");
	  insert_symbol($2, PAR, $1, ++param_count, NO_ATR);
	}
  | parameter _COMMA _TYPE _ID
	{
	  int idx = lookup_symbol($4, VAR|PAR);
          if(idx < fun_idx)
            insert_symbol($4, PAR, $3, ++param_count, NO_ATR);
	}
  ;

body
  : _LBRACKET { cur_fun_returned = 0; } 
    statement_list 
	{
	  if(cur_fun_returned == 0){
	    if(get_type(fun_idx) != VOID)
              warn("Function '%s' expected a return value", get_name(fun_idx));
	  }
	}  _RBRACKET
  ;
/*
variable_list
  : 
  | variable_list variable
  ;
*/
variable
  : _TYPE 
	{
	  if($1 == VOID)
	   err("parameters and variables cannot be of VOID type"); 
	  temp_var = $1; 
	} var_poss _SEMICOLON
  ;

var_poss 
  : _ID
	{
	  
	  if(lookup_symbol($1, VAR) == NO_INDEX){
            int idx_param_exists_check = lookup_symbol($1, PAR);
            if(idx_param_exists_check < fun_idx)
	      insert_symbol($1, VAR, temp_var, ++var_num, NO_ATR);
	    else
	      err("redefinition of parameter '%s'", $1);
	    }          
	  else
	    err("redefinition of '%s'", $1);
	} 
  | _ID _ASSIGN num_exp
	{
	  if(lookup_symbol($1, VAR) == NO_INDEX){
	   int idx_param_exists_check = lookup_symbol($1, PAR);
           if(idx_param_exists_check > fun_idx) 
	     err("redefinition of parameter '%s'", $1);
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
	  if(lookup_symbol($3, VAR) == NO_INDEX){
	    int idx_param_exists_check = lookup_symbol($3, PAR);
            if(idx_param_exists_check > fun_idx) 
	      err("redefinition of parameter '%s'", $3);
	    insert_symbol($3, VAR, temp_var, ++var_num, NO_ATR);
	  }
	  else
	    err("redefinition of '%s'", $3);
	}
  | var_poss _COMMA _ID _ASSIGN num_exp
	{
	  if(lookup_symbol($3, VAR) == NO_INDEX){
	    int idx_param_exists_check = lookup_symbol($3, PAR);
            if(idx_param_exists_check > fun_idx) 
	      err("redefinition of parameter '%s'", $3);

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
  | variable
  | assignment_statement
  | if_statement
  | return_statement
  | select_statement
  | inc_statement
  | para_statement
  | void_func
  ;

void_func
  : function_call _SEMICOLON
	{
	  if(get_type(fcall_idx) != VOID)
	    err("Function '%s' has a return value", get_name(fcall_idx));
	}
  ;

para_statement 
  : _PARA _LPAREN _ID _ASSIGN literal _COLON literal _COLON _PASO literal _RPAREN statement
	{
	  int idx = lookup_symbol($3, VAR|PAR);
          if(idx == NO_INDEX)
	    err("undeclared '%s'", $3);
          if(get_type(idx) != get_type($5) || get_type($7) != get_type($10))
            err("in PASO exp, expression parameters aren't of the same type");
          if(get_type(idx) != get_type($7))
	    err("in PASO exp, expression parameters aren't of the same type");
	  int lit1 = atoi(get_name($5));
          int lit2 = atoi(get_name($7));
          if(lit2 < lit1)
            err("in PASO exp, parameter 1 must be less than parameter 2");
	}
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
  : _LBRACKET { local_var_help = get_last_element(); } 
    statement_list { clear_symbols(local_var_help); }
    _RBRACKET
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
	  arg_count++;
	  if(get_type(fcall_idx + arg_count) != get_type($1))
	    err("Incompatible type of argument in '%s'", get_name(fcall_idx));
	  
	  $$ = arg_count;
	}
  | argument _COMMA num_exp
	{
	  arg_count++;
	  if(get_type(fcall_idx + arg_count) != get_type($3))
	    err("Incompatible type of argument in '%s'", get_name(fcall_idx));
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
	  cur_fun_returned = 1;
	  if(get_type(fun_idx) != get_type($2))
	    err("Incompatible types in return '%s'", get_name(fun_idx));
	}
  | _RETURN _SEMICOLON
	{
	  cur_fun_returned = 1;
	  if(get_type(fun_idx) != VOID)
	    warn("Function '%s' expected a return value", get_name(fun_idx));
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
