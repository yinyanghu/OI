{
	Author: Amber
	Method: Math+Enumerate
	Clarity:
		when n=1, if v mod c[1]=0 then ans=v div c[1] else no answer.
		when n=2, solve (c[1],c[2],v)
			Let gcd(c[1],c[2])=d
			Find all solution of c[1]*x+c[2]*y=v :
			x=x0+t*c[2]/d
			y=y0-t*c[1]/d

			Cuz x>=0, y>=0, the range of t can be got.
			Discuss c[1]>c[2] and c[1]<=c[2], and minimize x+y=x0+y0+t*(c[2]-c[1])/d.

		when n=3, enumerate x[1]. Solving (c[2],c[3],v-x[1]*c[1]) is the same as that when n=2.
		
	Notice:
		Number must be Int64.
		e.g. X:=X*C; that 10^6*10^6=10^12!!!
}
program SGU_248(Input,Output);
const
	MaxN=3;
	MaxValue=MaxLongint div 8;
type
	TIndex=Longint;
	TNumber=Int64;
	TCoff=array[1..MaxN]of TNumber;
var
	N:TIndex;
	C:TCoff;
	V:TIndex;
	
function Extended_GCD(A,B:TNumber;var X,Y:TNumber):TNumber;
begin
	if A<B then
		Result:=Extended_GCD(B,A,Y,X)
	else if B=0 then
	begin
		Result:=A;
		X:=1;
		Y:=0;
	end
	else
	begin
		Result:=Extended_GCD(B,A mod B,Y,X);
		Dec(Y,A div B*X);
	end;
end;
function IntDiv(A,B:TNumber;Ceil:Boolean):TNumber;
begin
	if A>=0 then 
		Result:=A div B+Ord(A mod B<>0)*Ord(Ceil)
	else 
		Result:=A div B-Ord(A mod B<>0)*Ord(not Ceil);
end;
function Solve(A,B,C:TNumber):TNumber;
var
	D:TNumber;
	X,Y:TNumber;
	Left,Right:TNumber;
begin
	if C=0 then 
	begin
		Result:=0;
		Exit;
	end;
	Result:=MaxValue;
	D:=Extended_GCD(A,B,X,Y);
	if C mod D>0 then Exit;
	A:=A div D;
	B:=B div D;
	C:=C div D;
	X:=X*C;
	Y:=Y*C;
	Left:=IntDiv(-Y,A,true);
	Right:=IntDiv(X,B,false);
	if Left>Right then Exit;
	if A-B>0 then Result:=X+Y+Left*(A-B)
	else Result:=X+Y+Right*(A-B);
end;
procedure Swap(var A,B:TNumber);
var
	T:TIndex;
begin
	T:=A;
	A:=B;
	B:=T;
end;
procedure Main;
var
	i:TIndex;
	Min,Cur:TNumber;
begin
	Read(N);
	for i:=1 to N do
		Read(C[i]);
	Read(V);
	Min:=MaxValue;
	case N of 
		1: if V mod C[1]=0 then Min:=V div C[1];
		2: Min:=Solve(C[1],C[2],V);
		3:
		begin
			if C[1]<C[2] then Swap(C[1],C[2]);
			if C[1]<C[3] then Swap(C[1],C[3]);
			for i:=0 to V div C[1] do
			begin
				Cur:=Solve(C[2],C[3],V-i*C[1])+i;
				if Cur<Min then Min:=Cur;
			end;
		end;
	end;
	if Min<MaxValue then
		Writeln(Min)
	else
		Writeln(-1);
end;
begin
	Main;
end.