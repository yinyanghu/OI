{
	Author: Amber
	Method: Math
	Clarity:
		Problem is
		given Q and to find N s.t. ...+[N/5^4]+[N/5^3]+[N/5^2]+[N/5]=Q -(*)
		Let N=5X, write X in 5-base: 
			X=...+ 5^3*x3 + 5^2*x2 + 5*x1 + x0, xi=0..4
			X into (*) => Q=... + (5^3+5^2+5+1)*x3 + (5^2+5+1)*x2 + (5+1)*x1 + x0
		Let sum(i)=sum(pow(j)|j<=i)
		Algorithm is known: 
		for each i from high to low digit
			1.xi=Q div sum(i)
			2.if xi>4 then no answer
			3.Q=Q mod sum(i)
	Notice
		When Q=0,output 1 (not 0).
}
program SGU_154(Input, Output);
const 
	MaxPow=11;
type
	TIndex=LongWord;
	TData=array[0..MaxPow]of TIndex;
var
	Pow,Sum:TData;
procedure Main;
var
	i:TIndex;
	X,Ans,Digit:TIndex;
begin
	//Precalcuate
	Pow[0]:=1;
	Sum[0]:=1;
	for i:=1 to MaxPow do
	begin
		Pow[i]:=Pow[i-1]*5;
		Sum[i]:=Sum[i-1]+Pow[i];
	end;
	
	Readln(X);
	if X=0 then //Here, WA N times.
	begin
		Writeln(1);
		Exit;
	end;
	Ans:=0;
	for i:=MaxPow downto 0 do
	begin
		Digit:=X div Sum[i];
		if Digit>4 then 
		begin
			Writeln('No solution');
			Exit;
		end;
		Inc(Ans,Digit*Pow[i]);
		X:=X mod Sum[i];
	end;
	Writeln(Ans*5);
end;
begin
	Main;
end.