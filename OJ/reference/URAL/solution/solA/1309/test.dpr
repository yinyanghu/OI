{$apptype console}
program Ural_1309(Input,Output);
type
	TIndex=Longint;
function Power(A:TIndex;X:TIndex):TIndex;
begin
	A:=A mod 9973;
	Result:=1;
	while X>0 do
	begin
		Dec(X);
		Result:=Result*A mod 9973;
	end;
end;
procedure Main;
var
	i,N:TIndex;
	F:TIndex;
begin
	Readln(N);
	F:=0;
	for i:=1 to N do
	begin
		F:=(F-1)*Power(i,5)+Power(i,3)-Power(i,1)*F+3*Power(i,1)+7*F;
		F:=F mod 9973;
		F:=(F+9973)mod 9973;
		if i mod 100000=0 then
		Writeln(F);
	end;
end;
begin
	Main;
end.