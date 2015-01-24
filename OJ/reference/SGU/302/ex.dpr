{
	Author: Amber
	Method: Stack Processing
}
program SGU_302(Input,Output);
const
	MaxStackNum=100;
	UP=1;
	DOWN=2;
type
	TIndex=Longint;
	TStack=array[0..MaxStackNum]of ShortInt;
var
	Top:TIndex;
	Stack:TStack;
procedure UpperCase(var Ch:Char);
begin
	if Ch in ['a'..'z'] then Ch:=Chr(Ord(Ch)-32);
end;
procedure LowerCase(var Ch:Char);
begin
	if Ch in ['A'..'Z'] then Ch:=Chr(Ord(Ch)+32);
end;
procedure Main;
var
	Ch:Char;
	Tag:String[10];
	InTag:Boolean;
begin
	InTag:=false;
	Top:=0;
	Stack[0]:=0;
	while not Eof do
	begin
		Read(Ch);
		if Ch='<' then
		begin
			Tag:='';
			InTag:=true;
		end
		else if Ch='>' then
		begin
			if Tag='UP' then
			begin
				Inc(Top);
				Stack[Top]:=UP;
			end
			else if Tag='DOWN' then
			begin
				Inc(Top);
				Stack[Top]:=DOWN;
			end
			else if (Tag='/UP') or (Tag='/DOWN') then
				Dec(Top);
			InTag:=false;
		end
		else if InTag then
			Tag:=Tag+Ch
		else
		begin
			case Stack[Top] of
				UP:UpperCase(Ch);
				DOWN:LowerCase(Ch);
			end;
			Write(Ch);
		end;
	end;
end;
begin
	Main;
end.
