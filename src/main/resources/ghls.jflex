package atividade1;
import java_cup.runtime.*;

%%

%{

private void printToken(String name, String value) {
	System.out.printf("<%s, %s> (%d - %d)\n", name, value, yyline, yycolumn);
}

%}

%line
%column
%unicode
//%debug
%public
%standalone
%class Minijava
%eofclose

/* Insira as regras lexicas abaixo */

newline = (\n|\r\n)
whitespace = ([\s|\t|\r|\f]|{newline})
lineComment = "//".*?{newline}
blockComment = "/*".*"*/"
resWord = ("boolean"|"class"|"public"|"extends"|"static"|"void"|"main"|"String"|"int"|"while"|"if"|"else"|"return"|"length"|"true"|"false"|"this"|"new"|"System.out.println")
operators = ("&&"|"<"|"=="|"!="|"+"|"*"|"!"|"-")
delimiters  = (";"|"."|","|"="|"("|")"|"\{"|"}"|"["|"]")
identifier = [_\w][_\w\d]*
intLiterals = [1-9][0-9]*



%%

{whitespace} { printToken("whitespace", ""); }
{lineComment} { printToken("line comment", yytext()); }
{blockComment} { printToken("block comment", ""); }
{resWord} { printToken("reserved word", yytext()); }
{operators} { printToken("operator", yytext()); }
{delimiters} { printToken("delimiter", yytext()); }
{identifier} { printToken("identifier", yytext()); }
{intLiterals} { printToken("integer literal", yytext()); }


    
/* Insira as regras l�xicas no espa�o acima */     
     
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
