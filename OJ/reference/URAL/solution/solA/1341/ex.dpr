program Ural_1341(Input,Output);
const
	R=6400;
	Precision=1E-10;
type
	TData=Extended;

function Format(Angle,Range:TData):TData;
begin
	Result:=Angle;
	while Result>Range do Result:=Result-2*Range;
	while Result<=-Range do Result:=Result+2*Range;
end;
procedure Main;
var
	W,L,Len,R_:TData;
begin
	//version 1:
	Readln(W,L,Len);
	W:=W*Pi/180;
	L:=L*Pi/180;
	R_:=Cos(W+Len/R)*R; //WA n times.If add R_:=Abs(R_), then get WA, why ?
	if Abs(R_)>Precision then L:=L+Len/R_;
	R_:=Cos(W)*R;
	if Abs(R_)>Precision then L:=L-Len/R_;
	Writeln(W*180/Pi:0:3);
	Writeln(Format(L,Pi)*180/Pi:0:3);

	//version 2: AC but 极端数据有错: W=0,L=0,Len=R*Pi/2
	{
	Readln(W,L,Len);
	L:=L+Len/(R*Cos(W*Pi/180+Len/R))*180/Pi-Len/(R*Cos(W*Pi/180))*180/Pi;
	Writeln(W:0:3);
	Writeln(Format(L,180):0:3);
	}
end;
begin
	Main;
end.
