{
Solution 1:
	F(n,h) is the amount of the state with n blocks, which the blocks in the last column aren't more than h.
	F(n,h)=F(n,h-1)+F(n-h,h-1) 
	There is two selections for f(n,h).
	One is substate f(n,h-1) which the blocks in last column aren't more than h-1.
	The other is substate f(n-h,h-1) and the blocks in last column in current state is h.

	Notice that f(...,h) is based on f(...,h-1)
	So we can use the scroll-array skill.
	But notice f(n,...) is based on f(n-h,...), here n>n-h
	So we can use Iterating f(n).
	f(n)+=f(n-h) for each h in increasing and for each n in decreasing because of n>n-h.
Solution 2:
	Create generating function G(x)=(1+x)(1+x^2)(1+x^3)...(1+x^n).
	The answer is the coefficient of x^n.
	
	F is a multinomial.
	Consider the multinomial multiplication as G=F*(1+x^i)
	  f(0) f(1) ... f(i) f(i+1)... f(n)
	+)              f(0) f(1)... f(n-i)
	-----------------------------------
	  g(0) g(1) ... g(i) g(i+1)    g(n)
---------------------------------------------------------------------------------------
notice the program for solution 1 and soluion 2 is identical.
}
program Ural_1017(Input,Output);
const
	MaxN=500;
type
	TIndex=Longint;
	TDP=array[0..MaxN]of Int64;
var
	N:TIndex;
	F:TDP;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(N);
	FillChar(F,SizeOf(F),0);
	F[0]:=1;
	for i:=1 to N do
		for j:=N downto i do
			Inc(F[j],F[j-i]);
	Writeln(F[N]-1);
end;
begin
	Main;
end.