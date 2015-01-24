program Ural_1335(Input,Output);
type
	TIndex=Longint;
var
	N:TIndex;
begin
	Readln(N);
	Writeln(N*(N+1),' ',N*(N+2),' ',N*N);
end.
