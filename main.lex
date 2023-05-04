%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
void ret_print(char *token_type);
void yyerror();
%}

RESERVED_WORDS          "go to"|exit|if|then|else|case|endcase|"else if"|while|do|endwhile|repeat|until|loop|forever|for|to|by|endfor|input|output|array|node|call|return|stop|end|procedure|null
BOOLEAN                 true|false
MATH_NOTATIONS          floor|ceil|log|mod
RELATIONAL_OPS          <|<=|==|:=|!=|>|>=  
LOGICAL_OPS             and|&&|or|"||"|not|! 
ARITHMETIC_OPS          \+|\-|\/|\*|\^      
IDENTIFIER              [a-zA-Z_][a-zA-Z0-9_]*
INTEGER                 [0-9]+
FLOAT                   [0-9]+\.[0-9]+
LITERAL                 \'[^!']*\'
ASSIGNMENT              =
COLON                   :
SEMICOLON               ;
COMMA                   ,
PARENTHESIS             \(|\)
BRACKET                 \[|\]

%%
{RESERVED_WORDS}        { ret_print("RESERVED_WORDS"); }
{BOOLEAN}               { ret_print("BOOLEAN"); }        
{MATH_NOTATIONS}        { ret_print("MATH_NOTATIONS"); }
{RELATIONAL_OPS}        { ret_print("RELATIONAL_OPS"); }
{LOGICAL_OPS}           { ret_print("LOGICAL_OPS"); }  
{ARITHMETIC_OPS}        { ret_print("ARITHMETIC_OPS"); }        
{IDENTIFIER}            { ret_print("IDENTIFIER"); } 
{INTEGER}               { ret_print("INTEGER"); }
{FLOAT}                 { ret_print("FLOAT"); }
{LITERAL}               { ret_print("LITERAL"); }
{ASSIGNMENT}            { ret_print("ASSIGNMENT"); }
{COLON}                 { ret_print("COLON"); }
{SEMICOLON}             { ret_print("SEMICOLON"); }
{COMMA}                 { ret_print("COMMA"); }
{PARENTHESIS}           { ret_print("PARENTHESIS"); }
{BRACKET}               { ret_print("BRACKET"); }
[ \n\t\r\f]+            /*Eat up whitespace characters*/
.                       { yyerror("Unrecognized character"); }
%%

void ret_print(char *token_type){
  printf("<%s, %s>\n", token_type, yytext);
}

void yyerror(char *message){
  printf("%s: %s\n", message, yytext);
  exit(1);
}

int main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
  return 0;
}