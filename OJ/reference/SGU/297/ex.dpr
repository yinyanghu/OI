{
	Author: Amber
	Method: Maths
	Clarity: Mod Sum Directly
}
program SGU_297(Input,Output);
type
	TIndex=Longint;
var
	N,M:TIndex;
procedure Main;
var
	Cur,Sum:TIndex;
begin
	Readln(N,M);
	Sum:=0;
	while M>0 do
	begin
		Dec(M);
		Readln(Cur);
		Inc(Sum,Cur);
	end;
	Writeln(Sum mod N);
end;
begin
	Main;
end.