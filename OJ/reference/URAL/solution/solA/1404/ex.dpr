program Ural_1404(Input,Output);
type
	TIndex=Longint;
procedure Main;
var
	Cur,Last:TIndex;
	Ch:Char;
begin
	Last:=0;
	while not Eoln do
	begin
		Read(Ch);
		Cur:=(Ord(Ch)-Ord('a')-5+26) mod 26;
		Write(Chr(Ord('a')+(Cur-Last+26) mod 26));
		Last:=Cur;
	end;
	Writeln;
end;
begin
	Main;
end.