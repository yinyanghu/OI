{
	Fermat's Last theorem
}
program Ural_1349(Input,Output);
type
	TIndex=Longint;
var
	N:TIndex;
procedure Main;
begin
	Readln(N);
	case N of 
		1:
		Writeln('1 2 3');
		2:
		Writeln('3 4 5');
		else 
		Writeln(-1);
	end;
end;
begin
	Main;
end.