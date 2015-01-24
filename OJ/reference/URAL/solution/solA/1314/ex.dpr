program Ural_1314(Input,Output);
const
	MaxID=32767;
	MaxEdge=2500*2;
type
	TIndex=Longint;
	TLast=array[1..MaxID]of TIndex;
	TPrev=array[1..MaxEdge]of TIndex;
	TToPtr=array[1..MaxEdge]of TIndex;
	TDistance=array[1..MaxID]of TIndex;
	TQueue=array[1..MaxID]of TIndex;
var
	M:TIndex;
	Last:TLast;
	Prev:TPrev;
	ToPtr:TToPtr;
	DF,DS:TDistance;
	Queue:TQueue;
	
procedure BFS(Start:TIndex;var D:TDistance);
var
	Pop,Push:TIndex;
	Ptr:TIndex;
begin
	Queue[1]:=Start;
	Pop:=1;
	Push:=2;
	D[Start]:=0;
	while Pop<Push do
	begin
		Ptr:=Last[Queue[Pop]];
		while Ptr>0 do
		begin
			if D[ToPtr[Ptr]]=-1 then
			begin
				D[ToPtr[Ptr]]:=D[Queue[Pop]]+1;
				Queue[Push]:=ToPtr[Ptr];
				Inc(Push);
			end;
			Ptr:=Prev[Ptr];
		end;
		Inc(Pop);
	end;
end;
procedure Main;
var
	N,K:TIndex;
	i,j:TIndex;
	X,Y:TIndex;
	Start,Finish:TIndex;
begin
	FillChar(Last,SizeOf(Last),0);
	Readln(N);
	M:=0;
	for i:=1 to N do
	begin
		Read(K,X);
		for j:=2 to K do
		begin
			Read(Y);
			Inc(M);
			ToPtr[M]:=Y;
			Prev[M]:=Last[X];
			Last[X]:=M;
			Inc(M);
			ToPtr[M]:=X;
			Prev[M]:=Last[Y];
			Last[Y]:=M;
			X:=Y;
		end;
		Readln;
	end;

	FillChar(DF,SizeOf(DF),255);
	FillChar(DS,SizeOf(DS),255);
	Read(K,Start);
	BFS(Start,DF);
	for i:=2 to K-1 do
		Read(Y);
	if K=1 then //WA 1 times, should discuss entirely
		Finish:=Start
	else
		Readln(Finish);
	BFS(Finish,DS);

	for i:=1 to MaxID do
		if DF[i]>-1 then
			if DF[i]-DS[i]=K-1 then
				Writeln(i);
end;
begin
	Main;
end.