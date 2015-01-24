{
	Author: Amber
	Method: Simulate
	Clarity: The hardness is to understand what the problem means.
}
program Ural_1364(Input,Output);
const
	MaxSize=100;
	D:array[0..3]of record
		X,Y:ShortInt;
	end=((X:0;Y:1),(X:1;Y:0),(X:0;Y:-1),(X:-1;Y:0));
type
	TIndex=Longint;
	TMap=array[1..MaxSize,1..MaxSize] of TIndex;
	TPath=array[1..MaxSize*MaxSize] of record
		X,Y:TIndex;
	end;
var	
	N,M:TIndex;
	XEnd,YEnd:TIndex;
	XGet,YGet:TIndex;
	Time:TIndex;
	Map:TMap;
	Path:TPath;
function IsValid(X,Y:TIndex):Boolean;
begin
	Result:=false;
	if (X<1) or (X>N) or (Y<1) or (Y>M) then Exit;
	Result:=(Map[X,Y]=0);
end;
procedure Main;
var
	i:TIndex;
	Count:TIndex;
	Direc:TIndex;
	Left,Right:TIndex;
	X,Y:TIndex;
begin
	Readln(N,M);
	Readln(XEnd,YEnd);
	Readln(XGet,YGet);
	Readln(Time);
	FillChar(Map,SizeOf(Map),0);
	X:=1;
	Y:=1;
	Count:=0;
	Direc:=0;
	while true do
	begin
		Inc(Count);
		Map[X,Y]:=Count;
		Path[Count].X:=X;
		Path[Count].Y:=Y;
		if (X=XEnd) and (Y=YEnd) then Break;
		while not IsValid(X+D[Direc].X,Y+D[Direc].Y) do
		begin
			Inc(Direc);
			if Direc=4 then Direc:=0;
		end;
		Inc(X,D[Direc].X);
		Inc(Y,D[Direc].Y);
	end;
	Left:=Map[XGet,YGet]-Time;
	if Left<1 then Left:=1;
	Right:=Map[XGet,YGet]+Time;
	if Right>Count then Right:=Count;
	for i:=Left to Right do
		Writeln(Path[i].X,' ',Path[i].Y);
end;
begin
	Main;
end.