program Ural_1245(Input,Output);
const
	MaxN=1000;
	MaxValue=MaxLongint;
type
	TIndex=Longint;
	TCoordinate=array[1..MaxN]of TIndex;
	TRadii=array[1..MaxN]of TIndex;
var
	N:TIndex;
	X,Y:TCoordinate;
	R:TRadii;
	MinArea:TIndex;
function SRound(X:TIndex):TIndex;
begin
	if X<100 then 
		Result:=100
	else 
		Result:=X;
end;
procedure UpdateArea(const P:TCoordinate;Axis:TIndex);
var
	i:TIndex;
	Left,Right,Bottom,Top:array[Boolean]of TIndex;
	Side:Boolean;
	Has:array[Boolean]of Boolean;
	Area:TIndex;
begin
	for Side:=false to true do
	begin
		Left[Side]:=MaxValue;
		Right[Side]:=-MaxValue;
		Bottom[Side]:=MaxValue;
		Top[Side]:=-MaxValue;
		Has[Side]:=false;
	end;
	for i:=1 to N do
	begin
		if (P[i]-R[i]<Axis) and (Axis<P[i]+R[i]) then Exit;
		Side:=(P[i]-R[i]<Axis);
		Has[Side]:=true;
		if X[i]-R[i]<Left[Side] then Left[Side]:=X[i]-R[i];
		if X[i]+R[i]>Right[Side] then Right[Side]:=X[i]+R[i];
		if Y[i]-R[i]<Bottom[Side] then Bottom[Side]:=Y[i]-R[i];
		if Y[i]+R[i]>Top[Side] then Top[Side]:=Y[i]+R[i];
	end;
	Area:=0;
	for Side:=false to true do
		if Has[Side] then
			Inc(Area,SRound(Right[Side]-Left[Side])*SRound(Top[Side]-Bottom[Side]));
	if Area<MinArea then MinArea:=Area;
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		Readln(R[i],X[i],Y[i]);
	MinArea:=MaxValue;
	for i:=1 to N do
	begin
		UpdateArea(X,X[i]-R[i]);
		UpdateArea(X,X[i]+R[i]);
		UpdateArea(Y,Y[i]-R[i]);
		UpdateArea(Y,Y[i]+R[i]);
	end;
	Writeln(MinArea);
end;
begin
	Main;
end.