program Ural_1420(Input,Output);
type
	TIndex=Longint;
	TData=Int64;
	TPoint=record
		x,y:TData;
	end;
function Det(A,B:TPoint):TData;
begin
	Result:=A.x*B.y-A.y*B.x;
end;
function Dot(A,B:TPoint):TData;
begin
	Result:=A.x*B.x+A.y*B.y;
end;
function Floor(A,B:TData):TIndex; //A>=0, B>0
begin
	Result:=A div B;
end;
function Ceil(A,B:TData):TIndex; //A>=0, B>0
begin
	if A=0 then Result:=0
	else Result:=(A-1) div B+1;
end;
procedure Main;
var
	A,B,P:TPoint;
	x,y:TIndex;
	t:TData;
	Count:TIndex;
begin
	Readln(A.x,A.y);
	Readln(B.x,B.y);
	t:=B.x*B.x+B.y*B.y;
	if t=0 then
	begin
		Writeln(0);
		Exit;
	end;
	P.x:=Abs(Det(A,B));
	P.y:=Abs(Dot(A,B));
	Count:=0;
	for x:=Floor(P.x,t)-1 to Ceil(P.x,t)+1 do
		for y:=Floor(P.y,t)-1 to Ceil(P.y,t)+1 do
			if Sqr(x-P.x/t)+Sqr(y-P.y/t)<1 then
				Inc(Count);
	Writeln(Count);
end;
begin
	Main;
end.