{
	DP

	F(n)=Sum(1<=i<=n)[F(n-i)*C(n,i)]
	variable (i-1) is amount of "="s which will be added after [f(n-i)],
	so we should choose i operand in blank between both adjoined "=".
	i.e. form [f(n-i)]<a1=a2=...=ai , here [f(n-i)] is the physics sense of f(n-i).
}
program Ural_1142(Input,Output);
const
	MaxN=10;
type
	TIndex=Longint;
	TDP=array[0..MaxN]of TIndex;
var
	F:TDP;

function Combine(N,R:TIndex):TIndex;
var
	i:TIndex;
begin
	Result:=1;
	for i:=1 to R do
		Result:=Result*(N-i+1) div i;
end;
procedure Precompute;
var
	i,j:TIndex;
begin
	F[0]:=1;
	for i:=1 to MaxN do
	begin
		F[i]:=0;
		for j:=1 to i do
			F[i]:=F[i]+F[i-j]*Combine(i,j);
	end;
end;
procedure Main;
var
	N:TIndex;
begin
	while true do
	begin
		Readln(N);
		if N=-1 then Break;
		Writeln(F[N]);
	end;
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Precompute;
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.
