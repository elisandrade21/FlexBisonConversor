%{
   #include <cstdio>
   #include <iostream>
   using namespace std;
 
   extern int yylex();
   extern int yyparse();
   extern FILE* yyin;
   void yyerror(const char* s);
%}
 
%union {
   float fval;
}
 
%token NEWLINE
%token CONVERSION
%token CELSIUS
%token FAHRENHEIT
%token KELVIN
%token <fval> NUM
%start conversor

%%

conversor:
	| conversor EXPRESSION

;

EXPRESSION: NUM CELSIUS CONVERSION FAHRENHEIT {
    cout<<$1*1.8+32<<endl;
}
 
| NUM CELSIUS CONVERSION KELVIN {
    cout<<$1+273.15<<endl;
}
 
| NUM CELSIUS CONVERSION CELSIUS {
    cout<<$1<<endl;
}
 
| NUM FAHRENHEIT CONVERSION CELSIUS {
    cout<<($1-32)/1.8<<endl;
}
 
| NUM FAHRENHEIT CONVERSION KELVIN {
    cout<<($1-32)/1.8+273.15<<endl;
}
 
| NUM FAHRENHEIT CONVERSION FAHRENHEIT {
    cout<<$1<<endl;
}
 
| NUM KELVIN CONVERSION CELSIUS {
    cout<<$1-273.15<<endl;
}
 
| NUM KELVIN CONVERSION FAHRENHEIT {
    cout<<($1-273.15)*1.8+32<<endl;
}
 
| NUM KELVIN CONVERSION KELVIN {
    cout<<$1<<endl;
}
 
%%
 
int main(int, char**){
    yyin = stdin;
    yyparse();
    return 0;
}
 
void yyerror(const char* s){
    fprintf(stderr, "Erro: %s\n", s);
}
