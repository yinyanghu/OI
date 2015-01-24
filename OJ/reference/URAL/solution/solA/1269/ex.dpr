{
	Trie Graph
	see Maigo's thesis 
}
program Ural_1269(Input,Output);
const
	MaxSize=100000;
	MaxValue=MaxLongint div 2;
type
	TIndex=Longint;
	TTrie=record
		Size:TIndex;
		Text:array[1..MaxSize]of Char;
		Child,Next,Suffix:array[1..MaxSize]of TIndex;
		Len:array[1..MaxSize]of TIndex;
	end;
	TQueue=array[1..MaxSize]of TIndex;
var
	N:TIndex;
	T:TTrie;
	Q:TQueue;

function GetChild(IsGraph:Boolean;Father:TIndex;Ch:Char):TIndex;
var
	Ptr:TIndex;
begin
	repeat
		Ptr:=T.Child[Father];
		while (Ptr>0) and (T.Text[Ptr]<>Ch) do Ptr:=T.Next[Ptr];
		if Ptr>0 then
		begin
			Result:=Ptr;
			Exit;
		end
		else if not IsGraph then
		begin
			Result:=0;
			Exit;
		end
		else if Father=1 then
		begin
			Result:=1;
			Exit;
		end
		else
			Father:=T.Suffix[Father];
	until false;
end;
procedure Bulid_Trie;
var
	Ptr,Cur,Len:TIndex;
	Ch:Char;
begin
	FillChar(T,SizeOf(T),0);
	Readln(N);
	T.Size:=1;
	while N>0 do
	begin
		Dec(N);
		Ptr:=1;
		Len:=0;
		while not Eoln do
		begin
			Inc(Len);
			Read(Ch);
			Cur:=GetChild(false,Ptr,Ch);
			if Cur>0 then
				Ptr:=Cur
			else
				with T do
				begin
					Inc(Size);
					Text[Size]:=Ch;
					Next[Size]:=Child[Ptr];
					Child[Ptr]:=Size;
					Ptr:=Size;
				end;
			if T.Len[Ptr]>0 then Break;
		end;
		Readln;
		T.Len[Ptr]:=Len;
	end;
end;
procedure Bulid_Graph;
var
	Pop,Push:TIndex;
	Ptr,Father:TIndex;
begin
	with T do
	begin
		Pop:=1;
		Push:=2;
		Q[1]:=1;
		Suffix[1]:=1;
		while Pop<Push do
		begin
			Father:=Q[Pop];
			Inc(Pop);
			Ptr:=Child[Father];
			while Ptr>0 do
			begin
				Q[Push]:=Ptr;
				Inc(Push);
				if Father=1 then 
					Suffix[Ptr]:=1
				else
					Suffix[Ptr]:=GetChild(true,Suffix[Father],Text[Ptr]);
				if Len[Suffix[Ptr]]>Len[Ptr] then Len[Ptr]:=Len[Suffix[Ptr]]; //Danger is the same as suffix.
				Ptr:=Next[Ptr];
			end;
		end;
	end;
end;
procedure Scan_Text;
var
	i:TIndex;
	Ch:Char;
	Ptr,Len,Min:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Min:=MaxValue;
		Ptr:=1;
		Len:=0;
		while not Eoln do
		begin
			Inc(Len);
			Read(Ch);
			Ptr:=GetChild(true,Ptr,Ch);
			if (T.Len[Ptr]>0) and (Len-T.Len[Ptr]<Min) then
				Min:=Len-T.Len[Ptr];
		end;
		Readln;
		if Min<MaxValue then
		begin
			Writeln(i,' ',Min+1);
			Exit;
		end;
	end;
	Writeln('Passed');
end;

procedure Main;
begin
	Bulid_Trie;
	Bulid_Graph;
	Scan_Text;
end;
begin
	Main;
end.