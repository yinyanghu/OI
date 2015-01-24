program Ural_1348(Input,Output);
type
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
function Dot(A,B:TPoint;C,D:TPoint):TData;
begin
	Result:=(B.x-A.x)*(B.y-A.y)+(D.x-C.x)*(D.y-C.y);
end;
function GetDist(A,B:TPoint):TData;
begin
	Result:=Sqrt(Sqr(B.x-A.x)+Sqr(B.y-A.y));
end;
function Min(A,B:TData):TData;
begin	
	if A<B then Result:=A
	else Result:=B;
end;
function Max(A,B:TData):TData;
begin	
	if A>B then Result:=A
	else Result:=B;
end;
procedure Main;
var
	A,B,C:TPoint;
	L:TData;
	S,P:TData;
	ReachL,WholeL:TData;
begin
	Read(A.x,A.y,B.x,B.y,C.x,C.y,L);

	if (Dot(A,B,C,A)*Dot(A,B,C,B)<=0)and(GetDist(A,B)>0) then 
	begin
		P:=(GetDist(A,B)+GetDist(A,C)+GetDist(B,C))/2;
		S:=Sqrt(P*(P-GetDist(A,B))*(P-GetDist(A,C))*(P-GetDist(B,C)));
		ReachL:=2*S/GetDist(A,B);
	end
	else ReachL:=Min(GetDist(C,A),GetDist(C,B));
	if L>=ReachL then Writeln('0.00')
	else Writeln(ReachL-L:0:2);

	WholeL:=Max(GetDist(C,A),GetDist(C,B));
	if L>=WholeL then Writeln('0.00')
	else Writeln(WholeL-L:0:2);
end;
begin
	Main;
end.