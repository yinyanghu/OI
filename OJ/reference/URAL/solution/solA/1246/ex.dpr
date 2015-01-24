{
	let O be the leftest lowest point,P be its prev, N be its next.
	because the polygon isn't self-cross
	so if OP on leftside of ON (ON*OP<0) then cw
	otherwise namely OP on rightside of ON (ON*OP>0) then cww
}
program Ural_1246(Input,Output);
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		X,Y:TData;
	end;
var
	N:TIndex;
	MinInd:TIndex;
	Min,MinNext,MinPrev,Cur,Prev,First:TPoint;
	
function Det(Ax,Ay,Bx,By:TData):TData;
begin
	Result:=Ax*By-Ay*Bx;
end;
function Compare(A,B:TPoint):TData;
begin
	Result:=A.X-B.X;
	if Result=0 then Result:=A.Y-B.Y;
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(N);
	//Find the leftest lowest point and its prev and next.
	Readln(Cur.X,Cur.Y);
	First:=Cur;
	Min:=Cur;
	MinInd:=1;
	for i:=2 to N do
	begin
		Prev:=Cur;
		Readln(Cur.X,Cur.Y);
		if Compare(Cur,Min)<0 then 
		begin
			Min:=Cur;
			MinPrev:=Prev;
			MinInd:=i;
		end;
		if MinInd=i-1 then MinNext:=Cur;
	end;
	if MinInd=1 then MinPrev:=Cur;//n-th
	if MinInd=N then MinNext:=First;
	
	if Det(MinNext.X-Min.X,MinNext.Y-Min.Y,MinPrev.X-Min.X,MinPrev.Y-Min.Y)<0 then 
		Writeln('cw')
	else 
		Writeln('ccw');
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