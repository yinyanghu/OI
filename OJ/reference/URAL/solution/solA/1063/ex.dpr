program Ural_1063(Input,Output);
const
	N=6;
	MaxCount=3;
	MaxValue=MaxLongint div 16;
type
	TIndex=Longint;
	TDegree=array[1..N]of TIndex;
	TFather=array[1..N]of TIndex;
	TEdge=array[1..N*2]of record
		x,y:TIndex;
	end;
var
	D:TDegree;
	F:TFather;
	Min:TIndex;
	Len:TIndex;
	Edge,Best:TEdge;
	Count:TIndex;
function Find(x:TIndex;Compress:Boolean):TIndex;
begin
	if F[x]<0 then
		Result:=x
	else
	begin
		Result:=Find(F[x],Compress);
		if Compress then F[x]:=Result;
	end;
end;
procedure Check(EdgeNum:TIndex;Sum:TIndex);
var
	i:TIndex;
	First,Second:TIndex;
	NewEdge:Boolean;
begin
	First:=0;
	Second:=0;
	NewEdge:=true;
	for i:=N downto 1 do
		if Odd(D[i]) then
			if First=0 then First:=i
			else if Second=0 then Second:=i
			else
			begin
				Inc(Sum,i);
				if NewEdge then
				begin
					Inc(EdgeNum);
					Edge[EdgeNum].y:=i
				end
				else
					Edge[EdgeNum].x:=i;
				NewEdge:=not NewEdge;
			end;
	if Sum<Min then
	begin
		Min:=Sum;
		Len:=EdgeNum;
		Best:=Edge;
	end;
end;
procedure DFS(Depth:TIndex;Sum:TIndex);
var
	i,j:TIndex;
	ri,rj:TIndex;
begin
	if Sum>=Min then Exit;
	if Depth=Count then
	begin
		Check(Count-1,Sum);
		Exit;
	end;
	for i:=1 to N-1 do
		if D[i]>0 then
			for j:=i+1 to N do
				if D[j]>0 then
				begin
					ri:=Find(i,false);
					rj:=Find(j,false);
					if ri=rj then Continue;
					F[ri]:=rj;
					Inc(D[i]);
					Inc(D[j]);
					Edge[Depth].x:=i;
					Edge[Depth].y:=j;
					DFS(Depth+1,Sum+i+j);
					F[ri]:=-1;
					Dec(D[i]);
					Dec(D[j]);
				end;
end;
procedure Main;
var
	i:TIndex;
	x,y:TIndex;
	M:TIndex;
begin
	FillChar(F,SizeOf(F),255);
	FillChar(D,SizeOf(D),0);
	Readln(M);
	while M>0 do
	begin
		Dec(M);
		Readln(x,y);
		Inc(D[x]);
		Inc(D[y]);
		x:=Find(x,true);
		y:=Find(y,true);
		if x<>y then F[x]:=y;
	end;
	Count:=0;
	for x:=1 to N do
		if (D[x]>0) and (F[x]<0) then
			Inc(Count);
	Min:=MaxValue;
	Len:=0;
	DFS(1,0);
	Writeln(Min);
	Writeln(Len);
	for i:=1 to Len do
		Writeln(Best[i].x,' ',Best[i].y);
end;
begin
	Main;
end.