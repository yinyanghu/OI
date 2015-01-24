{
	次小生成树
	O(n^2) Prim for MST
	O(n^2) Enumerate which edge is inserted by DFS.
}
program Ural_1416(Input,Output);
const
	MaxN=500;
	MaxM=MaxN*MaxN div 2;
	MaxValue=1 shl 14;
type
	TIndex=Longint;
	TUsed=array[1..MaxN]of Boolean;
	TGraph=array[1..MaxN,1..MaxN]of SmallInt;
	TDist=array[1..MaxN]of SmallInt;
	TPred=array[1..MaxN]of TIndex;
	TLast=array[1..MaxN]of TIndex;
	TEdgeSet=array[1..MaxN*2]of record
		PtrTo,Prev:TIndex;
	end;
var
	N,M:TIndex;
	G:TGraph;
	Last:TLast;
	Edge:TEdgeSet;
	Used:TUsed;
	Pred:TPred;
	Dist:TDist;
	Cost,Delta:TIndex;
	Root:TIndex;

function Max(A,B:TIndex):TIndex;
begin
	if A>B then Result:=A
	else Result:=B;
end;
procedure DFS(Node:TIndex;Father:TIndex;MaxEdge:TIndex);
var
	Ptr:TIndex;
begin
	Used[Node]:=true;
	if (Father<>Root) and (Node<>Root) and (G[Root,Node]<MaxValue)
		and (G[Root,Node]-MaxEdge<Delta) then
		Delta:=G[Root,Node]-MaxEdge;
	Ptr:=Last[Node];
	while Ptr>0 do
	begin
		with Edge[Ptr] do
			if not Used[PtrTo] then
				DFS(PtrTo,Node,Max(MaxEdge,G[Node,PtrTo]));
		Ptr:=Edge[Ptr].Prev;
	end;
end;
procedure InsertEdge(i,j:TIndex);
begin
	Inc(M);
	Edge[M].PtrTo:=j;
	Edge[M].Prev:=Last[i];
	Last[i]:=M;
	Inc(M);
	Edge[M].PtrTo:=i;
	Edge[M].Prev:=Last[j];
	Last[j]:=M;
end;
procedure Main;
var
	i,j:TIndex;
	Min:TIndex;
	MinInd:TIndex;
	Weight:TIndex;
begin
	Readln(N,M);
	for i:=1 to N do
		for j:=1 to N do
			G[i,j]:=MaxValue;
	while M>0 do
	begin
		Dec(M);
		Readln(i,j,Weight);
		G[i,j]:=Weight;
		G[j,i]:=Weight;
	end;

	Cost:=0;
	M:=0;
	for i:=1 to N do
	begin
		Last[i]:=0;
		Used[i]:=false;
		Dist[i]:=MaxValue;
	end;
	Dist[1]:=0;
	for i:=1 to N do
	begin
		Min:=MaxValue;
		MinInd:=0;
		for j:=1 to N do
			if not Used[j] and (Dist[j]<Min) then
			begin
				Min:=Dist[j];
				MinInd:=j;
			end;
		if MinInd=0 then
		begin
			Writeln('Cost: -1');
			Writeln('Cost: -1');
			Exit;
		end;
		Used[MinInd]:=true;
		Inc(Cost,Min);
		if MinInd>1 then InsertEdge(Pred[MinInd],MinInd);
		for j:=1 to N do
			if not Used[j] and (Dist[j]>G[MinInd,j]) then
			begin
				Dist[j]:=G[MinInd,j];
				Pred[j]:=MinInd;
			end;
	end;
	Writeln('Cost: ',Cost);

	Delta:=MaxValue;
	for i:=1 to N do
	begin
		FillChar(Used,SizeOf(Used),0);
		Root:=i;
		DFS(i,0,-MaxValue);
	end;
	if Delta=MaxValue then
		Writeln('Cost: -1')
	else
		Writeln('Cost: ',Cost+Delta);
end;
begin
	Main;
end.