#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "codegen.h"
#include "symtab.h"


extern FILE *output;
int free_reg_num = 0;
char invalid_value[] = "???";
//Moje funk :
int get_frn(){
	return free_reg_num;
}

//Funkcije za ugnjezdavanje check-whena :

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

void popW(struct listW *sList){
	if(sList->start != NULL) {
	    struct whenNode *p = sList->start;
	    sList->start = sList->start->next;
	    free(p);
	}
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

void clearLayerList(struct listL *sList){
	struct layerNode *current = sList->start;
	struct layerNode *next; 
	while(current != NULL) {
		next = current->next;
		free(current);
		current = next;
	}
};

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

// REGISTERS

int take_reg(void) {
  if(free_reg_num > LAST_WORKING_REG) {
    err("Compiler error! No free registers!");
    exit(EXIT_FAILURE);
  }
  return free_reg_num++;
}

void free_reg(void) {
   if(free_reg_num < 1) {
      err("Compiler error! No more registers to free!");
      exit(EXIT_FAILURE);
   }
   else
      set_type(--free_reg_num, NO_TYPE);
}

// Ako je u pitanju indeks registra, oslobodi registar
void free_if_reg(int reg_index) {
  if(reg_index >= 0 && reg_index <= LAST_WORKING_REG)
    free_reg();
}

// SYMBOL
void gen_sym_name(int index) {
  if(index > -1) {
    if(get_kind(index) == VAR) // -n*4(%14)
      code("-%d(%%14)", get_atr1(index) * 4);
    else 
      if(get_kind(index) == PAR) // m*4(%14)
        {
        	int i = index;
        	int tek_fun;
        	for(i; i > FUN_REG; i--)
        		if(get_kind(i) == FUN){
        			tek_fun = i;
        			break;
        		}
        	code("%d(%%14)", 4 + (get_atr1(tek_fun) + 1 - get_atr1(index)) *4);
        }
      else
        if(get_kind(index) == LIT)
          code("$%s", get_name(index));
        else 
          if(get_kind(index) == GVAR)
            code("%s", get_name(index));
        else //function, reg
          code("%s", get_name(index));
  }
}

// OTHER

void gen_cmp(int op1_index, int op2_index) {
  if(get_type(op1_index) == INT)
    code("\n\t\tCMPS \t");
  else
    code("\n\t\tCMPU \t");
  gen_sym_name(op1_index);
  code(",");
  gen_sym_name(op2_index);
  free_if_reg(op2_index);
  free_if_reg(op1_index);
}

void gen_mov(int input_index, int output_index) {
  code("\n\t\tMOV \t");
  gen_sym_name(input_index);
  code(",");
  gen_sym_name(output_index);

  //ako se smešta u registar, treba preneti tip 
  if(output_index >= 0 && output_index <= LAST_WORKING_REG)
    set_type(output_index, get_type(input_index));
  free_if_reg(input_index);
}

