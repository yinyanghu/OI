{
	Digital Root of N is N mod 9 (if N mod 9=0 then Root=9)
	for every Root=1..9 exist 11..11 in range 00..01->99..99
	at last don't forget 00..00
	Result=11..11*9+1
}
program Ural_1289(Input,Output);
type
	TIndex=Longint;
var
	N:TIndex;
procedure Main;
var
	i:TIndex;
begin
	Readln(N);
	N:=N div 2;
	if N=1 then 
	begin
		Writeln(10);
		Exit;
	end;
	for i:=1 to N-1 do
		Write(1);
	Write(0);
	for i:=1 to N-2 do
		Write(8);
	Writeln(90);
end;
begin
	Main;
end.