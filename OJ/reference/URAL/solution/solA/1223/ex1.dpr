(*
 scrool-array skill. memory is O(n)
 f(m,n) devotes the least times using m eggs in height n.
 f(1,n)=n
 f(m,0)=0
 f(m,n)=min{max{f(m-1,w-1),f(m,n-w)}|1<=w<=n}+1
 the amount of the states is O(n^2).
 but when m>=ceil(log(n+1)), f(m,n)=ceil(log(n+1))
 so the amount of the states is O(nlogn).
 algorithm complexity is O(n^2logn)
*)
program Ural_1223(Input,Output);
const
	MaxN=1000;
	MaxM=10; //Log(MaxN)
	MaxValue=MaxLongint;
type
	TIndex=Longint;
	TDP=array[0..1]of array[0..MaxN]of TIndex;
var
	N,M:TIndex;
	F:TDP;

function Log2(x:TIndex):TIndex;
begin
	Result:=Trunc(Ln(x)/Ln(2));
	while 1 shl Result<x do Inc(Result);
end;
function Max(A,B:TIndex):TIndex;
begin
	if A>B then Result:=A
	else Result:=B;
end;
procedure Main;
var
	i,j,k:TIndex;
	Tmp:TIndex;
	Now,Old:TIndex;
begin
	while true do
	begin
		Read(M);
		if M=0 then Break;
		Readln(N);
		if M>=MaxM then
		begin
			Writeln(Log2(N+1));
			Continue;
		end;
		if 1 shl M>=N+1 then
		begin
			Writeln(Log2(N+1));
			Continue;
		end;
		FillChar(F,SizeOf(F),0);
		Now:=0;
		for j:=0 to N do 
			F[Now][j]:=j;
		for i:=2 to M do
		begin
			Old:=Now;
			Now:=1-Now;
			F[Now][0]:=0;
			for j:=1 to N do 
			begin
				F[Now][j]:=MaxValue;
				for k:=1 to j do
				begin
					Tmp:=Max(F[Old][k-1],F[Now][j-k])+1;
					if Tmp<F[Now][j] then F[Now][j]:=Tmp;
				end;
			end;
		end;
		Writeln(F[Now][N]);
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