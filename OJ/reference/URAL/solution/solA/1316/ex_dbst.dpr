{
	Method:
	Dynamic BST
	TLE at 5
}
program Ural_1316(Input,Output);
const
	MaxN=100000;
type
	TIndex=Longint;
	TBST=array[1..MaxN]of record
		Value:TIndex;
		Count:TIndex;
		Left,Right:TIndex;
	end;
	TCount=Int64;
var
	Total:TCount;
	Num:TIndex;
	Tree:TBST;

procedure BST_Add(Value:TIndex);
var
	Cur:TIndex;
begin
	Cur:=1;
	while Cur>0 do
	begin
		if Value<Tree[Cur].Value then
		begin
			if Tree[Cur].Left=0 then
			begin
				Inc(Num);
				Tree[Cur].Left:=Num;
				Tree[Num].Value:=Value;
			end;
			Cur:=Tree[Cur].Left;
		end
		else if Value>Tree[Cur].Value then
		begin
			Inc(Tree[Cur].Count);
			if Tree[Cur].Right=0 then
			begin
				Inc(Num);
				Tree[Cur].Right:=Num;
				Tree[Num].Value:=Value;
			end;
			Cur:=Tree[Cur].Right;
		end
		else
		begin
			Inc(Tree[Cur].Count);
			Break;
		end 
	end;
end;
procedure BST_Del(Value:TIndex);
var
	Cur:TIndex;
begin
	Cur:=1;
	while Cur>0 do
	begin
		if Value<Tree[Cur].Value then
			Cur:=Tree[Cur].Left
		else if Value>Tree[Cur].Value then
		begin
			Dec(Tree[Cur].Count);
			Cur:=Tree[Cur].Right;
		end
		else
		begin
			Dec(Tree[Cur].Count);
			Break;
		end
	end;
end;
function BST_Count(Value:TIndex):TIndex;
var
	Cur:TIndex;
begin
	Cur:=1;
	Result:=0;
	while Cur>0 do
	begin
		if Value<Tree[Cur].Value then
		begin
			Inc(Result,Tree[Cur].Count);
			Cur:=Tree[Cur].Left;
		end
		else if Value>Tree[Cur].Value then
			Cur:=Tree[Cur].Right
		else
		begin
			Inc(Result,Tree[Cur].Count);
			Break;
		end
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
	Num:=1;
	while true do
	begin
		ReadWord(St);
		if St='QUIT' then Break;
		Read(Tmp);
		Price:=Round(Tmp*100);
		if St='BID' then
			BST_Add(Price)
		else if St='DEL' then
			BST_Del(Price)
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