{
	Author: Amber
	Method: Construct
	Clariry:
		寻找最右边的可以变为")"的"("(记为x)（也就是x的之前有"("可以与改变后的x匹配），把它改成")"后
		，再将它后面的括号排成"((((...))))"+"))..))"的形式。
		"+"前的"((((...))))"保证了字典序最小
		"+"后的"))..))"是为了与x前的"((..(("匹配的。
}
program SGU_179(Input,Output);
type
	TIndex=Longint;
procedure Main;
var
	i:TIndex;
	Stack,Rec_Stack:TIndex;
	Ch:Char;
	St:AnsiString;
begin
	Stack:=0;
	Rec_Stack:=0;
	St:='';
	while not Eoln do
	begin
		Read(Ch);
		if Ch='(' then
		begin
			if Stack>0 then 
			begin
				Rec_Stack:=Stack; //Rightest '(' before which the stack value>0.
				Write(St);
				St:='';
			end;
			Inc(Stack);
		end
		else 
			Dec(Stack);
		St:=St+Ch;
	end;
	Readln;
	Write(')');
	for i:=1 to (Length(St)-Rec_Stack) div 2 do
		Write('(');
	for i:=1 to (Length(St)-Rec_Stack) div 2 do
		Write(')');
	for i:=1 to Rec_Stack-1 do
		Write(')');
	Writeln;
end;
begin
	Main;
end.