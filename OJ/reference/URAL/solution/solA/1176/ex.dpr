{
	Method: Euler Path
	Must use Stack.
	Using recursion, will got MLE.

	有向图路径不可逆, got WA 5 times.
}
program Ural_1176(Input,Output);
const
	MaxN=1000;
	MaxLen=32000;
type
	TIndex=Longint;
	TGraph=array[1..MaxN,1..MaxN div 8] of Byte;
	TStack=array[1..MaxLen]of TIndex;
	TMaxNext=array[1..MaxN]of TIndex;
	TWay=array[1..MaxLen]of TIndex;
var
	N:TIndex;
	G:TGraph;
	Top:TIndex;
	Stack:TStack;
	MaxNext:TMaxNext;
	Len:TIndex;
	Way:TWay;

procedure Next(i:TIndex);
begin
	Dec(G[i,(MaxNext[i]-1) shr 3+1], 1 shl ((MaxNext[i]-1) mod 8));
	repeat
		Dec(MaxNext[i]);
		if MaxNext[i]=0 then Break;
	until G[i,(MaxNext[i]-1) shr 3+1] and (1 shl ((MaxNext[i]-1) mod 8))>0;
end;
procedure Main;
var
	i,j:TIndex;
	X:TIndex;
begin
	FillChar(G,SizeOf(G),0);
	Top:=1;
	Readln(N,Stack[1]);
	for i:=1 to N do
	begin
		MaxNext[i]:=0;
		for j:=1 to N do
		begin
			Read(X);
			if i=j then Continue;
			if X=0 then 
			begin
				MaxNext[i]:=j;
				Inc(G[i,(j-1) shr 3+1], 1 shl ((j-1) mod 8));
			end;
		end;
		Readln;
	end;
	//Euler Path
	Len:=0;
	repeat
		while MaxNext[Stack[Top]]>0 do
		begin
			Stack[Top+1]:=MaxNext[Stack[Top]];
			Next(Stack[Top]);
			Inc(Top);
		end;
		Inc(Len);
		Way[Len]:=Stack[Top];
		Dec(Top);
	until Top=0;
	for i:=Len downto 2 do
		Writeln(Way[i],' ',Way[i-1]);
end;
begin
	Main;
end.