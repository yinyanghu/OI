program Ural_1250(Input,Output);
const
	MaxSize=500;
	MaxQueueSize=50000; 
	M_Land='#';
	M_Sea='.';
	M_Used='X';
	Direction:array[1..8]of record
		x,y:Shortint;
	end = ((x:1;y:0),(x:-1;y:0),(x:0;y:1),(x:0;y:-1),(x:1;y:1),(x:1;y:-1),(x:-1;y:1),(x:-1;y:-1));
type
	TIndex=Longint;
	TMap=array[0..MaxSize+1,0..MaxSize+1]of Char;
	TQueue=array[1..MaxQueueSize]of record //Loop Queue
		x,y:Word;
	end;
	TSearchRange=String[2];
var
	W,H:TIndex;
	Sx,Sy:TIndex;
	Pop,Push:TIndex;
	Queue:TQueue;
	Map:TMap;
	Count:TIndex;
{
//DFS get MLE
procedure FloodFill(const x,y:TIndex;const Degree:TIndex;const SearchRange:TSearchRange);
var
	d:TIndex;
	tx,ty:TIndex;
begin
	Map[x,y]:=M_Used;
	for d:=1 to Degree do
	begin
		tx:=x+Direction[d].x;
		ty:=y+Direction[d].y;
		if (0<=tx) and (tx<=H+1) and (0<=ty) and (ty<=W+1) then
			if Pos(Map[tx,ty],SearchRange)>0 then
				FloodFill(tx,ty,Degree,SearchRange);
	end;
end;
}
//BFS
procedure FloodFill(x,y:TIndex;const Degree:TIndex;const SearchRange:TSearchRange);
var
	d:TIndex;
	tx,ty:TIndex;
begin
	Pop:=1;
	Push:=2;
	Queue[Pop].x:=x;
	Queue[Pop].y:=y;
	Map[x,y]:=M_Used;
	while Pop<>Push do
	begin
		x:=Queue[Pop].x;
		y:=Queue[Pop].y;
		Inc(Pop);
		if Pop>MaxQueueSize then Pop:=1;
		for d:=1 to Degree do
		begin
			tx:=x+Direction[d].x;
			ty:=y+Direction[d].y;
			if (0<=tx) and (tx<=H+1) and (0<=ty) and (ty<=W+1) then
				if Pos(Map[tx,ty],SearchRange)>0 then
				begin
					Queue[Push].x:=tx;
					Queue[Push].y:=ty;
					Map[tx,ty]:=M_Used;
					Inc(Push);
					if Push>MaxQueueSize then Push:=1;
				end;
		end;
	end;
end;
procedure Main;
var
	x,y:TIndex;
	Ch:Char;
begin
	Readln(W,H,Sy,Sx);
	FillChar(Map,SizeOf(Map),M_Land);
	for x:=1 to H do
	begin
		for y:=1 to W do
		begin
			Read(Ch);
			if Ch='.' then 
				Map[x,y]:=M_Sea
			else 
				Map[x,y]:=M_Land;
		end;
		Readln;
	end;
	
	if Map[Sx,Sy]=M_Land then
	begin
		Writeln(0);
		Exit;
	end;

	FloodFill(Sx,Sy,8,M_Sea);
	
	FloodFill(0,0,4,M_Sea+M_Land);

	Count:=0;
	for x:=1 to H do
		for y:=1 to W do
			if Map[x,y]=M_Land then
			begin
				Inc(Count);
				FloodFill(x,y,4,M_Land);
			end;
	Writeln(Count);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.