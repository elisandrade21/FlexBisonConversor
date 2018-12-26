# FlexBisonConversor


Inicializando o projeto 
- Instalação do FLEX
sudo apt-get install flex

- Instalação do BISON

sudo apt-get install bison

Compilando os Arquivos 
flex conversor.l

bison -d conversor.y

g++ conversor.tab.c lex.yy.c -o conversor

./conversor
