%option noyywrap yylineno
%{
	#include <string.h>
	#include "micko.tab.h"
	#include "defs.h"
	extern YYSTYPE yylval;
%}

%%

[ \t\n]+             { /* skip */ }

"int"                { yylval.i = INT; return _TYPE; }
"unsigned"           { yylval.i = UINT; return _TYPE; }
"if"                 { return _IF; }
"else"               { return _ELSE; }
"return"             { return _RETURN; }
"select"             { return _SELECT; }                  //Ostalo od nadograđivanja sa vezbi
"from"               { return _FROM; }
"where"              { return _WHERE; }
"void"               { yylval.i = VOID; return _TYPE; }
"para"               { return _PARA; }
"paso"               { return _PASO; }
":"                  { return _COLON; }
"check"              { return _CHECK; }
"when"               { return _WHEN; }
"finish"             { return _FINISH; }
"otherwise"          { return _OTHERWISE; }

"["                  { return _LSBRAC; }
"]"                  { return _RSBRAC; }
"->"                 { return _ARROW; }
"?"                  { return _QMARK; }


","                  { return _COMMA; }

"("                  { return _LPAREN; }
")"                  { return _RPAREN; }
"{"                  { return _LBRACKET; }
"}"                  { return _RBRACKET; }
";"                  { return _SEMICOLON; }
"="                  { return _ASSIGN; }

"+"                  { yylval.i = ADD; return _AROP; }
"-"                  { yylval.i = SUB; return _AROP; }
"++"                 { yylval.i = INC; return _INC_OP; }
"--"                 { yylval.i = DEC; return _DEC_OP; }

"<"                  { yylval.i = LT; return _RELOP; }
">"                  { yylval.i = GT; return _RELOP; }
"<="                 { yylval.i = LE; return _RELOP; }
">="                 { yylval.i = GE; return _RELOP; }
"=="                 { yylval.i = EQ; return _RELOP; }
"!="                 { yylval.i = NE; return _RELOP; }

[a-zA-Z][a-zA-Z0-9]* { yylval.s = strdup(yytext); return _ID; }
[+-]?[0-9]{1,10}     { yylval.s = strdup(yytext); return _INT_NUMBER;}
[0-9]{1,10}[uU]      { yylval.s = strdup(yytext); yylval.s[yyleng-1] = 0; return _UINT_NUMBER;}

\/\/.*               { /* skip */ }
"/*"[^*]*|[*]*"*/"   { /* skip */ }
.                    { printf("line %d: LEXICAL ERROR on char %c\n", 
                              yylineno, *yytext);}
%%
