{
	algorithm complexity : O(xM), here x is the answer, O(xM)=O(N^0.5).
	
	G[x,i] denotes the highest level can be caught in x times using i eggs in worst case.
	G[x,1]=x
	G[1,i]=1
	G[x,i]=G[x-1,i-1]+G[x-1,i]+1
	find x s.t. G[x-1,M]<N and G[x,M]>=N
	x is the answer.
}
program Ural_1223(Input,Output);
const 
	MaxN=1000;
	MaxM=10;//log(MaxN)
	MaxTimes=50;
type
	TIndex=Longint;
	TDP=array[1..MaxTimes,1..MaxM]of TIndex;
var
	N,M:TIndex;
	G:TDP;
function Log2(x:TIndex):TIndex;
begin
	Result:=0;
	while 1 shl Result<x do Inc(Result);
end;
procedure Main;
var
	i,x:TIndex;
begin
	while true do
	begin
		Read(M);
		if M=0 then Break;
		Readln(N);
		if M=1 then 
		begin
			Writeln(N);
			Continue;
		end;
		if M>=MaxM then  //2^M may be overflow.
		begin
			Writeln(Log2(N+1));
			Continue;
		end;
		if 1 shl M>=N+1 then 
		begin
			Writeln(Log2(N+1));
			Continue;
		end;

		for i:=1 to M do G[1,i]:=1;
		x:=1;
		repeat
			Inc(x);
			G[x,1]:=x;
			for i:=2 to M do G[x,i]:=G[x-1,i-1]+G[x-1,i]+1;
		until (G[x-1,M]<N) and (G[x,M]>=N);
		Writeln(x);
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