%{
#include<stdio.h> 
#include<math.h>
#define PI 3.14
#define CONST 1.33
#define CONST1 0.33
%} 
%union{
int integer;
float real;
}
%token <integer> NUMBER <real>	FLOAT
%token help me to find squareroot area volume of circle square sphere cone having radius length height and avalue bvalue cvalue quadr eq root 
%type <real> ResultExpression S E T U F Q
%%
ResultExpression:S{printf("Your Answer is %f",$$);};
S: help me to find E{$$=$5;};
E: squareroot of NUMBER  {$$=sqrt($3);}
   |area of T             {$$=$3;}
   |volume of U           {$$=$3;}
   |root of Q 			  {$$=$3;}
   ;
T: circle having radius NUMBER   {$$=PI*$4*$4;}
  |square having length NUMBER   {$$=$4*$4;}
  ;
U: sphere having radius NUMBER   {$$=CONST*PI*$4*$4*$4;}
  |cone having F                 {$$=$3;}      
   ;
F: radius NUMBER and height NUMBER   {$$=CONST1*PI*$2*$2*$5;};
Q: quadr eq having avalue NUMBER bvalue NUMBER and cvalue NUMBER {$$=((-1)*$7 + sqrt(($7*$7)-4*$5*$10))/2*$5;};
%%
void yyerror(char *s){}
void main() 
{
int i;
for(i=1;i<=6;i++){
yyparse();
}
}