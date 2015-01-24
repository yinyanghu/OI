{
	See "note.txt"
	Time Out 1 times, Calculate C^D, need Double Iteration
}
program Ural_1141(Input,Output);
type
	TIndex=Longint;

function Extended_GCD(A,B:TIndex;var x,y:TIndex):TIndex;
var
	t:TIndex;
begin
	if A<B then
	begin
		Result:=Extended_GCD(B,A,y,x);
		Exit;
	end;
	if B=0 then
	begin
		Result:=A;
		x:=1;
		y:=0;
	end
	else
	begin
		Result:=Extended_GCD(B,A mod B,x,y);
		t:=x;
		x:=y;
		y:=t-(A div B)*y;
	end;
end;
function Modular_Linear_Equation_Special(A,B,N:TIndex):TIndex;  //Special: gcd(A,N)=1
var
	D:TIndex;
	x,y:TIndex;
begin
	D:=Extended_GCD(A,N,x,y);
	//if B mod D<>0 then noanswer; //impossible noanswer , d=gcd(A,N)=1, so d|b
	Result:=((x*(B div D)) mod N+N) mod N;
end;
procedure Main;
var
	DataNum:TIndex;
	N:TIndex;
	C,M,P,Q,E,D:TIndex;
	i,S:TIndex;
begin
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		Readln(E,N,C);
		P:=0;
		Q:=0;
		for i:=2 to Trunc(Sqrt(N)) do
			if N mod i=0 then
			begin
				P:=i;
				Q:=N div i;
				Break;
			end;
		D:=Modular_Linear_Equation_Special(E,1,(P-1)*(Q-1));
		M:=1; 
		S:=C;
		while D>0 do
		begin
			if D mod 2=1 then M:=(M*S) mod N;
			D:=D div 2;
			S:=(S*S) mod N;
		end;
		Writeln(M);
	end;
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.