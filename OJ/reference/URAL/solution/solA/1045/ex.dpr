{
	Graph is tree.
	The nodes being chosen are still a tree after every choose.
	Let Win[] be Current Player who is choosing now can win.
		Border:Win[ Leaf of tree ] is false
		if exist one Win[ Node's child] = false at least then Win[Node]=true
}
program Ural_1045(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TEdge=record
		x,y:TIndex;
	end;
	TEdgeSet=array[1..MaxN*2]of TEdge;
	TRightSplit=array[0..MaxN]of TIndex;
	TWin=array[1..MaxN]of Boolean;
	TUsed=array[1..MaxN]of Boolean;
var
	N:TIndex;
	Root:TIndex;
	Edge:TEdgeSet;
	H:TRightSplit;
	Used:TUsed;
	Win:TWin;

procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TEdge;
begin
	i:=l;
	j:=r;
	Mid:=Edge[(i+j) div 2];
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
procedure DPTree(Node:TIndex);
var
	i:TIndex;
begin
	Used[Node]:=true;
	Win[Node]:=false;
	for i:=H[Node-1]+1 to H[Node] do
		with Edge[i] do
			if not Used[y] then
			begin
				DPTree(y);
				if not Win[y] then Win[Node]:=true;
			end;
end;
procedure Main;
var
	i,j:TIndex;
	Min:TIndex;
begin
	Readln(N,Root);
	for i:=1 to N-1 do
	begin
		Readln(Edge[i*2-1].x,Edge[i*2-1].y);
		Edge[i*2].x:=Edge[i*2-1].y;
		Edge[i*2].y:=Edge[i*2-1].x;
	end;
	//forward-star
	QuickSort(1,2*N-2);
	j:=0;
	H[0]:=0;
	for i:=1 to N do
	begin
		while (j+1<=2*N-2) and (Edge[j+1].x=i) do Inc(j);
		H[i]:=j;
	end;
	//Dp
	FillChar(Used,SizeOf(Used),0);
	DPTree(Root);
	//Print
	if not Win[Root] then 
		Writeln('First player loses')
	else
	begin
		Min:=N+1;
		for i:=H[Root-1]+1 to H[Root] do
			if (not Win[Edge[i].y])and (Edge[i].y<Min) then
				Min:=Edge[i].y;
		Writeln('First player wins flying to airport ',Min);
	end;
end;
begin
	Main;
end.