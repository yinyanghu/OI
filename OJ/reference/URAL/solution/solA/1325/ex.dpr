{
	BFS
}
program Ural_1325(Input,Output);
const
	Direction:array[1..8]of record
		x,y:ShortInt;
	end=((x:1;y:1),(x:1;y:-1),(x:-1;y:1),(x:-1;y:-1),(x:1;y:0),(x:0;y:1),(x:-1;y:0),(x:0;y:-1));
	MaxSize=500;
type
	TIndex=Longint;
	TQueue=array[1..MaxSize*MaxSize]of record
		x,y:TIndex;
	end;
	TStep=array[1..MaxSize,1..MaxSize]of TIndex;
	TMap=array[1..MaxSize,1..MaxSize]of Char;
var
	M,N:TIndex;
	Sx,Sy:TIndex;
	Tx,Ty:TIndex;
	Map:TMap;
	Pop,Push:TIndex;
	PopT,PushT:TIndex;
	Queue,QueueT:TQueue;
	Dist,Times:TStep;

procedure BFS_FloodFill(x,y:TIndex);
var
	d:TIndex;
	tx,ty:TIndex;
begin
	PopT:=1;
	PushT:=2;
	QueueT[1].x:=x;
	QueueT[1].y:=y;
	while PopT<PushT do
	begin
		with QueueT[PopT] do
			for d:=1 to 8 do
			begin
				tx:=x+Direction[d].x;
				ty:=y+Direction[d].y;
				if (tx<1) or (tx>M) or (ty<1) or (ty>N) then Continue;
				if (Map[tx,ty]='0') or (Times[tx,ty]>0) then Continue;
				if Map[x,y]=Map[tx,ty] then
				begin
					Times[tx,ty]:=Times[x,y];
					QueueT[PushT].x:=tx;
					QueueT[PushT].y:=ty;
					Inc(PushT);
				end
				else
				begin
					Times[tx,ty]:=Times[x,y]+1;
					Queue[Push].x:=tx;
					Queue[Push].y:=ty;
					Inc(Push);
				end;
			end;
		Inc(PopT);
	end;
end;
procedure BFS_Times;
begin
	FillChar(Times,SizeOf(Times),0);
	Pop:=1;
	Push:=2;
	Queue[1].x:=Sx;
	Queue[1].y:=Sy;
	Times[Sx,Sy]:=1;
	while Pop<Push do
	begin
		with Queue[Pop] do BFS_FloodFill(x,y);
		Inc(Pop);
	end;
end;
procedure BFS_Dist;
var
	d:TIndex;
	tx,ty:TIndex;
begin
	FillChar(Dist,SizeOf(Dist),0);
	Pop:=1;
	Push:=2;
	Queue[1].x:=Sx;
	Queue[1].y:=Sy;
	Dist[Sx,Sy]:=1;
	while Pop<Push do
	begin
		with Queue[Pop] do
			for d:=1 to 8 do
				begin
					tx:=x+Direction[d].x;
					ty:=y+Direction[d].y;
					if (tx<1) or (tx>M) or (ty<1) or (ty>N) then Continue;
					if (Map[tx,ty]='0') or (Dist[tx,ty]>0) then Continue;
					if (Map[x,y]=Map[tx,ty])
						or ((Map[x,y]<>Map[tx,ty]) and (Times[tx,ty]=Times[x,y]+1)) then
					begin
						Dist[tx,ty]:=Dist[x,y]+1;
						Queue[Push].x:=tx;
						Queue[Push].y:=ty;
						Inc(Push);
					end;
				end;
		Inc(Pop);
	end;
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(M,N);
	Readln(Sx,Sy);
	Readln(Tx,Ty);
	for i:=1 to M do
	begin
		for j:=1 to N do
			Read(Map[i,j]);
		Readln;
	end;
	BFS_Times;
	BFS_Dist;
	if Dist[Tx,Ty]=0 then
		Writeln('0 0')
	else
		Writeln(Dist[Tx,Ty],' ',Times[Tx,Ty]-1);
end;
begin
	Main;
end.

