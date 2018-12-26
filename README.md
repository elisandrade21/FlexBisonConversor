# Flex/Bison Conversor de Temperaturas
O seguinte trabalho é resultado do projeto final da disciplina de Compiladores do curso de bacharelado em Ciência da Computação da UERN. Seu objetivo é fornecer um analisador de sintaxe e semântica para conversão de temperaturas.

# Inicializando o projeto 
- Instalação do FLEX

sudo apt-get install flex

- Instalação do BISON

sudo apt-get install bison

# Compilando os Arquivos 
flex conversor.l

bison -d conversor.y

g++ conversor.tab.c lex.yy.c -o conversor

# Execultanto o projeto
./conversor

# Casos de teste
O projeto trabalha com as escala celsius fahrenheit e kelvin, e não é case sensitive.
Para converter um valor de uma temperatura a outra devemos informar um valor seguido da letra correspondente a sua escala [C/c, F/f, K/k] seguido do operador desenvolvido neste trabalho (=>) que deve preceder a letra que representa a escala que o valor será convertido. Observar os exemplos abaixo.

- Exemplo 1
50 C => C
Saída: 50

- Exemplo 2
46 c => f
Saída: 114.8

- Exemplo 3
70 k => c
Saída: -203.15

# Cooperação entre LEX e YACC
Para obter um analisador sintático com o uso de Lex e Yacc é necessário:
- Criar a gramática lexical em Lex salvando um arquivo .l.
- Compilar o arquivo .l com o comando flex arquivo.l. Sua saída será um arquivo em C, denominado “lex.yy.c”.
- Criar a estrutura sintática da linguagem através da linguagem de especificação salvando em um arquivo .y.
- Compilar o analisador sintático em C através do seguinte comando: yacc -d <filename>.y. A chave <d> indica que um arquivo de itens léxicos e tipo de dados da variável global <yylval>, filename.tab.h, deve ser gerado. Este arquivo estabelece a dependência simbólica entre o analisador léxico e o sintático. 
- O arquivo que contém yyparse() é chamado <filename.tab.c>.
- Por último deve-se compilar e ligar os programas-fonte com outros programas adicionais através do comando: g++ nome.tab.c lexyy.c -o nome.
- Os indicadores <y> e <l> correspondem à inclusão de rotinas das bibliotecas em C <liby.a> e <libl.a>, respectivamente.

# Algumas Funções/Definições utilizadas no projeto
- yytext do tipo <char *>: O Lex armazena temporariamente a subseqüência de caracteres identificada nesta variável.
- sscanf(): Podemos, usar a essa função da biblioteca de C para yytext em outros tipos de dados.
- yylval: Variável reservada pelo Lex para armazenar o resultado da conversão sscanf().
- yylex(): Chama o analisador léxico gerado pelo Lex, que retorna o identificador de um item léxico reconhecido.
- yyparse( ): Analisa os itens léxicos e decide se eles formam ou não uma sentença válida.
- yywrap(): Precisa disso para evitar problema de link.
- yymore (): Informa ao scanner que na próxima vez que corresponder a uma regra, o token correspondente deve ser anexado ao valor atual de yytext em vez de substituí-lo. A presença do yymore na ação do scanner acarreta uma pequena penalidade de desempenho na velocidade de correspondência do scanner.
- yyterminate(): Pode ser usado no lugar de uma declaração de retorno em uma ação. Ele finaliza o scanner e retorna 0 para o chamador do scanner, indicando "tudo pronto". Por padrão, o yyterminate também é chamado quando um fim de arquivo é encontrado. É uma macro e pode ser redefinida.
- yyless(n): Retorna todos os primeiros n caracteres do token atual, exceto os primeiros n, de volta ao fluxo de entrada, onde eles serão verificados novamente quando o scanner procurar a próxima correspondência. 
- input(): Lê o próximo caractere do fluxo de entrada. 
- unput(): Coloca o caractere c de volta no fluxo de entrada. Será o próximo personagem digitalizado. A ação a seguir pegará o token atual e fará com que ele seja redigitalizado entre parênteses.
- ECHO: copia yytext para a saída do scanner.
- BEGIN: seguido pelo nome de uma condição inicial coloca o scanner na condição inicial correspondente (veja abaixo).
- REJECT: Direciona o scanner para prosseguir para a "segunda melhor" regra que corresponde a entrada (ou um prefixo da entrada).
