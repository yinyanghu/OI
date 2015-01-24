{
	Author: Amber
	Method: Simulate
}
program SGU_276(Input,Output);
type
	TIndex=Longint;
const
	TimeLimit:array[1..4]of TIndex=(1,60*5,60*15,60*30);

procedure Main;
var 
	S,P:TIndex;
begin
	Readln(S,P);
	if P-S<TimeLimit[1] then Writeln(0)
	else if P-S<TimeLimit[2] then Writeln(1)
	else if P-S<TimeLimit[3] then Writeln(2)
	else if P-S<TimeLimit[4] then Writeln(3)
	else if P-S>=TimeLimit[4] then Writeln(4);
end;
begin
	Main;
end.