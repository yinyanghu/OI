{
	(有最大覆盖值的大圆) 与 (与任意两个小圆内切的大圆) 有非空交集
}
{$N+}
program Ural_1332(Input,Output);
const
	MaxN=100;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
	TPointSet=array[1..MaxN]of TPoint;
var
	N:TIndex;
	P:TPointSet;
	R,Rp:TIndex;
	Max:TIndex;

function GetDistance(A,B:TPoint):TData;
begin
	Result:=Sqrt(Sqr(A.x-B.x)+Sqr(A.y-B.y));
end;
procedure Check(O:TPoint);
var
	i:TIndex;
	Count:TIndex;
begin
	Count:=0;
	for i:=1 to N do
		if GetDistance(O,P[i])+Rp<=R then
			Inc(Count);
	if Count>Max then Max:=Count;
end;
function PArcTan(A,B:TData):TData;
begin
	if B=0 then 
		Result:=Pi/2
	else 
		Result:=ArcTan(A/B);
end;
procedure Main;
var
	i,j:TIndex;
	Mid,O:TPoint;
	Alpha,Len:TData;
begin
	Readln(N);
	for i:=1 to N do
		Readln(P[i].x,P[i].y);
	Readln(R,Rp);
	if R<Rp then 
	begin
		Writeln(0);
		Exit;
	end;
	Max:=0;
	for i:=1 to N-1 do
		for j:=i+1 to N do
		begin
			Len:=Sqr(R-Rp)-Sqr(GetDistance(P[i],P[j])/2);
			if Len<0 then Continue;
			Len:=Sqrt(Len);
			Mid.x:=(P[i].x+P[j].x)/2;
			Mid.y:=(P[i].y+P[j].y)/2;
			Alpha:=PArcTan(-(P[i].x-P[j].x),P[i].y-P[j].y);
			O.x:=Mid.x+Len*Cos(Alpha);
			O.y:=Mid.y+Len*Sin(Alpha);
			Check(O);
			O.x:=Mid.x-Len*Cos(Alpha);
			O.y:=Mid.y-Len*Sin(Alpha);
			Check(O);
		end;
	if (Max=0)and (R>=Rp) then Max:=1;
	Writeln(Max);
end;
begin
	Main;
end.