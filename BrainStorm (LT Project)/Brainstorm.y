%{
#include<stdio.h> 
#include<math.h>
extern FILE *yyin;
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
%type <real> S E T U F
%type <integer> Q
%%
//ResultExpression:S{printf("Your Answer is %f",$$);};
S: help me to find E{$$=$5;};
E: squareroot of NUMBER  {$$=sqrt($3); printf("Squareroot of %d is %f\n",$3,$$);}
   |area of T             {$$=$3;}
   |volume of U           {$$=$3;}
   |root of Q 			  {$$=$3;}
   ;
T: circle having radius NUMBER   {$$=PI*$4*$4;printf("Area of circle having radius %d is %f\n",$4,$$);}
  |square having length NUMBER   {$$=$4*$4;printf("Area of square having length %d is %f\n",$4,$$);}
  ;
U: sphere having radius NUMBER   {$$=(4*PI*$4*$4*$4)/3;printf("Volume of sphere having radius %d is %f\n",$4,$$);}
  |cone having F                 {$$=$3;}      
   ;
F: radius NUMBER and height NUMBER   {$$=(PI*$2*$2*$5)/3; printf("Volume of cone having radius %d and height %d is %f\n",$2,$5,$$);};
Q: quadr eq having avalue NUMBER bvalue NUMBER and cvalue NUMBER { $$=sqrt(($7*$7)-4*$5*$10);
																	if(($$)<0){printf("Oops you can't find the root having Delta value less than zero");}
																   else{	
																	$$=((-1)*$7 + sqrt(($7*$7)-4*$5*$10))/2*$5;
																	printf("Root of Equation %dx^2+%dx+%d is %d\n",$5,$7,$10,$$);
																	$$=((-1)*$7 - sqrt(($7*$7)-4*$5*$10))/2*$5;
																	printf("Root of Equation %dx^2+%dx+%d is %d\n",$5,$7,$10,$$);
																	}
																	};
%%
void yyerror(char *s){}
int main(int argc, char *argv[]) 
{
yyin=fopen(argv[1],"r");
int i;
for(i=1;i<=6;i++){
yyparse();
}
fclose(yyin);
return 0;
}