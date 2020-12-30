%{
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
	
	int helper = 0;
	int helper_type = 0;

	int cur_fun_ret_t;     //Povratni tip funkcije
	int cur_fun_returned;  //Proverava da li je funkcija vratila vrednost
	
	int lit_last_in_mem;   //Vraca najmanji indeks literala koji se nalazio u listi simbola
	int check_num = -1;
	int when_num = 0;
	int compared_idx = 0;
	int check_count_prog = 0;
	
	int checked_lits = 0;
	
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
	
	//Rad sa checkom za ugnjezdavanje:
	int layer_count = -1;
	//When saver:
	struct whenNode {
		int when_num;
		int compared_idx;
		int temp_var;
		struct whenNode *next;
	};
	
	struct listW {
    	struct whenNode *start; 
	};
	
	void InitListW(struct listW *sList){
    	sList->start = NULL;
	};
	
	void pushW(struct listW *sList, int data, int ci, int tv){
		struct whenNode *p;
		p = malloc(sizeof(struct whenNode));
		p->when_num = data;
		p->compared_idx = ci;
		p->temp_var = tv;
		p->next = sList->start;
		sList->start = p;
	};
	
	//Popovanje whenova:
	void popW(struct listW *sList){
		if(sList->start != NULL) {
		    struct whenNode *p = sList->start;
		    sList->start = sList->start->next;
		    free(p);
		}
	};
	
	//Layer const:
	struct layerNode {
		int layer;
		int check_in_layer;
		struct layerNode *next;
	};
	
	struct listL {
		struct layerNode *start;
	};
	
	void InitListL(struct listL *sList){
		sList->start = NULL;
	};
	
	void pushL(struct listL *sList, int layer, int check){
		struct layerNode *p;
		p = malloc(sizeof(struct layerNode));
		p->layer = layer;
		p->check_in_layer = check;
		p->next = sList->start;
		sList->start = p;
	};
	
	//Lista za cuvanje whena:
	struct listW WhenList;
	//Lista za nivoe:
	struct listL LayerList;
	
	void clearLayerList(struct listL *sList){
		struct layerNode *current = sList->start;
		struct layerNode *next; 
		while(current != NULL) {
			next = current->next;
			free(current);
			current = next;
		}
	};
	//Pronalazi koliko checkova ima na tekucem nivou
	int findCheckInLayer(struct listL *sList, int lay){
		int i = -1;
		struct layerNode *curr = sList->start;
		while(curr != NULL){
			if(curr->layer == lay){
				i = curr->check_in_layer;
				break;
			}
			if(i != -1)
				break;
			curr = curr->next;
		}
		return i;
	};
	//Postavlja novu vrednost checka na nivou
	void setCheckInLayer(struct listL *sList, int lay, int che){
		struct layerNode *curr = sList->start;
		while(curr != NULL){
			if(curr->layer == lay){
				curr->check_in_layer = che;
				break;
			}
			curr = curr->next;
		}
	};
	
	//Rad sa literalima :
	
	//Matrica koja cuva sve po nivoima:
	int matrix[SYMBOL_TABLE_LENGTH][SYMBOL_TABLE_LENGTH];
	
	//Matrica koja cuva popunjenost odredjenog nivoa:
	int popunjenost[SYMBOL_TABLE_LENGTH];
	
	void cleanLay(int lay){
		int i = 0;
		for(i; i < popunjenost[lay]; i++)
			matrix[i][lay] = 0;
		popunjenost[lay] = 0;
	};
	
	int checkInLay(int lay, int o){
		int i = 0;
		for(i; i < popunjenost[lay]; i++){
			if(matrix[i][lay] == o)
				return -1;
		}
		return 1;
	};
	
	void addInLay(int lay, int o){
		if((popunjenost[lay] + 1) == SYMBOL_TABLE_LENGTH)
			err("Maximum supported when's in a single check is : %d", SYMBOL_TABLE_LENGTH);
		matrix[popunjenost[lay]][lay] = o;
		popunjenost[lay]++;
	};
	
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
%token _DEC_OP
%token _PARA
%token _PASO
%token _COLON
%token _CHECK
%token _WHEN
%token _FINISH
%token _LSBRAC
%token _RSBRAC
%token _ARROW
%token _OTHERWISE
%token _QMARK

%type <i> num_exp exp literal function_call argument var_poss rel_exp if_part 
%type <i> variable g_var_poss has_args

%nonassoc ONLY_IF
%nonassoc _ELSE

%%

program
  : {
  		//Inicijalizacija lista za slucaj postojanja checka:
		InitListW(&WhenList);
		InitListL(&LayerList);
		
  	}glob_vars function_list
	{
		if(lookup_symbol("main", FUN) == NO_INDEX)
			err("undefined reference to 'main'");
			
		int i = get_last_element();
		for(i; i > FUN_REG; i--)
			if(get_kind(i) == FUN)
				if(get_atr2(i) == 1)
					err("Function '%s' doesn't have a body", get_name(i));
					
	}
  ;

glob_vars
  :
  | glob_vars g_variable
  ;
  
g_variable
  : _TYPE g_var_poss _SEMICOLON
  	{
  		if($1 == VOID)
  			err("variables cannot be of 'void' type");
  			
  		int i = $2;
  		for(i; i <= get_last_element(); i++)
  			set_type(i,$1);
  	}
  ;
  
  
g_var_poss
  :  _ID
	{
		int idx = lookup_symbol($1, GVAR);
		if(idx == NO_INDEX)
			idx = insert_symbol($1, GVAR, 0, NO_ATR, NO_ATR);
		else
			err("redefinition of variable '%s'", $1);
		$$ = idx;
		
		code("\n%s:",$1);
		code("\n\t\tWORD\t1");
	}
  | g_var_poss _COMMA _ID
  	{
  		int idx = lookup_symbol($3, GVAR);
  		if(idx == NO_INDEX)
  			idx = insert_symbol($3, GVAR, 0, NO_ATR, NO_ATR);
  		else
  			err("redefinition of variable '%s'", $3);
  			
  		code("\n%s:",$3);
  		code("\n\t\tWORD\t1");
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
		if(fun_idx == NO_INDEX){
			fun_idx = insert_symbol($2, FUN, $1, NO_ATR, NO_ATR);
		}
		else{
			if(get_atr2(fun_idx) == 0)
				err("redefinition of function '%s'", $2);
			if(get_type(fun_idx) != $1)
				err("function '%s' being redefined doesn't have the same returning type", $2);				
		}
		
	}
	_LPAREN {param_count = 0;} parameter 
	{
		if(get_atr2(fun_idx) == 0)
			set_atr1(fun_idx, param_count);
	} _RPAREN func_end 
  ;
 
func_end 
  : 
  	{
  		code("\n%s:", get_name(fun_idx));
		code("\n\t\tPUSH\t%%14");
		code("\n\t\tMOV \t%%15,%%14");
	} body
	{
		if(get_atr2(fun_idx) == 0)
			clear_symbols(fun_idx + param_count + 1);
		var_num = 0;
		
		if(get_atr2(fun_idx) == 1){
			set_atr2(fun_idx, 0);
			if(get_atr1(fun_idx) != param_count)
				err("The numbers of parameters in function declaration and definition aren't matching");
		}
			
		code("\n@%s_exit:", get_name(fun_idx));
		code("\n\t\tMOV \t%%14,%%15");
		code("\n\t\tPOP \t%%14");
		code("\n\t\tRET");
	}
  | _SEMICOLON
  	{
  		if(get_atr2(fun_idx) == 1)
  			err("Function is already declared");
  		set_atr2(fun_idx, 1);
  		set_atr1(fun_idx, param_count);
  	}

parameter
  : 
  | func_with_par
  ;
  
  
func_with_par
  :  _TYPE _ID
	{
		if($1 == VOID)
			err("parameters and variables cannot be of VOID type");
		param_count++;
		
		if(get_atr2(fun_idx) == 0)
			insert_symbol($2, PAR, $1, param_count, NO_ATR);
		else{
			if(strcmp(get_name(fun_idx + param_count),$2) == 0){
				if(get_type(fun_idx + param_count) != $1)
					err("Parameters in function declaration and definition aren't matching in type");
			}
			else
				err("Parameters in function declaration and definition aren't matching in name");
		}
	}
  | func_with_par _COMMA _TYPE _ID
	{
		param_count++;
		if(get_atr2(fun_idx) == 1){
			if(strcmp(get_name(fun_idx + param_count),$4) == 0){
				if(get_type(fun_idx + param_count) != $3)
					err("Parameters in function declaration and definition aren't matching in type");
			}
			else
				err("Parameters in function declaration and definition aren't matching in name");
		}
		else {
			int idx = lookup_symbol($4, VAR|PAR);
			if(idx < fun_idx){
				insert_symbol($4, PAR, $3, param_count, NO_ATR);
			
			}
			else
				err("parameter '%s' already declared", $4);
		}
	}
  ;

body
  : _LBRACKET 
  	{ 
  		cur_fun_returned = 0;
  		num_exp_called_for_var = 1;
  	} 
    variable_list
    {	
	  	code("\n@%s_body:", get_name(fun_idx));
	  	
	  	num_exp_called_for_var = 0;
    } statement_list 
	{
		if(cur_fun_returned == 0){
			if(get_type(fun_idx) != VOID)
				warn("Function '%s' expected a return value", get_name(fun_idx));
		
	  }
	}  _RBRACKET
  ;

variable_list
  : 
  | variable_list variable
  ;

variable
  : _TYPE 
	{
		first_decled = 0;
		var_num_saver = var_num;
		begin_id = get_last_element();
		if($1 == VOID)
			err("parameters and variables cannot be of VOID type"); 
		temp_var = $1; 
	} var_poss _SEMICOLON
	{
		
		if(first_decled == var_num){
			int i = 1;
			for(i; i < (var_num - var_num_saver); i++)
				if(get_kind(begin_id + i) == VAR)
					gen_mov(end_id, begin_id + i);
		}
		
	}
  ;

var_poss 
  : _ID
	{
	  
		if(lookup_symbol($1, VAR) == NO_INDEX){
			int idx_param_exists_check = lookup_symbol($1, PAR);
			if(idx_param_exists_check < fun_idx)
				$$ = insert_symbol($1, VAR, temp_var, ++var_num, NO_ATR);
			else
				err("redefinition of variable '%s'", $1);
		}          
		else
			err("redefinition of variable '%s'", $1);
		
		code("\n\t\tMOV \t$0,");
		gen_sym_name($$);
		code("\n\t\tSUBS\t%%15,$%d,%%15",4);
		
	} 
  | _ID _ASSIGN num_exp
	{
		int idx;
		if(lookup_symbol($1, VAR) == NO_INDEX){
			int idx_param_exists_check = lookup_symbol($1, PAR);
			if(idx_param_exists_check > fun_idx) 
				err("redefinition of parameter '%s'", $1);
			if(temp_var == get_type($3)) 
				$$ = insert_symbol($1, VAR, temp_var, ++var_num, NO_ATR);
			else
				err("assigning values aren't of the same type");
		} else {
			err("redefinition of variable '%s'", $1);
		}
		
		first_decled = var_num;
		
		gen_mov($3,$$);
		code("\n\t\tSUBS\t%%15,$%d,%%15",4);
	}
  | var_poss _COMMA _ID 
	{
		if(lookup_symbol($3, VAR) == NO_INDEX){
			int idx_param_exists_check = lookup_symbol($3, PAR);
			if(idx_param_exists_check > fun_idx) 
				err("redefinition of parameter '%s'", $3);
			$$ = insert_symbol($3, VAR, temp_var, ++var_num, NO_ATR);
		}
		else
			err("redefinition of '%s'", $3);
		
		
		code("\n\t\tMOV \t$0,");
		gen_sym_name($$);	
		code("\n\t\tSUBS\t%%15,$%d,%%15",4);
	}
  | var_poss _COMMA _ID _ASSIGN num_exp
	{
		int idx;
		if(lookup_symbol($3, VAR) == NO_INDEX){
			int idx_param_exists_check = lookup_symbol($3, PAR);
			if(idx_param_exists_check > fun_idx) 
				err("redefinition of parameter '%s'", $3);

		if(temp_var == get_type($5))
			$$ = insert_symbol($3, VAR, temp_var, ++var_num, NO_ATR);
		else
			err("assinging values aren't of the same type");
		} else 
			err("redefinition of '%s'", $3);
			
		gen_mov($5, $$);
		code("\n\t\tSUBS\t%%15,$%d,%%15",4);
		
		if(first_decled == 0){
			first_decled = var_num;
			end_id = $$;
		}
		
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
  | fulUn_statement
  | para_statement
  | void_func
  | check_exp
  ;

check_exp
  : _CHECK _LSBRAC _ID 
	{
		int idx = lookup_symbol($3, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($3, GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", $3);
		}
		
		//Sredjivanje layer_counta i checka u layeru
		layer_count++;
		if(layer_count == SYMBOL_TABLE_LENGTH)
			err("Maximum supported layering : %d",SYMBOL_TABLE_LENGTH);
		
		int i = findCheckInLayer(&LayerList, layer_count);
		if(i == -1){
			pushL(&LayerList, layer_count, 0);
			i = 0;
		}
			
		check_num = i;		
		
		//Sredjivanje whena
		pushW(&WhenList, when_num, compared_idx, temp_var);
		when_num = 0;
		compared_idx = idx;
		temp_var = get_type(idx);
		
	}
    _RSBRAC _LBRACKET { lit_last_in_mem = get_last_element(); } whenPart otherwise _RBRACKET
    {
    				
    	struct whenNode *p = WhenList.start;
    	compared_idx = p->compared_idx;
    	when_num = p->when_num;
    	temp_var = p->temp_var;
    	popW(&WhenList);  
    	
    	cleanLay(layer_count);
    	
    	setCheckInLayer(&LayerList, layer_count, check_num + 1);
    	
    	layer_count--;
    	check_num = findCheckInLayer(&LayerList,layer_count);
    }
  ;

otherwise
  : {
  		code("\n@%dcheck%d_when%d:",layer_count,check_num,when_num);
  		code("\n@%dcheck%d_when%d_body:",layer_count,check_num,when_num);
  		code("\n@%dcheck%d_end:",layer_count,check_num);
  	}
  | _OTHERWISE 
  	{
  		code("\n@%dcheck%d_when%d:",layer_count,check_num,when_num);
  		code("\n@%dcheck%d_when%d_body:",layer_count,check_num,when_num);
  	}
  	_ARROW statement
  	{
  		code("\n@%dcheck%d_end:",layer_count,check_num);
  	}
  ;
  
whenPart
  : when finish_par
  | whenPart when finish_par
  ;
  
finish_par
  :
  	{
  		code("\n\t\tJMP\t@%dcheck%d_when%d_body",layer_count,check_num,when_num);
  	}
  |  _FINISH _SEMICOLON
  	{
  		code("\n\t\tJMP\t@%dcheck%d_end",layer_count,check_num);
  	}
  ;
    
when
  : _WHEN literal
  	{
  		code("\n@%dcheck%d_when%d:",layer_count,check_num,when_num);
  		gen_cmp(compared_idx,$2);
  		when_num++;
  		code("\n\t\tJNE\t@%dcheck%d_when%d",layer_count,check_num,when_num);
  		code("\n@%dcheck%d_when%d_body:",layer_count, check_num,when_num-1);
  		
  		if(checkInLay(layer_count,$2) != -1)
  			addInLay(layer_count,$2);
  		else
  			err("all constants in check statement must be unique");
  		
  		
  	} _ARROW statement
  	{
  		if(get_type($2) != temp_var)
  			err("check exp and const exp aren't the same type");
  	 
  	}
  ; 

void_func
  : function_call _SEMICOLON
	{
		if(get_type(fcall_idx) != VOID)
			err("Function '%s' has a return value", get_name(fcall_idx));
	}
  ;

para_statement 
  : _PARA _LPAREN {$<i>$ = ++lab_para_num;} _ID _ASSIGN literal _COLON literal _COLON _PASO literal _RPAREN 
	{	
		int idx = lookup_symbol($4, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($4, GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", $4);
		}
			
			
		if(get_type(idx) != get_type($6) || get_type($8) != get_type($11))
			err("in PASO exp, expression parameters aren't of the same type");
		if(get_type(idx) != get_type($8))
			err("in PASO exp, expression parameters aren't of the same type");
		int lit1 = atoi(get_name($6));
		int lit2 = atoi(get_name($8));
		if(lit2 <= lit1)
			err("in PASO exp, parameter 1 must be less than parameter 2");
			
		gen_mov($6,idx);
		code("\n@para%d_begin:", $<i>3);
		gen_cmp(idx,$8);
		
		int t = get_type(idx);
		if(t == INT)
			code("\n\t\tJGES\t@para%d_end", $<i>3);
		else
			code("\n\t\tJGEU\t@para%d_end", $<i>3);
			
		
		
	} statement
	{
		int idx = lookup_symbol($4, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($4, GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", $4);
		}
		
		int t = get_type(idx);
	
		if(t == INT)
			code("\n\t\tADDS\t");
		else
			code("\n\t\tADDU\t");
			
		gen_sym_name(idx);
		code(",");
		gen_sym_name($11);
		code(",");
		gen_sym_name(idx);
		
		code("\n\t\tJMP\t@para%d_begin", $<i>3);
		code("\n@para%d_end:", $<i>3);
	}
  ;

fulUn_statement
  : _ID _INC_OP _SEMICOLON
	{
		int idx = lookup_symbol($1, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($1, GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", $1);
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
  | _INC_OP _ID _SEMICOLON
  	{
  		int idx = lookup_symbol($2, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($2, GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", $2);
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
  | _ID _DEC_OP _SEMICOLON
  	{
  		int idx = lookup_symbol($1, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($1, GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", $1);
		}
			
			
		int t1 = get_type(idx);
		if(t1 == INT){
			code("\n\t\tSUBS\t");
			gen_sym_name(idx);
			code(",$1,");
			gen_sym_name(idx);
		}
		else{
			code("\n\t\tSUBU\t");
			gen_sym_name(idx);
			code(",$1,");
			gen_sym_name(idx);
		}
  	}
  | _DEC_OP _ID _SEMICOLON
  	{
  		int idx = lookup_symbol($2, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($2, GVAR);
			if(idx == NO_INDEX)
				err("undeclared '%s'", $2);
		}
			
			
		int t1 = get_type(idx);
		if(t1 == INT){
			code("\n\t\tSUBS\t");
			gen_sym_name(idx);
			code(",$1,");
			gen_sym_name(idx);
		}
		else{
			code("\n\t\tSUBU\t");
			gen_sym_name(idx);
			code(",$1,");
			gen_sym_name(idx);
		}
  	}		
  ;

compound_statement
  : _LBRACKET statement_list _RBRACKET
  ;

assignment_statement
  : _ID _ASSIGN num_exp _SEMICOLON
	{
		int idx = lookup_symbol($1, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($1, GVAR);
			if(idx == NO_INDEX)
				err("invalid lvalue '%s' in assignment", $1);
				
			if(get_type(idx) != get_type($3))
				err("incompatible types in assignment");
		}
		else
			if(get_type(idx) != get_type($3))
				err("incompatible types in assignment");
				
		gen_mov($3, idx);
	}
  ;

num_exp
  : exp
  	{
  		$$ = $1;		
  	}

  | num_exp
  	{
  		
  		if($1 == FUN_REG){
  			saved_type = get_type($1);
  			pushed_reg++;
  			code("\n\tPUSH\t");
  			gen_sym_name($1);
  		}
  		
  	} _AROP exp
	{
	 	
		int temp_reg;
		if(pushed_reg != 0){
			pushed_reg--;
			temp_reg = take_reg();
			set_type(temp_reg,saved_type);
			code("\n\tPOP \t");
			gen_sym_name(temp_reg);
			$$ = FUN_REG;
			was_a_fun = 1;
		}
		else{
			temp_reg = $1;
		}
			
		if(get_type(temp_reg) != get_type($4))
			err("invalid operands : arithmetic operation");
			
				
		int t1 = get_type(temp_reg);
		code("\n\t\t%s\t", ar_instructions[$3 + (t1 - 1) * AROP_NUMBER]);
		gen_sym_name(temp_reg);
		code(",");
		gen_sym_name($4);
		code(",");
		
		free_if_reg(temp_reg);
		free_if_reg($4);
		
		if(was_a_fun == 0)
			$$ = take_reg();
		else
			was_a_fun = 0;
		gen_sym_name($$);
		set_type($$, t1);
		
	}
  ;

exp
  : literal
  	{
  		$$ = $1;
  	}
  | _ID
	{
		$$ = lookup_symbol($1, VAR|PAR);
		if($$ == NO_INDEX || $$ < fun_idx){
			$$ = lookup_symbol($1, GVAR);
			if($$ == NO_INDEX)
				err("'%s' undeclared", $1);
		}
	}
  | function_call
  	{
  		$$ = FUN_REG;
  	}
  | _LPAREN num_exp _RPAREN
	{ $$ = $2; }
  | _ID _INC_OP
	{
		int idx = lookup_symbol($1, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($1, GVAR);
			if(idx == NO_INDEX)
				err("'%s' undeclared", $1);
		}
		
		$$ = take_reg();
		set_type($$, get_type(idx));
		
		gen_mov(idx, $$);
		
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
  | _ID _DEC_OP
  	{
  		int idx = lookup_symbol($1, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($1, GVAR);
			if(idx == NO_INDEX)
				err("'%s' undeclared", $1);
		}
		
		$$ = take_reg();
		set_type($$, get_type(idx));
		
		gen_mov(idx, $$);
		
		int t1 = get_type(idx);
  		if(t1 == INT){
	  		code("\n\t\tSUBS\t");
	  		gen_sym_name(idx);
	  		code(", $1, ");
	  		gen_sym_name(idx);
  		}  				
  		else{
  			code("\n\t\tSUBU\t");
	  		gen_sym_name(idx);
	  		code(", $1, ");
	  		gen_sym_name(idx);
	  	}
  	}
  | _DEC_OP _ID
  	{
  		int idx = lookup_symbol($2, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($2, GVAR);
			if(idx == NO_INDEX)
				err("'%s' undeclared", $2);
		}
		
		int t1 = get_type(idx);
  		if(t1 == INT){
	  		code("\n\t\tSUBS\t");
	  		gen_sym_name(idx);
	  		code(", $1, ");
	  		gen_sym_name(idx);
  		}  				
  		else{
  			code("\n\t\tSUBU\t");
	  		gen_sym_name(idx);
	  		code(", $1, ");
	  		gen_sym_name(idx);
	  	}
	  	
	  	$$ = idx;
  	}
  | _INC_OP _ID
  	{
  		int idx = lookup_symbol($2, VAR|PAR);
		if(idx == NO_INDEX || idx < fun_idx){
			idx = lookup_symbol($2, GVAR);
			if(idx == NO_INDEX)
				err("'%s' undeclared", $2);
		}
		
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
	  	
	  	$$ = idx;
  	}
  | _LPAREN rel_exp _RPAREN _QMARK 
  	{
  		code("\n@usl_izr_begin%d:", ++lab_usl_num);
  		
  		int help = $2;
  		code("\n\t\t%s\t@usl_izr_false%d",opp_jumps[help], lab_usl_num);
  		code("\n@usl_izr_true%d:", lab_usl_num);
  	} exp 
  	{
  		helper = take_reg();
  		//set_type(helper,get_type($6));
  		
  		gen_mov($6,helper);
  		code("\n\t\tJMP\t@usl_izr_end%d",lab_usl_num);
  		code("\n\t\t@usl_izr_false%d:", lab_usl_num);
  	} _COLON exp
  	{
  		
  		if(get_type(helper) != get_type($9))
  			err("assigning expressions aren't of the same type");
  		
  		
  		gen_mov($9,helper);
  		code("\n\t\tJMP\t@usl_izr_end%d",lab_usl_num);
  		code("\n@usl_izr_end%d:", lab_usl_num);
  		
  		$$ = helper;
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
			
		code("\n\t\tCALL\t%s", get_name(fcall_idx));
		
		if($5 > 0)
			code("\n\t\tADDS\t%%15,$%d,%%15", ($5 * 4));
		
		set_type(FUN_REG, get_type(fcall_idx));
		$$ = FUN_REG;
	}
  ;

argument
  : /* empty */ { $$ = 0; }
  | has_args { $$ = $1; }
  ;
  
has_args
  : num_exp
	{
		arg_count++;
		if(get_type(fcall_idx + arg_count) != get_type($1))
			err("Incompatible type of argument in '%s'", get_name(fcall_idx));
			
		
		code("\n\t\tPUSH\t");
		gen_sym_name($1);
		free_if_reg($1);
	  
		$$ = arg_count;
	}
  | has_args _COMMA num_exp
	{
		arg_count++;
		if(get_type(fcall_idx + arg_count) != get_type($3))
			err("Incompatible type of argument in '%s'", get_name(fcall_idx));
			
		
		code("\n\t\tPUSH\t");
		gen_sym_name($3);
		free_if_reg($3);
		
		$$ = arg_count;
	}
  ;

if_statement
  : if_part %prec ONLY_IF
  	{ code("\n@exit%d:", $1);}
  | if_part _ELSE statement
  	{ code("\n@exit%d:", $1);}
  ;

if_part
  : _IF _LPAREN
  {
  	$<i>$ = ++lab_num;
  	code("\n@if%d:", lab_num);
  } rel_exp 
  {
  	code("\n\t\t%s\t@false%d", opp_jumps[$4], $<i>3);
  	code("\n@true%d:", $<i>3);
  }_RPAREN statement
  {
  	code("\n\t\tJMP \t@exit%d", $<i>3);
  	code("\n@false%d:", $<i>3);
  	$$ = $<i>3;
  }
  ;

rel_exp
  : num_exp _RELOP num_exp
	{
		if(get_type($1) != get_type($3))
			err("invalid operands : relational operator");
			
		$$ = $2 + ((get_type($1) - 1)*RELOP_NUMBER);
		gen_cmp($1,$3);
	}
  ;

return_statement
  : _RETURN num_exp _SEMICOLON
	{
		cur_fun_returned = 1;
		if(get_type(fun_idx) != get_type($2))
			err("Incompatible types in return '%s'", get_name(fun_idx));
			
		gen_mov($2,FUN_REG);
		code("\n\t\tJMP \t@%s_exit",get_name(fun_idx));
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
	output = fopen("output.asm", "w+");

	synerr = yyparse();

	clear_symtab();
	fclose(output);
	
	//clearLayerList(&LayerList);

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
