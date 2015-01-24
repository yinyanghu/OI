{
	X is Answer.
	Set Cn that Cn*2^n=Xn
	
	C(n+1)*2^(n+1)
	=X(n+1)
	=Xn+10^n*k, Here k is 1 or 2, namely the first digit of X(n+1)
	=Cn*2^n+10^n*k
	=>
	2*C(n+1)=Cn+5^n*k
	if Cn is Odd then k=1
	else k=2
}
program Ural_1407(Input,Output);
const
	MaxN=100;
	MaxLen=MaxN;
type
	TIndex=Longint;
	THP=record
		Len:TIndex;
		D:array[1..MaxLen]of Longint;
	end;
	TCoefficient=array[Boolean]of THP;
	TAnswer=array[1..MaxN]of Byte;
var
	N:TIndex;
	Pow:THP;
	Ans:TAnswer;
	Coef:TCoefficient;

procedure Mul5(var A:THP); //Res=A*5
var
	i:TIndex;
	R:TIndex;
begin
	i:=1;
	R:=0;
	while (i<=A.Len) or (R>0) do
	begin
		if i<=A.Len then A.D[i]:=A.D[i]*5;
		Inc(A.D[i],R);
		R:=A.D[i] div 10;
		A.D[i]:=A.D[i] mod 10;
		Inc(i);
	end;
	if i-1>A.Len then A.Len:=i-1;
end;
function Add(A,B:THP):THP;
var
	i:TIndex;
	R:TIndex;
begin
	FillChar(Result,SizeOf(Result),0);
	i:=1;
	R:=0;
	while (i<=A.Len) or (i<=B.Len) or (R>0) do
	begin
		if i<=A.Len then Inc(Result.D[i],A.D[i]);
		if i<=B.Len then Inc(Result.D[i],B.D[i]);
		Inc(Result.D[i],R);
		R:=Result.D[i] div 10;
		Result.D[i]:=Result.D[i] mod 10;
		Inc(i);
	end;
	Result.Len:=i-1;
end;
function Div2(A:THP):THP; //Res=A div 2
var
	i:TIndex;
	R:TIndex;
begin
	R:=0;
	for i:=A.Len downto 1 do
	begin
		R:=R*10+A.D[i];
		A.D[i]:=R div 2;
		R:=R mod 2;
	end;
	while (A.D[A.Len]=0) and (A.Len>1) do Dec(A.Len);
	Result:=A;
end;
procedure Main;
var
	i:TIndex;
begin
	//Init
	Ans[1]:=2;
	FillChar(Pow,SizeOf(Pow),0);
	Pow.D[1]:=5;
	Pow.Len:=1;
	FillChar(Coef,SizeOf(Coef),0);
	Coef[Odd(1)].D[1]:=1;
	Coef[Odd(1)].Len:=1;
	Readln(N);
	//Main
	for i:=2 to N do
	begin
		if Odd(Coef[Odd(i-1)].D[1]) then 
		begin
			Ans[i]:=1;
			Coef[Odd(i)]:=Div2(Add(Coef[Odd(i-1)],Pow));
		end
		else
		begin
			Ans[i]:=2;
			Coef[Odd(i)]:=Add(Div2(Coef[Odd(i-1)]),Pow);
		end;
		Mul5(Pow);
	end;
	//Print
	for i:=N downto 1 do
		Write(Ans[i]);
	Writeln;
end;
begin
	Main;
end.