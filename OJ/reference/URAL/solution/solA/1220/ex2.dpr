program Ural_1220(Input,Output);
const
	MaxNum=100000;
	MaxStack=1000;
type
	TIndex=Longint;
	TTopLink=array[1..MaxStack]of TIndex;
	TData=packed record
		Low:Word;
		High:LongWord;
	end;
	TDataSet=array[1..MaxNum]of TData;
var
	N:TIndex;
	Num:TIndex;
	Data:TDataSet;
	Top:TTopLink;
procedure Compress(var Data:TData;const Value,Prev:TIndex);
begin
	Data.High:=Value shl 1+Prev and 1;
	Data.Low:=Prev shr 1;
end;
procedure Decompress(const Data:TData;var Value,Prev:TIndex);
begin
	Value:=Data.High shr 1;
	Prev:=Data.Low shl 1+Data.High and 1;
end;
procedure Main;
var
	Ch:Char;
	Stack,Value,Prev:TIndex;
begin
	FillChar(Top,SizeOf(Top),0);
	Readln(N);
	Num:=0;
	while N>0 do
	begin
		Dec(N);
		Read(Ch,Ch,Ch,Ch);
		if Ch='H' then
		begin
			Readln(Stack,Value);
			Inc(Num);
			Compress(Data[Num],Value,Top[Stack]);
			Top[Stack]:=Num;
		end
		else
		begin
			Readln(Stack);
			Decompress(Data[Top[Stack]],Value,Prev);
			Top[Stack]:=Prev;
			Writeln(Value);
		end;
	end;
end;
begin
	Main;
end.