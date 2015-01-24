{
	Trie
}
program Ural_1414(Input,Output);
const
	MaxSize=10000*20+100;
type
	TIndex=Longint;
	PIndex=^TIndex;
	TTrie=record
		Size:TIndex;
		Text:array[1..MaxSize]of Char;
		Child,Next:array[1..MaxSize]of TIndex;
		EndWord:array[1..MaxSize]of Boolean;
	end;
var
	T:TTrie;
	Count:TIndex;
	Answer:String;
function GetChild(Ptr:TIndex;Ch:Char;var Last:PIndex):TIndex;
begin
	with T do
	begin
		Result:=0;
		Last:=@Child[Ptr];
		Ptr:=Child[Ptr];
		while Ptr>0 do
		begin
			if Text[Ptr]>Ch then Exit;
			if Text[Ptr]=Ch then Break;
			Last:=@Next[Ptr];
			Ptr:=Next[Ptr];
		end;
		Result:=Ptr;
	end;
end;
procedure InsertWord(const St:String);
var
	i:TIndex;
	Ins:PIndex;
	Ptr,Tmp:TIndex;
begin
	with T do
	begin
		Ptr:=1;
		for i:=1 to Length(St) do
		begin
			Tmp:=GetChild(Ptr,St[i],Ins);
			if Tmp=0 then
			begin
				Inc(Size);
				Text[Size]:=St[i];
				Next[Size]:=Ins^;
				Ins^:=Size;
				Tmp:=Size;
			end;
			Ptr:=Tmp;
		end;
		EndWord[Ptr]:=true;
	end;
end;
procedure DFS(Ptr:TIndex);
begin
	with T do
	begin
		if EndWord[Ptr] then
		begin
			Writeln('  ',Answer);
			Inc(Count);
		end;
		if Count=20 then Exit;
		Ptr:=Child[Ptr];
		while Ptr>0 do
		begin
			Answer:=Answer+Text[Ptr];
			DFS(Ptr);
			Delete(Answer,Length(Answer),1);
			if Count=20 then Exit;
			Ptr:=Next[Ptr];
		end;
	end;
end;
procedure FindPrefix(const St:String);
var
	i:TIndex;
	Ptr:TIndex;
begin
	with T do
	begin
		Writeln(St);
		Ptr:=1;
		for i:=1 to Length(St) do
		begin
			Ptr:=Child[Ptr];
			while Ptr>0 do
			begin
				if Text[Ptr]>St[i] then Exit;
				if Text[Ptr]=St[i] then Break;
				Ptr:=Next[Ptr];
			end;
			if Ptr=0 then Exit;
		end;
		Count:=0;
		Answer:=St;
		DFS(Ptr);
	end;
end;
procedure Main;
var
	Ch:Char;
	St:String;
begin
	FillChar(T,SizeOf(T),0);
	T.Size:=1;
	InsertWord('sun');
	while not Eof do
	begin
		Read(Ch);
		Readln(St);
		if Ch='?' then
			FindPrefix(St)
		else if Ch='+' then
			InsertWord(St);
	end;
end;
begin
	Main;
end.