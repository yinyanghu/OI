{
	Author: Amber
	Method: Brute-force
	Clarity:
		Range is too small, Brute-force!!!
		My program is slow.
		If providing search order, it can be more optimal.
}
program SGU_125(Input,Output);
const
	MaxSize=3;
	Way:array[1..4]of record
		x,y:ShortInt;
	end=((x:1;y:0),(x:-1;y:0),(x:0;y:1),(x:0;y:-1));
type
	TIndex=Longint;
	TCount=array[1..MaxSize,1..MaxSize]of TIndex;
	TAnswer=array[1..MaxSize,1..MaxSize]of TIndex;
var
	N:TIndex;
	Count:TCount;
	Answer:TAnswer;
	Finish:Boolean;
function Modify(x,y,Delta:TIndex):Boolean;
var
	d:TIndex;
	tx,ty:TIndex;
begin
	Result:=true;
	for d:=1 to 4 do
	begin
		tx:=x+Way[d].x;
		ty:=y+Way[d].y;
		if (tx<1) or (tx>N) or (ty<1) or (ty>N) then Continue;
		if Answer[tx,ty]=-1 then Continue;
		if Answer[x,y]>Answer[tx,ty] then Inc(Count[tx,ty],Delta)
		else if Answer[x,y]<Answer[tx,ty] then Inc(Count[x,y],Delta);
		if Count[tx,ty]<0 then Result:=false;
	end;
	if Count[x,y]<0 then Result:=false;
	if x>1 then if Count[x-1,y]>0 then Result:=false;
end;
procedure DFS(x,y:TIndex);
begin
	if y=N+1 then
	begin
		y:=1;
		Inc(x);
	end;
	if x=N+1 then
	begin
		for y:=1 to N do
			if Count[N,y]>0 then Exit;
		Finish:=true;
		Exit;
	end;
	while Answer[x,y]<9 do
	begin
		Inc(Answer[x,y]);
		if Modify(x,y,-1) then DFS(x,y+1);
		if Finish then Exit;
		Modify(x,y,1);
	end;
	Answer[x,y]:=-1;
end;
procedure Main;
var
	i,j:TIndex;
begin
	//Init
	Readln(N);
	for i:=1 to N do
	begin
		for j:=1 to N do
			Read(Count[i,j]);
		Readln;
	end;
	//Main
	Finish:=false;
	FillChar(Answer,SizeOf(Answer),255);
	DFS(1,1);
	//Print
	if Finish then
	begin
		for i:=1 to N do
		begin
			Write(Answer[i,1]);
			for j:=2 to N do
				Write(' ',Answer[i,j]);
			Writeln;
		end;
	end
	else
		Writeln('NO SOLUTION');
end;
begin
	Main;
end.
