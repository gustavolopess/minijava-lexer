package atividade1;
import java_cup.runtime.*;

%%

%{

private int printToken(String name, String value) {
	System.out.printf("<%s, %s> (%d - %d)\n", name, value, yyline, yycolumn);
	return 0;
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

/* Insira as regras l�xicas abaixo */

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

{whitespace} { return printToken("whitespace", ""); }
{lineComment} { return printToken("line comment", yytext()); }
{blockComment} { return printToken("block comment", ""); }
{resWord} { return printToken("reserved word", yytext()); }
{operators} { return printToken("operator", yytext()); }
{delimiters} { return printToken("delimiter", yytext()); }
{identifier} { return printToken("identifier", yytext()); }
{intLiterals} { return printToken("integer literal", yytext()); }


    
/* Insira as regras l�xicas no espa�o acima */     
     
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
