{
	Method: Tree Array
}
program Ural_1316(Input,Output);
const
	MaxSize=1 shl 20;//1048576>1000000
type
	TIndex=Longint;
	TCount=Int64;
	TTreeArray=array[1..MaxSize]of TIndex;
var
	Count:TTreeArray;
	Total:TCount;

procedure TreeArray_Modify(Cur,Delta:TIndex);
begin
	while Cur<=MaxSize do
	begin
		Inc(Count[Cur],Delta);
		Inc(Cur,(Cur xor (Cur-1)) and Cur);
	end;
end;
function TreeArray_Count(Cur:TIndex):TIndex;
begin
	Result:=0;
	while Cur>=1 do
	begin
		Inc(Result,Count[Cur]);
		Dec(Cur,(Cur xor (Cur-1)) and Cur);
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
	FillChar(Count,SizeOf(Count),0);
	while true do
	begin
		ReadWord(St);
		if St='QUIT' then Break;
		Read(Tmp);
		Price:=MaxSize-Round(Tmp*100)+1; //max -> min
		if St='BID' then
			TreeArray_Modify(Price,1)
		else if St='DEL' then
			TreeArray_Modify(Price,-1)
		else if St='SALE' then
		begin
			Read(Times);
			Inc(Total,Min(Times,TreeArray_Count(Price)));
		end;
		Readln;
	end;
	Writeln(Total/100:0:2);
end;
begin
	Main;
end.