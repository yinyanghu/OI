program Ural_1371(Input,Output);
const
	MaxN=50000;
	MaxM=MaxN*2;
type
	TIndex=Longint;
	TData=Int64;
	TUsed=array[1..MaxN]of Boolean;
	TLast=array[1..MaxN]of TIndex;
	TEdge=array[1..MaxM]of record
		PtrTo,Weight:TIndex;
		Prev:TIndex;
	end;
	TNode=array[1..MaxN]of record
		Father,ChildNum:TIndex;
		ToFather:TIndex;
		DistSum:TData;
	end;
	TQueue=array[1..MaxN]of TIndex;
var
	N:TIndex;
	Used:TUsed;
	Last:TLast;
	Edge:TEdge;
	Node:TNode;
	Total:TData;
	Queue:TQueue;

procedure Main;
var
	i:TIndex;
	x,y,w:TIndex;
	Ptr:TIndex;
	Pop,Push:TIndex;
begin
	Readln(N);
	if N=1 then
	begin
		Writeln('0.0000');
		Exit;
	end;

	FillChar(Last,SizeOf(Last),0);
	for i:=1 to N-1 do
	begin
		Readln(x,y,w);

		Edge[i*2-1].PtrTo:=y;
		Edge[i*2-1].Weight:=w;
		Edge[i*2-1].Prev:=Last[x];
		Last[x]:=i*2-1;

		Edge[i*2].PtrTo:=x;
		Edge[i*2].Weight:=w;
		Edge[i*2].Prev:=Last[y];
		Last[y]:=i*2;
	end;

	//BFS
	FillChar(Used,SizeOf(Used),0);
	FillChar(Node,SizeOf(Node),0);
	Pop:=1;
	Push:=2;
	Queue[1]:=1;
	Used[1]:=true;
	while Pop<Push do
	begin
		Ptr:=Last[Queue[Pop]];
		while Ptr>0 do
		begin
			with Edge[Ptr] do
				if not Used[PtrTo] then
				begin
					Used[PtrTo]:=true;
					Queue[Push]:=PtrTo;
					Node[PtrTo].Father:=Queue[Pop];
					Node[PtrTo].ToFather:=Weight;
					Inc(Push);
				end;
			Ptr:=Edge[Ptr].Prev;
		end;
		Inc(Pop);
	end;

	//GetChildNum
	for i:=N downto 2 do
		with Node[Queue[i]] do
		begin
			Inc(ChildNum);
			Inc(Node[Father].ChildNum,ChildNum);
		end;
	Inc(Node[1].ChildNum);

	//GetDistSum
	Total:=0;
	for i:=N downto 2 do
		with Node[Queue[i]] do
		begin
			Inc(Total,DistSum);
			Inc(DistSum,ChildNum*ToFather);
			Inc(Node[Father].DistSum,DistSum);
			Inc(Total,(Node[Father].ChildNum-1-ChildNum)*DistSum);
		end;
	Inc(Total,Node[1].DistSum);

	Writeln(Total*2/N/(N-1):0:4);
end;
begin
	Main;
end.