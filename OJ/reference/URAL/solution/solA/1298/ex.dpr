program Ural_1298(Input, Output);
const
	Direct:array[1..8]of record
		x,y:ShortInt;
	end=((x:2;y:1),(x:-2;y:1),(x:2;y:-1),(x:-2;y:-1),(x:1;y:2),(x:-1;y:2),(x:1;y:-2),(x:-1;y:-2));
	MaxN=8;
type
	TIndex=Longint;
	TUsed=array[1..MaxN,1..MaxN]of Boolean;
	TDegree=array[1..MaxN,1..MaxN] of ShortInt;
	TPoint=record
		x,y:TIndex;
	end;
	TWay=array[1..MaxN*MaxN]of TPoint;
	TQueue=record
		Len:TIndex;
		D:array[1..8]of TPoint;
	end;
var
	Used:TUsed;
	Deg:TDegree;
	Len:TIndex;
	Way:TWay;
	N:TIndex;
	Found:Boolean;
	
procedure InitDegree;
var
	x,y,tx,ty:TIndex;
	i:TIndex;
begin
	FillChar(Deg,Sizeof(Deg),0);
	for x:=1 to N do
		for y:=1 to N do
			for i:=1 to 8 do
			begin
				tx:=x+Direct[i].x;
				ty:=y+Direct[i].y;
				if (tx<1) or (tx>N) or (ty<1) or (ty>N) then Continue;
				Inc(Deg[x,y]);
			end;
end;
procedure DFS(x,y:TIndex);
var
	i,j:TIndex;
	tx,ty:TIndex;
	Q:TQueue;
	Tmp:TPoint;
begin
	Used[x,y]:=true;
	Inc(Len);
	Way[Len].x:=x;
	Way[Len].y:=y;
	if Len=N*N then 
	begin
		Found:=true;
		Exit;
	end;
	Q.Len:=0;
	for i:=1 to 8 do
	begin
		tx:=x+Direct[i].x;
		ty:=y+Direct[i].y;
		if (tx<1) or (tx>N) or (ty<1) or (ty>N) then Continue;
		if not Used[tx,ty] then
		begin
			Inc(Q.Len);
			Q.D[Q.Len].x:=tx;
			Q.D[Q.Len].y:=ty;
			Dec(Deg[tx,ty]);
		end;
	end;
	//sort by degree and random
	for i:=1 to Q.Len-1 do
		for j:=i+1 to Q.Len do
			if (Deg[Q.D[i].x,Q.D[i].y]>Deg[Q.D[j].x,Q.D[j].y]) 
				or ((Deg[Q.D[i].x,Q.D[i].y]=Deg[Q.D[j].x,Q.D[j].y]) and (Random>Exp(-1))) then
			begin
				Tmp:=Q.D[i];
				Q.D[i]:=Q.D[j];
				Q.D[j]:=Tmp;
			end;
	for i:=1 to Q.Len do
	begin
		DFS(Q.D[i].x,Q.D[i].y);
		if Found then Exit;
	end;

	for i:=1 to Q.Len do
		Inc(Deg[Q.D[i].x,Q.D[i].y]);
	Used[x,y]:=false;
	Dec(Len);
end;
procedure Print;
var
	i:TIndex;
begin
	for i:=1 to Len do
		Writeln(Chr(Way[i].x+Ord('a')-1),Way[i].y);
end;
procedure Main;
begin
	Randomize;
	Readln(N);
	InitDegree;
	Len:=0;
	FillChar(Used,SizeOf(Used),0);
	Found:=false;
	DFS(1,1);
	if not Found then
		Writeln('IMPOSSIBLE')
	else
		Print;
end;
begin
	Main;
end.