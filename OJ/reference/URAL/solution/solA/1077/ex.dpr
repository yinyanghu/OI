{
	Find all circles in graph.
		i.e. Find all backward edges in all DFS trees (forest) O(M)
}
program Ural_1077(Input,Output);
const
	MaxN=200;
	MaxM=MaxN*MaxN;
type
	TIndex=Longint;
	TLast=array[1..MaxN]of TIndex;
	TEdge=array[1..MaxM]of record
		PtrTo,Prev:TIndex;
	end;
	TState=array[1..MaxN]of Shortint;
	TFather=array[1..MaxN]of TIndex;
	TCircle=array[1..MaxN*MaxN]of record
		Start,Finish:TIndex;
	end;
var
	N,M:TIndex;
	Last:TLast;
	Edge:TEdge;
	State:TState;
	Father:TFather;
	CirNum:TIndex;
	Circle:TCircle;
procedure DFS(Node:TIndex);
var
	Ptr:TIndex;
begin
	State[Node]:=1;
	Ptr:=Last[Node];
	while Ptr>0 do
	begin
		with Edge[Ptr] do
			if State[PtrTo]=0 then
			begin
				Father[PtrTo]:=Node;
				DFS(PtrTo);
			end
			else if (State[PtrTo]=1) and (PtrTo<>Father[Node]) then
			begin
				Inc(CirNum);
				Circle[CirNum].Start:=Node;
				Circle[CirNum].Finish:=PtrTo;
			end;
		Ptr:=Edge[Ptr].Prev;
	end;
	State[Node]:=2;
end;
function FindPath(Start,Finish:TIndex;Print:Boolean):TIndex;
begin
	Result:=0;
	repeat
		Inc(Result);
		if Print then Write(' ',Start);
		if Start=Finish then Break;
		Start:=Father[Start];
	until false;
end;
procedure Main;
var
	i:TIndex;
	x,y:TIndex;
begin
	FillChar(Last,SizeOf(Last),0);
	Readln(N,M);
	for i:=1 to M do
	begin
		Readln(x,y);
		Edge[i].PtrTo:=y;
		Edge[i].Prev:=Last[x];
		Last[x]:=i;
		Edge[i+M].PtrTo:=x;
		Edge[i+M].Prev:=Last[y];
		Last[y]:=i+M;
	end;
	FillChar(State,SizeOf(State),0);
	CirNum:=0;
	for i:=1 to N do
		if State[i]=0 then
		begin
			Father[i]:=0;
			DFS(i);
		end;
	Writeln(CirNum);
	for i:=1 to CirNum do
		with Circle[i] do
		begin
			Write(FindPath(Start,Finish,false));
			FindPath(Start,Finish,true);
			Writeln;
		end;
end;
begin
	Main;
end.