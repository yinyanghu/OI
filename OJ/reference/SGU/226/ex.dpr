{
	Author: Amber
	Method: BFS
	Clarity:
		Split a vertex (n) by three vertex (n,c) which means reaching n through last edge with color c.
		then BFS.
	Complexity: 3*O(N+M)
}
program SGU_226(Input,Output);
const
	MaxN=200;
	MaxM=Sqr(MaxN);
type
	TIndex=Longint;
	TVertex=record
		Node,Color:TIndex;
	end;
	TQueue=array[1..MaxN*3]of TVertex;
	TDistance=array[1..MaxN,1..3]of TIndex;
	TEdge=array[1..MaxM]of record
		PtrTo,Color,Prev:TIndex;
	end;
	TLast=array[1..MaxN]of TIndex;
var
	N,M:TIndex;
	Last:TLast;
	Edge:TEdge;
	Queue:TQueue;
	Dist:TDistance;
	
procedure Main;
var
	i:TIndex;
	x:TIndex;
	Pop,Push:TIndex;
	Cur:TVertex;
	Ptr:TIndex;
begin
	Readln(N,M);
	FillChar(Last,SizeOf(Last),0);
	for i:=1 to M do
	begin
		Readln(x,Edge[i].PtrTo,Edge[i].Color);
		Edge[i].Prev:=Last[x];
		Last[x]:=i;
	end;
	FillChar(Dist,SizeOf(Dist),255);
	for i:=1 to 3 do
	begin
		Dist[1,i]:=0;
		Queue[i].Node:=1;
		Queue[i].Color:=i;
	end;
	Pop:=1;
	Push:=4;
	while Pop<Push do
	begin
		Cur:=Queue[Pop];
		Inc(Pop);
		Ptr:=Last[Cur.Node];
		while Ptr>0 do
			with Edge[Ptr] do
			begin
				if (Dist[PtrTo,Color]=-1) and (Cur.Color<>Color) then
				begin
					Dist[PtrTo,Color]:=Dist[Cur.Node,Cur.Color]+1;
					if PtrTo=N then
					begin
						Writeln(Dist[PtrTo,Color]);
						Exit;
					end;
					Queue[Push].Node:=PtrTo;
					Queue[Push].Color:=Color;
					Inc(Push);
				end;
				Ptr:=Prev;
			end;
	end;
	Writeln(-1);
end;
begin
	Main;
end.