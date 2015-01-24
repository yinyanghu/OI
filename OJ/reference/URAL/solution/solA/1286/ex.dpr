program Ural_1286(Input,Output);
type
	TIndex=Int64;
function Extended_GCD(A,B:TIndex;var X,Y:TIndex):TIndex;
begin
	if A<B then
	begin
		Result:=Extended_GCD(B,A,Y,X);
		Exit;
	end;
	if B=0 then
	begin
		X:=1;
		Y:=0;
		Result:=A;
	end
	else
	begin
		Result:=Extended_GCD(B,A mod B,Y,X);
		Y:=Y-A div B*X;
	end;
end;
procedure Main;
var
	P,Q:TIndex;
	DX,DY,TX,TY:TIndex;
	X,Y:TIndex;
	K1,K2:Boolean;
	D:TIndex;
begin
	Readln(P,Q);
	Readln(DX,DY);
	Readln(TX,TY);
	P:=Abs(P);
	Q:=Abs(Q);
	DX:=Abs(TX-DX);
	DY:=Abs(TY-DY);
	if (P=0) and (Q=0) then
	begin
		if (DX=0) and (DY=0) then
			Writeln('YES')
		else
			Writeln('NO');
		Exit;
	end;
	if (P=0) or (Q=0) then
	begin
		D:=P+Q;//D=non-zero in {P,Q}
		if (DX mod D=0) and (DY mod D=0) then
			Writeln('YES')
		else
			Writeln('NO');
		Exit;
	end;
	D:=Extended_GCD(P,Q,X,Y);
	if (DX mod D=0) and (DY mod D=0) then
	begin
		TX:=X*DX div D+Y*DY div D; //x1+y2
		TY:=Y*DX div D+X*DY div D; //x2+y1
		P:=P div D; //p'=p div d
		Q:=Q div D; //q'=q div d
		for K1:=false to true do
			for K2:=false to true do
				if not Odd(TX+Q*Ord(K1)-P*Ord(K2)) and not Odd(TY+P*Ord(K1)-Q*Ord(K2)) then
				begin
					Writeln('YES');
					Exit;
				end;
		Writeln('NO');
	end
	else
		Writeln('NO');
end;
begin
	Main;
end.