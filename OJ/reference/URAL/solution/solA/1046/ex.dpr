program Ural_1046(Input,Output);
const
	MaxN=50;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
	TExpression=array[1..MaxN+1]of record
		x,y:record
			A,B,C:TData;
		end;
	end;
	TPointSet=array[1..MaxN]of TPoint;
var
	N:TIndex;
	Z,M:TPointSet;
	A:TExpression;
	
function Solve(A1,B1,C1,A2,B2,C2:TData):TPoint;
begin
	Result.x:=(C2*B1-C1*B2)/(A1*B2-B1*A2);
	Result.y:=(C1*A2-C2*A1)/(A1*B2-B1*A2);
end;
procedure Main;
var
	i:TIndex;
	T:TData;
	P:TPoint;
begin
	Readln(N);
	for i:=1 to N do
		Readln(M[i].x,M[i].y);
	for i:=1 to N do
	begin
		Readln(T);
		Z[i].x:=Cos(T*Pi/180);
		Z[i].y:=Sin(T*Pi/180);
	end;
	A[1].x.A:=1;
	A[1].x.B:=0;
	A[1].x.C:=0;
	A[1].y.A:=0;
	A[1].y.B:=1;
	A[1].y.C:=0;
	for i:=1 to N do
	begin
		A[i+1]:=A[i];
		A[i+1].x.A:=A[i].x.A*Z[i].x-A[i].y.A*Z[i].y;
		A[i+1].x.B:=A[i].x.B*Z[i].x-A[i].y.B*Z[i].y;
		A[i+1].x.C:=(A[i].x.C-M[i].x)*Z[i].x-(A[i].y.C-M[i].y)*Z[i].y;
		A[i+1].y.A:=A[i].x.A*Z[i].y+A[i].y.A*Z[i].x;
		A[i+1].y.B:=A[i].x.B*Z[i].y+A[i].y.B*Z[i].x;
		A[i+1].y.C:=(A[i].x.C-M[i].x)*Z[i].y+(A[i].y.C-M[i].y)*Z[i].x;
		A[i+1].x.C:=A[i+1].x.C+M[i].x;
		A[i+1].y.C:=A[i+1].y.C+M[i].y;
	end;
	P:=Solve(A[N+1].x.A-1,A[N+1].x.B,A[N+1].x.C,A[N+1].y.A,A[N+1].y.B-1,A[N+1].y.C);
	for i:=1 to N do
		Writeln(A[i].x.A*P.x+A[i].x.B*P.y+A[i].x.C:0:0,' ',A[i].y.A*P.x+A[i].y.B*P.y+A[i].y.C:0:0);
end;
begin
	Main;
end.
