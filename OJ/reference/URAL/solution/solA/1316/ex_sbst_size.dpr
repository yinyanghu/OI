{
	Method:
	Static BST based on Value
}
program Ural_1316(Input,Output);
const
	MaxN=100000;
	MaxSize=1000000;
type
	TIndex=Longint;
	TCount=Int64;
	TStatic_BST=array[1..MaxSize]of TIndex;
var
	Tree:TStatic_BST;
	Total:TCount;

procedure BST_Modify(Value,Delta:TIndex);
var
	Left,Right,Mid:TIndex;
begin
	Left:=1;
	Right:=MaxSize;
	while Left<=Right do //WA 1 times, don't lose the "="!
	begin
		Mid:=(Left+Right) div 2;
		if Value<Mid then
			Right:=Mid-1
		else if Value>Mid then
		begin
			Inc(Tree[Mid],Delta);
			Left:=Mid+1
		end
		else
		begin
			Inc(Tree[Mid],Delta);
			Break;
		end;
	end;
end;
function BST_Count(Value:TIndex):TIndex;
var
	Left,Right,Mid:TIndex;
begin
	Left:=1;
	Right:=MaxSize;
	Result:=0;
	while Left<=Right do
	begin
		Mid:=(Left+Right) div 2;
		if Value<Mid then
		begin
			Inc(Result,Tree[Mid]);
			Right:=Mid-1
		end
		else if Value>Mid then
			Left:=Mid+1
		else
		begin
			Inc(Result,Tree[Mid]);
			Break;
		end;
	end;
end;
procedure ReadWord(var St:String);
var
	Ch:Char;
begin
	St:='';
	repeat
		Read(Ch);
		if not (('A'<=Ch) and (Ch<='Z')) then Break;
		St:=St+Ch;
	until Eoln;
end;
function Min(A,B:TIndex):TIndex;
begin
	if A<B then 
		Result:=A
	else
		Result:=B;
end;
procedure Main;
var
	Price,Times:TIndex;
	Tmp:Extended;
	St:String;
begin
	Total:=0;
	FillChar(Tree,SizeOf(Tree),0);
	while true do
	begin
		ReadWord(St);
		if St='QUIT' then Break;
		Read(Tmp);
		Price:=Round(Tmp*100);
		if St='BID' then
			BST_Modify(Price,1)
		else if St='DEL' then
			BST_Modify(Price,-1)
		else if St='SALE' then
		begin
			Read(Times);
			Inc(Total,Min(Times,BST_Count(Price)));
		end;
		Readln;
	end;
	Writeln(Total/100:0:2);
end;
begin
	Main;
end.