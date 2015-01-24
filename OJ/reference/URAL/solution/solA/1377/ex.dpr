program Ural_1377(Input,Output);
const
	Direct:array[0..3]of record
		x,y:SmallInt;
	end=((x:0;y:1),(x:1;y:0),(x:0;y:-1),(x:-1;y:0));
	MaxSize=100;
type
	TIndex=SmallInt;
	TMap=array[1..MaxSize,1..MaxSize]of SmallInt;
var
	N,M:TIndex;
	Px,Py:TIndex;
	Qx,Qy:TIndex;
	Map:TMap;
function IsValid(x,y:TIndex):Boolean;
begin
	Result:=false;
	if (x<1) or (y<1) or (x>N) or (y>M) then Exit;
	Result:=(Map[x,y]=0);
end;
procedure Main;
var
	x,y,d:TIndex;
	Step:TIndex;
begin
	Readln(N,M);
	Readln(Px,Py);
	Readln(Qx,Qy);
	FillChar(Map,SizeOf(Map),0);
	x:=1;
	y:=1;
	d:=0;
	Step:=1;
	Map[x,y]:=1;
	while Step<N*M do
	begin
		while not IsValid(x+Direct[d].x,y+Direct[d].y) do
		begin
			Inc(d);
			if d=4 then d:=0;
		end;
		Inc(x,Direct[d].x);
		Inc(y,Direct[d].y);
		Inc(Step);
		Map[x,y]:=Step;
	end;
	Writeln(Abs(Map[Px,Py]-Map[Qx,Qy]));
end;
begin
	Main;
end.