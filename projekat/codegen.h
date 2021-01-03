#ifndef CODEGEN_H
#define CODEGEN_H

#include "defs.h"

//Moje funk:
int get_frn();

//Funkcije za rad sa listama : 
//Structovi :

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

void InitListW(struct listW *sList);
void pushW(struct listW *sList, int data, int ci, int tv);
void popW(struct listW *sList);

//Layer const:
struct layerNode {
	int layer;
	int check_in_layer;
	struct layerNode *next;
};

struct listL {
	struct layerNode *start;
};

void InitListL(struct listL *sList);
void pushL(struct listL *sList, int layer, int check);
void clearLayerList(struct listL *sList);
int findCheckInLayer(struct listL *sList, int lay);
void setCheckInLayer(struct listL *sList, int lay, int che);

//Lista za cuvanje whena:
struct listW WhenList;
//Lista za nivoe:
struct listL LayerList;

//Matrica koja cuva sve literale po nivoima:
int matrix[SYMBOL_TABLE_LENGTH][SYMBOL_TABLE_LENGTH];
int popunjenost[SYMBOL_TABLE_LENGTH];

void cleanLay(int lay);
int checkInLay(int lay, int o);
void addInLay(int lay, int o);


// funkcije za zauzimanje, oslobadjanje registra
int  take_reg(void);
void free_reg(void);
// oslobadja ako jeste indeks registra
void free_if_reg(int reg_index); 

// ispisuje simbol (u odgovarajucem obliku) 
// koji se nalazi na datom indeksu u tabeli simbola
void gen_sym_name(int index);

// generise CMP naredbu, parametri su indeksi operanada u TS-a 
void gen_cmp(int operand1_index, int operand2_index);

// generise MOV naredbu, parametri su indeksi operanada u TS-a 
void gen_mov(int input_index, int output_index);

#endif
