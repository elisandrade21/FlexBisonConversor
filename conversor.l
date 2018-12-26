%{
   #include <iostream>
   #include "conversor.tab.h"
   using namespace std;
%}
%option noyywrap
%%
 
\t      ;
[0-9]+\.?[0-9]* { yylval.fval = atof(yytext);
          return NUM;
        }
c|C     { return CELSIUS; }
f|F     { return FAHRENHEIT; }
k|K     { return KELVIN; }
=>      { return CONVERSION; }
%%
