
%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {
		yylval.integer=atoi(yytext);
		return NUMBER;
		}
[0-9]*\.[0-9]+ {
		yylval.real=(float)atof(yytext); 
		return FLOAT;
		}
help   {return help;}
me   {return me;}
to   {return to;}
find   {return find;}
squareroot   {return squareroot;}
of   {return of;}
area		{return area;}
circle		{return circle;}
square	{return square;}
having		{return having;}
radius		{return radius;}
length      {return length;}
sphere		{return sphere;}
cone		{return cone;}
and			{return and;}
height	    {return height;}
volume      {return volume;}
root        {return root;}
avalue			{return avalue;}
bvalue		    {return bvalue;}
cvalue           {return cvalue;}
quadr        {return quadr;}
eq          {return eq;}
[\n]	{return yytext;}
[/t]	;
%%
int yywrap(){return 1;}
