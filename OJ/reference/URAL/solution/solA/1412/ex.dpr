program Ural_1412(Input,Output);
type
	TIndex=Longint;
	TData=Extended;
var
	N:TIndex;
	W,L:TData;
	X,Y:TData;
function GetArea(D:TData):TData;
begin
	Result:=0;
	if D>=1 then Exit;
	Result:=D*Sqrt(1-Sqr(D));
end;
procedure Main;
var
	Ans,Cur:TData;
begin
	Readln(W,L);
	Readln(N);
	Ans:=W*L;
	while N>0 do
	begin
		Dec(N);
		Readln(X,Y);
		Cur:=GetArea(Abs(X))+GetArea(Abs(X-L))+GetArea(Abs(Y))+GetArea(Abs(Y-W));
		if (0<=X) and (X<=L) and (0<=Y) and (Y<=W) then 
			Ans:=Ans-Cur
		else
			Ans:=Ans+Cur;
	end;
	Writeln(Ans:0:3);
end;
begin
	Main;
end.