package atividade1;

%%


%line
%column
%unicode
//%debug
%public
%standalone
%class Minijava
%eofclose

/* Insira as regras l�xicas abaixo */


whitespace = [\s|\n|\t|\r|\f]
lineComment = "//"
blockComment = (?m)^/\*.*\*/
resWord = ("boolean"|"class"|"public"|"extends"|"static"|"void"|"main"|"String"|"int"|"while"|"if"|"else"|"return"|"length"|"true"|"false"|"this"|"new"|"System.out.println")
operators = ("&&"|"<"|"=="|"!="|"+"|"*"|"!")
delimiters  = (";"|"."|","|"="|"("|")"|"{"|"}"|"["|"]")
identifier = [_\w][_\w\d]*
intLiterals = [1-9][0-9]*



%


    
/* Insira as regras l�xicas no espa�o acima */     
     
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
