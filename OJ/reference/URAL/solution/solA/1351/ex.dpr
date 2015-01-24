{
	Arc is the range from vector OA to vector OB with radii given
	OA and OB intersect at a not more 180 degree angle.
}
program Ural_1351(Input,Output);
type
	TIndex=Longint;
	TData=Longint;
	TPoint=record
		X,Y:TData;
	end;
var
	N:TIndex;
	R:TData;
	O,A,B:TPoint;
function Det(A,B:TPoint):TData;
begin
	Result:=A.x*B.y-A.y*B.x;
end;
function Dot(A,B:TPoint):TData;
begin
	Result:=A.x*B.x+A.y*B.y;
end;
function Vector(A,B:TPoint):TPoint;
begin
	Result.x:=B.x-A.x;
	Result.y:=B.y-A.y;
end;
function IsKilled(P:TPoint):Boolean; // a good example for vector
begin
	Result:=false;
	if Sqr(O.x-P.x)+Sqr(O.y-P.y)>Sqr(R) then Exit;
	if Det(Vector(O,A),Vector(O,P))=0 then
		Result:=(Dot(Vector(O,A),Vector(O,P))>=0)
	else if Det(Vector(O,B),Vector(O,P))=0 then
		Result:=(Dot(Vector(O,B),Vector(O,P))>=0)
	else
		Result:=((Det(Vector(O,A),Vector(O,P))*Det(Vector(O,B),Vector(O,P))<0)
		and (Det(Vector(O,A),Vector(O,P))*Det(Vector(O,A),Vector(O,B))>0));
end;
procedure Main;
var
	P:TPoint;
begin
	O.x:=0;
	O.y:=0;
	Readln(R,A.x,A.y,B.x,B.y);
	Readln(N);
	while N>0 do
	begin
		Dec(N);
		Readln(P.x,P.y);
		if IsKilled(P) then Writeln('YES')
		else Writeln('NO');
	end;
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.