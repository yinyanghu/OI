{
	Min Cut Capability=Max Flow Value
}
program Ural_1277(Input,Output);
const
	MaxN=100;
	MaxNode=MaxN*2;
	MaxM=10000;
	MaxEdge=MaxM*4;
	Infinite=MaxLongint shr 4;
type
	TIndex=Longint;
	TGraph=array[1..MaxN,1..MaxN]of Boolean;
	TQueue=array[1..MaxNode]of TIndex;
	TLast=array[1..MaxNode]of TIndex;
	TNodeSet=array[1..MaxNode]of record
		Pred,Delta:TIndex;
		Used:Boolean;
	end;
	TEdgeSet=array[1..MaxEdge] of record
		u,v:TIndex;
		Capa,Flow,Prev:TIndex;
	end;
var
	N,M,S,T:TIndex;
	Limit:TIndex;
	NodeNum,EdgeNum:TIndex;
	G:TGraph;
	Queue:TQueue;
	Last:TLast;
	Node:TNodeSet;
	Edge:TEdgeSet;
function Min(const A,B:TIndex):TIndex;
begin
	if A<B then Result:=A
	else Result:=B;
end;
function InsertEdge(u,v,c:TIndex):TIndex;
begin
	Inc(EdgeNum);
	Result:=EdgeNum;
	Edge[EdgeNum].u:=u;
	Edge[EdgeNum].v:=v;
	Edge[EdgeNum].Capa:=c;
	Edge[EdgeNum].Flow:=0;
	Edge[EdgeNum].Prev:=Last[u];
	Last[u]:=EdgeNum;
end;
function CanPass(Ptr:TIndex;var Delta:TIndex):Boolean;
begin
	if Edge[Ptr].Capa>0 then
		with Edge[Ptr] do
			Delta:=Capa-Flow
	else
		with Edge[-Edge[Ptr].Capa] do
			Delta:=Flow;
	Result:=(Delta>0);
end;
procedure Main;
label
	Finish_Finding;
var
	u,v:TIndex;
	c:TIndex;
	Ptr:TIndex;
	Pop,Push:TIndex;
	Flow,Delta:TIndex;
begin
	//Init
	Readln(Limit);
	Readln(N,M,S,T);
	NodeNum:=N*2;
	EdgeNum:=0;
	FillChar(Last,SizeOf(Last),0);
	for u:=1 to N do
	begin
		Read(c);
		if (u=S) or (u=T) then c:=Infinite;
		InsertEdge(u+N,u,-InsertEdge(u,u+N,c));
	end;
	Readln;
	FillChar(G,SizeOf(G),0);
	while M>0 do
	begin
		Dec(M);
		Readln(u,v);
		if G[u,v] or (u=v) then Continue;
		G[u,v]:=true;
		G[v,u]:=true;
		InsertEdge(v,u+N,-InsertEdge(u+N,v,Infinite));
		InsertEdge(u,v+N,-InsertEdge(v+N,u,Infinite));
	end;

	//MaxFlow
	Flow:=0;
	repeat
		//Find augment path
		FillChar(Node,SizeOf(Node),0);
		Pop:=1;
		Push:=2;
		Queue[1]:=S;
		Node[S].Used:=true;
		Node[S].Delta:=Infinite;
		while Pop<Push do
		begin
			u:=Queue[Pop];
			Inc(Pop);
			Ptr:=Last[u];
			while Ptr>0 do
			begin
				with Edge[Ptr] do
					if not Node[v].Used and CanPass(Ptr,Delta) then
					begin
						Queue[Push]:=v;
						Inc(Push);
						Node[v].Used:=true;
						Node[v].Pred:=Ptr;
						Node[v].Delta:=Min(Node[u].Delta,Delta);
						if v=T then goto Finish_Finding;
					end;
				Ptr:=Edge[Ptr].Prev;
			end;
		end;
		Finish_Finding:
		if not Node[T].Used then Break;
		//Change path
		Delta:=Node[T].Delta;
		Inc(Flow,Delta);
		u:=T;
		repeat
			if Edge[Node[u].Pred].Capa>0 then
				with Edge[Node[u].Pred] do
					Inc(Flow,Delta)
			else
				with Edge[-Edge[Node[u].Pred].Capa] do
					Dec(Flow,Delta);
			u:=Edge[Node[u].Pred].u;
		until u=S;
	until Flow>Limit;

	if Flow>Limit then
		Writeln('NO')
	else
		Writeln('YES');
end;
begin
	Main;
end.