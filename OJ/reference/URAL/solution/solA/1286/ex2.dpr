program Ural_1286(Input,Output);
type
	TIndex=Int64;
function GCD(A,B:TIndex):TIndex;
var
	R:TIndex;
begin
	if A<B then
	begin
		Result:=GCD(B,A);
		Exit;
	end;
	while B>0 do
	begin
		R:=A mod B;
		A:=B;
		B:=R;
	end;
	Result:=A;
end;
procedure Main;
var
	P,Q:TIndex;
	TX,TY:TIndex;
	X,Y:TIndex;
	D:TIndex;
begin
	Readln(P,Q);
	Readln(X,Y);
	Readln(TX,TY);
	P:=Abs(P);
	Q:=Abs(Q);
	X:=Abs(TX-X);
	Y:=Abs(TY-Y);
	if (P=0) and (Q=0) then
	begin
		if (X=0) and (Y=0) then
			Writeln('YES')
		else
			Writeln('NO');
		Exit;
	end;
	if (P=0) or (Q=0) then
	begin
		D:=P+Q;//D = non-zero number in {P,Q}
		if (X mod D=0) and (Y mod D=0) then
			Writeln('YES')
		else
			Writeln('NO');
		Exit;
	end;
	D:=GCD(P,Q);
	if (X mod D=0) and (Y mod D=0) then
	begin
		if Odd(P div D+Q div D) then 
			Writeln('YES')
		else if not Odd(X div D+Y div D) then
			Writeln('YES')
		else 
			Writeln('NO');
	end
	else
		Writeln('NO');
end;
begin
	Main;
end.