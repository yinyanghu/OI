{
	Method:
	Static BST based on dispersing value
	TLE at 6
}
program Ural_1316(Input,Output);
const
	MaxN=100000+1;
type
	TIndex=Longint;
	TOperation=array[1..MaxN]of record
		Command:Char;
		Value,Times:TIndex;
	end;
	TCount=Int64;
	TSBSTArray=array[1..MaxN]of TIndex;
var
	N,M:TIndex;
	Total:TCount;
	Value,Count:TSBSTArray;
	Operation:TOperation;

procedure Add(X:TIndex);
var
	Left,Right,Mid:TIndex;
begin
	Left:=1;
	Right:=N;
	while Left<=Right do
	begin
		Mid:=(Left+Right) div 2;
		if X<Value[Mid] then
			Right:=Mid-1
		else if X>Value[Mid] then
		begin
			Left:=Mid+1;
			Inc(Count[Mid]);
		end 
		else 
		begin
			Inc(Count[Mid]);
			Break;
		end;
	end;
end;
procedure Del(X:TIndex);
var
	Left,Right,Mid:TIndex;
begin
	Left:=1;
	Right:=N;
	while Left<=Right do
	begin
		Mid:=(Left+Right) div 2;
		if X<Value[Mid] then
			Right:=Mid-1
		else if X>Value[Mid] then
		begin
			Left:=Mid+1;
			Dec(Count[Mid]);
		end 
		else 
		begin
			Dec(Count[Mid]);
			Break;
		end;
	end;
end;
function GetCount(X:TIndex):TIndex;
var
	Left,Right,Mid:TIndex;
begin
	Left:=1;
	Right:=N;
	Result:=0;
	while Left<=Right do
	begin
		Mid:=(Left+Right) div 2;
		if X<Value[Mid] then
		begin
			Right:=Mid-1;
			Inc(Result,Count[Mid]);
		end
		else if X>Value[Mid] then
			Left:=Mid+1
		else 
		begin
			Inc(Result,Count[Mid]);
			Break;
		end;
	end;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	X,T:TIndex;
begin
	i:=l;
	j:=r;
	X:=Value[(i+j) div 2];
	repeat
		while Value[i]<X do Inc(i);
		while X<Value[j] do Dec(j);
		if i<=j then
		begin
			T:=Value[i];
			Value[i]:=Value[j];
			Value[j]:=T;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
function UniqueValue(N:TIndex):TIndex;
var
	i,j:TIndex;
begin
	i:=1;
	Result:=0;
	while i<=N do
	begin
		j:=i;
		while (Value[i]=Value[j+1]) and (j+1<=N) do Inc(j);
		Inc(Result);
		Value[Result]:=Value[i];
		i:=j+1;
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
procedure Main;
var
	i:TIndex;
	Ch:Char;
	St:String;
	Times:TIndex;
	X:Extended;
begin
	M:=0;
	repeat
		ReadWord(St);
		Ch:=St[1];
		if Ch='Q' then Break;
		Inc(M);
		Operation[M].Command:=Ch;
		if (Ch='B') or (Ch='D') then 
		begin
			Readln(X);
			Operation[M].Value:=Round(X*100);
		end
		else
		begin
			Readln(X,Operation[M].Times);
			Operation[M].Value:=Round(X*100);
		end;
	until false;

	N:=M;
	for i:=1 to N do
		Value[i]:=Operation[i].Value;
	QuickSort(1,N);
	N:=UniqueValue(N);

	Total:=0;
	FillChar(Count,SizeOf(Count),0);
	for i:=1 to M do 
		case Operation[i].Command of
			'B':Add(Operation[i].Value);
			'D':Del(Operation[i].Value);
			'S':
			begin
				Times:=GetCount(Operation[i].Value);
				if Times>Operation[i].Times then 
					Inc(Total,Operation[i].Times)
				else 
					Inc(Total,Times);
			end;
		end;
	Writeln(Total/100:0:2);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.