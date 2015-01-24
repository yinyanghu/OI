program Ural_1327(Input,Output);
type
	TIndex=Longint;
var
	A,B:TIndex;
procedure Main;
begin
	Readln(A,B);
	if not Odd(A) then Inc(A);
	if not Odd(B) then Dec(B);
	Writeln((B-A) div 2+1);
end;
begin
	Main;
end.