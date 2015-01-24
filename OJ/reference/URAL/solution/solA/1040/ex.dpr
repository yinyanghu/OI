{
	可以证明：给边标DFS序即可.
}
program Ural_1040(Input,Output);
const
	MaxN=50;
	MaxM=MaxN*MaxN div 2;
type
	TIndex=Longint;
	TEdge=record
		x,y:TIndex;
		Index:TIndex;
	end;
	TEdgeSet=array[1..MaxM*2]of TEdge;
	TRightSplit=array[0..MaxN]of TIndex;
	TCount=array[1..MaxM]of TIndex;
	TCheck=array[1..MaxN]of Boolean;
var
	N,M:TIndex;
	CurM:TIndex;
	Edge:TEdgeSet;
	H:TRightSplit;
	EdgeIndex:TCount;
	Check:TCheck;

procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TEdge;
begin
	i:=l;
	j:=r;
	Mid:=Edge[(i+j)div 2];
	repeat
		while Edge[i].x<Mid.x do Inc(i);
		while Edge[j].x>Mid.x do Dec(j);
		if i<=j then
		begin
			Tmp:=Edge[i];
			Edge[i]:=Edge[j];
			Edge[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure DFS(x:TIndex);
var
	i:TIndex;
begin
	Check[x]:=true;
	for i:=H[x-1]+1 to H[x] do
		if EdgeIndex[Edge[i].Index]=0 then 
		begin
			Inc(CurM);
			EdgeIndex[Edge[i].Index]:=CurM;
			if not Check[Edge[i].y] then DFS(Edge[i].y);
		end;
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(N,M);
	for i:=1 to M do
	begin
		Readln(Edge[i*2-1].x,Edge[i*2-1].y);
		Edge[i*2-1].Index:=i;
		Edge[i*2].x:=Edge[i*2-1].y;
		Edge[i*2].y:=Edge[i*2-1].x;
		Edge[i*2].Index:=i;
	end;
	QuickSort(1,M*2);
	j:=0;
	H[0]:=0;
	for i:=1 to N do
	begin
		while (j+1<=M*2) and (Edge[j+1].x=i) do Inc(j);
		H[i]:=j;
	end;
	FillChar(Check,SizeOf(Check),0);
	FillChar(EdgeIndex,SizeOf(EdgeIndex),0);
	CurM:=0;
	for i:=1 to N do
		if not Check[i] then
			DFS(i);
	Writeln('YES');
	for i:=1 to M do
		Write(EdgeIndex[i],' ');
	Writeln;
end;
begin
	Assign(Input, 'i.txt');
	Reset(Input);
	Assign(Output, 'o.txt');
	Rewrite(Output);
	Main;
	Close(Input);
	Close(Output);
end.