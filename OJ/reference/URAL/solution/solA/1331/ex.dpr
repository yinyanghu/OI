program Ural_1331(Input,Output);
const
	MaxM=5000;
	Precision=1E-10;
type
	TIndex=Longint;
	TData=Double;
	TPoint=record
		x,y,z:TData;
	end;
	TPointSet=array[1..MaxM]of TPoint;
var
	N,M:TIndex;
	P:TPointSet;
	R:TData;

function GetVector(W,L:TData):TPoint;
begin
	W:=W*Pi/180;
	L:=L*Pi/180;
	Result.x:=Cos(L)*Cos(W);
	Result.y:=Sin(L)*Cos(W);
	Result.z:=Sin(W);
end;
function ArcCos(x:TData):TData;
begin
	if Abs(x)<Precision then
		Result:=Pi/2
	else if x<=-1 then 
		Result:=Pi
	else if x>=1 then
		Result:=0
	else if x>0 then
		Result:=ArcTan(Sqrt(1-Sqr(x))/x)
	else // now x<0 
		Result:=Pi+ArcTan(Sqrt(1-Sqr(x))/x);
end;
procedure Main;
var
	i,j:TIndex;
	CurCos,MaxCos:TData;
	Q:TPoint;
	W,L:TData;
begin
	Readln(N,M);
	Readln(R);
	for i:=1 to M do
	begin
		Readln(W,L);
		P[i]:=GetVector(W,L);
	end;
	for i:=1 to N do
	begin
		Readln(W,L);
		Q:=GetVector(W,L);
		MaxCos:=-1;
		for j:=1 to M do  //don't use complex calculation like arcsin,sqrt in loop, or tle.
		begin
			CurCos:=P[j].x*Q.x+P[j].y*Q.y+P[j].z*Q.z;
			if CurCos>MaxCos then MaxCos:=CurCos;
		end;
		Writeln(ArcCos(MaxCos)*R:0:2);
	end;
end;
begin
	Main;
end.