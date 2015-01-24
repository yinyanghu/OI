program Ural_1295(Input,Output);
type
	TIndex=Longint;
var
	N:TIndex;
begin
	Readln(N);
	case N mod 4 of
		0:Writeln(0);
		1:Writeln(1);
		2:Writeln(1);
		3:Writeln(2);
	end;
end.