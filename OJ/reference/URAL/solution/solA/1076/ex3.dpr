{
	SPFA 0.64s
}
program Ural_1076(Input,Output);
const
	MaxN=150;
	MaxNode=MaxN*2+2;
	MaxEdge=MaxN*MaxN*2+MaxN*4;
	MaxValue=MaxLongint div 16;
	MaxQueueLen=MaxNode*2;
type
	TIndex=Longint;
	TNode=array[1..MaxNode]of record
		Dist:TIndex;
		Used:Boolean;
		Pred:TIndex;
	end;
	TEdge=array[1..MaxEdge]of record
		x,y:Word;
		Weight:ShortInt;
		Capa:Longint;
		Flow:ShortInt;
		Prev:Word;
	end;
	TLast=array[1..MaxNode]of TIndex;
	TQueue=array[1..MaxQueueLen]of TIndex;
var
	N:TIndex;
	NodeNum,EdgeNum:TIndex;
	S,T:TIndex;
	Total:TIndex;
	Last:TLast;
	Node:TNode;
	Edge:TEdge;
	Queue:TQueue;

procedure InsertEdge(i,j,c,w:TIndex);
begin
	Inc(EdgeNum);
	Edge[EdgeNum].x:=i;
	Edge[EdgeNum].y:=j;
	Edge[EdgeNum].Flow:=0;
	Edge[EdgeNum].Capa:=c;
	Edge[EdgeNum].Weight:=w;
	Edge[EdgeNum].Prev:=Last[i];
	Last[i]:=EdgeNum;
	if c<0 then Exit;
	InsertEdge(j,i,-EdgeNum,-w);
end;
function CanPass(Ptr:TIndex):Boolean;
var
	Delta:TIndex;
begin
	if Edge[Ptr].Capa>0 then
		with Edge[Ptr] do
			Delta:=Capa-Flow
	else
		with Edge[-Edge[Ptr].Capa] do
			Delta:=Flow;
	Result:=(Delta>0);
end;
function Ford_Fulkerson:Boolean;
var
	i:TIndex;
	Ptr:TIndex;
	Pop,Push:TIndex;
begin
	Result:=false;

	//SPFA for finding maximum augment path
	for i:=1 to NodeNum do
	begin
		Node[i].Dist:=-MaxValue;
		Node[i].Used:=false;
	end;
	Pop:=1;
	Push:=2;
	Queue[1]:=S;
	Node[S].Dist:=0;
	Node[S].Used:=true;
	
	//SPFA
	while Pop<>Push do
	begin
		i:=Queue[Pop];
		Ptr:=Last[i];
		while Ptr>0 do
		begin
			with Edge[Ptr] do
				if CanPass(Ptr) then
					if Node[y].Dist<Node[x].Dist+Weight then
					begin
						Node[y].Dist:=Node[x].Dist+Weight;
						Node[y].Pred:=Ptr;
						if not Node[y].Used then
						begin
							Node[y].Used:=true;
							Queue[Push]:=y;
							Inc(Push);
							if Push>MaxQueueLen then Push:=1;
						end;
					end;
			Ptr:=Edge[Ptr].Prev;
		end;
		Inc(Pop);
		if Pop>MaxQueueLen then Pop:=1;
		Node[i].Used:=false;
	end;
	if Node[T].Dist=-MaxValue then Exit;

	//Improve Path
	i:=T;
	repeat
		if Edge[Node[i].Pred].Capa>0 then
			with Edge[Node[i].Pred] do
			begin
				Inc(Flow);
				Dec(Total,Weight)
			end
		else
			with Edge[-Edge[Node[i].Pred].Capa] do
			begin
				Dec(Flow);
				Inc(Total,Weight);
			end;
		i:=Edge[Node[i].Pred].x;
	until i=S;
	Result:=true;
end;
procedure Main;
var
	i,j:TIndex;
	X:TIndex;
begin
	Readln(N);
	FillChar(Last,SizeOf(Last),0);
	EdgeNum:=0;
	Total:=0;
	for i:=1 to N do
	begin
		for j:=1 to N do
		begin
			Read(X);
			Inc(Total,X);
			InsertEdge(i,j+N,1,X);
		end;
		Readln;
	end;
	NodeNum:=N*2+2;
	S:=NodeNum-1;
	T:=NodeNum;
	for i:=1 to N do
		InsertEdge(S,i,1,0);
	for i:=1 to N do
		InsertEdge(i+N,T,1,0);
	while Ford_Fulkerson do ;
	Writeln(Total);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input, 'i.txt');
	Reset(Input);
	Assign(Output, 'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.