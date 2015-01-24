program Ural_1405(Input,Output);
const
	MaxN=1000;
	Low=1;
	High=50;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
	TPointSet=array[1..MaxN]of TPoint;
	TMin=array[1..MaxN]of TData;
var
	N:TIndex;
	P:TPointSet;
	Min:TMin;
	Max:TData;
function Dist(A,B:TPoint):TData;
begin
	Result:=Sqrt(Sqr(A.x-B.x)+Sqr(A.y-B.y));
end;
function GetMax(A,B:TData):TData;
begin
	if A>B then Result:=A
	else Result:=B;
end;
function GetMin(A,B:TData):TData;
begin
	if A<B then Result:=A
	else Result:=B;
end;
function Quadratic(A,B,C:TData;x:TData):TData;
begin
	Result:=A*Sqr(x)+B*x+C;
end;
procedure Main;
var
	i,j:TIndex;
	D:TData;
	Cur:TData;
begin
	Readln(N);
	for i:=1 to N do
		Readln(P[i].x,P[i].y);
	for i:=1 to N do
	begin
		Min[i]:=High;
		for j:=1 to N do
			if (i<>j) and (Dist(P[i],P[j])<Min[i]) then
				Min[i]:=Dist(P[i],P[j]);
	end;
	Max:=0;
	for i:=1 to N-1 do
		for j:=i+1 to N do
			if (Min[i]>=Low) and (Min[j]>=Low) then 
			begin
				D:=Dist(P[i],P[j]);
				Cur:=0;
				if Min[i]+Min[j]>D then
					//Maximize ri^2+rj^2 s.t. low<=ri<=Min[i], low<=rj<=Min[j], ri+rj=d
					if GetMax(D-Min[j],Low)<=GetMin(Min[i],D-Low) then 
						Cur:=GetMax(Quadratic(2,-D*2,Sqr(D),GetMax(D-Min[j],Low)),
							Quadratic(2,-D*2,Sqr(D),GetMin(Min[i],D-Low)))
					else
				else 
					Cur:=Sqr(Min[i])+Sqr(Min[j]);
				if Cur>Max then Max:=Cur;
			end;
	Writeln(Max*Pi:0:4);
end;
begin
	Main;
end.