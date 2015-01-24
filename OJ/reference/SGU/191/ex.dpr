{
	Author: Amber
	Method: Simulate
	Clarity:
		The statement is so hard to understand.
		Abstract it as following:
		Consider a sequence which consists of 4 kinds of chars - abAB.
		There are two principles to change the sequence:
			1.replace a with B or Aba
			2.replace b with A or Bab
		Does there exist a way to change a single element a or b at the beginning to a given sequence which consists of AB?
		
		
		Consider the leftest a or b called P of inital state and the leftest A or B called Q of terminal state.
		If Up(P)=Q, only use A->Aba or B->Bab 
		else only use A->B or B->A.
		Simulate in that way by stack.
	Complexity: O(N)
}
program SGU_191(Input,Output);
const
	MaxN=30000;
type
	TIndex=Longint;
	TStack=array[1..MaxN*2]of Boolean;
var
	Top:TIndex;
	Stack:TStack;
procedure Main;
var
	Ch:Char;
begin
	Readln(Ch);
	Stack[1]:=(Ch='A');
	Top:=1;
	while not Eoln do
	begin
		Read(Ch);
		if Top=0 then
		begin
			Writeln('NO');
			Exit;
		end;
		if Stack[Top]=(Ch='A') then
		begin
			Stack[Top]:=(Ch='A');
			Stack[Top+1]:=not (Ch='A');
			Inc(Top);
		end
		else
			Dec(Top);
	end;
	if Top=0 then
		Writeln('YES')
	else
		Writeln('NO');
end;
begin
	Main;
end.