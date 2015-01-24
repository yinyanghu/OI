program Ural_1328(Input,Output);
const
	Precision=1E-15;
	MaxValue=1E30;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
var
	N:TIndex;
	W,H:TData;
	A,B,C:TPoint;
	MinDist,MinAngle:TData;
	CurDist,CurAngle:TData;

function ArcTanPlus(x,y:TData):TData;
begin
	if Abs(x)<Precision then
		if Abs(y)<Precision then
			Result:=0
		else if y>0 then
			Result:=90
		else
			Result:=270
	else if x<0 then 
		Result:=ArcTan(y/x)*180/Pi+180
	else if y<0 then
		Result:=ArcTan(y/x)*180/Pi+360
	else
		Result:=ArcTan(y/x)*180/Pi;
end;
procedure Mirror(Vert,Hori:TIndex);
begin
	if Odd(Vert) then
		C.x:=(Vert+1)*W-B.x
	else
		C.x:=Vert*W+B.x;
	if Odd(Hori) then
		C.y:=(Hori+1)*H-B.y
	else
		C.y:=Hori*H+B.y;
	CurDist:=Sqr(C.x-A.x)+Sqr(C.y-A.y);
	CurAngle:=ArcTanPlus(C.x-A.x,C.y-A.y);
	if CurDist<MinDist then
	begin
		MinDist:=CurDist;
		MinAngle:=CurAngle;
	end
	else if (Abs(CurDist-MinDist)<Precision) and (CurAngle<MinAngle) then
		MinAngle:=CurAngle;
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(W,H);
	Readln(N);
	Readln(A.x,A.y,B.x,B.y);
	MinDist:=MaxValue;
	MinAngle:=360;
	for i:=0 to N do
	begin
		Mirror(i,N-i);
		Mirror(i,i-N);
		Mirror(-i,N-i);
		Mirror(-i,i-N);
	end;
	Writeln(MinAngle:0:2);
end;
begin
	Main;
end.