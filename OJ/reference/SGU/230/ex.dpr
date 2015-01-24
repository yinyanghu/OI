{
	Author: Amber
	Method: Topological Sort
	Clarity:
		The problem is to find any of solutions which can not conflict with the inequality.
		Sort it by topological order by a queue.
	Complexity: O(N+M)
}
program SGU_230(Input,Output);
const
	MaxN=100;
	MaxM=10000;
type
	TIndex=Longint;
	TDegree=array[1..MaxN]of TIndex;
	TLast=array[1..MaxN]of TIndex;
	TEdge=array[1..MaxM]of record
		PtrTo,Prev:TIndex;
	end;
	TQueue=array[1..MaxN]of TIndex;
	TWeight=array[1..MaxN]of TIndex;
var
	N,M:TIndex;
	Degree:TDegree;
	Last:TLast;
	Edge:TEdge;
	Pop,Push:TIndex;
	Queue:TQueue;
	Weight:TWeight;
procedure Main;
var
	i:TIndex;
	x,y:TIndex;
	Ptr:TIndex;
begin
	Readln(N,M);
	FillChar(Last,SizeOf(Last),0);
	FillChar(Degree,SizeOf(Degree),0);
	for i:=1 to M do
	begin
		Readln(x,y);
		Inc(Degree[y]);
		Edge[i].PtrTo:=y;
		Edge[i].Prev:=Last[x];
		Last[x]:=i;
	end;
	Pop:=0;
	Push:=0;
	for i:=1 to N do
		if Degree[i]=0 then
		begin
			Inc(Push);
			Queue[Push]:=i;
		end;
	while Pop<Push do
	begin
		Inc(Pop); 
		x:=Queue[Pop];
		Ptr:=Last[x];
		while Ptr>0 do
		begin
			y:=Edge[Ptr].PtrTo;
			Dec(Degree[y]);
			if Degree[y]=0 then
			begin
				Inc(Push);
				Queue[Push]:=y;
			end;
			Ptr:=Edge[Ptr].Prev;
		end;
	end;
	if Push<N then 
	begin
		Writeln('No solution');
		Exit;
	end;
	for i:=1 to N do
		Weight[Queue[i]]:=i;
	for i:=1 to N-1 do
		Write(Weight[i],' ');
	Writeln(Weight[N]);
end;
begin
	Main;
end.