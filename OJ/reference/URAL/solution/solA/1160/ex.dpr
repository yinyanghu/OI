{
	MST O(MlogM)
}
program Ural_1160(Input,Output);
const
	MaxN=1000;
	MaxM=15000;
type
	TIndex=Longint;
	TFather=array[1..MaxN]of TIndex;
	TEdge=record
		x,y,w:TIndex;
	end;
	TEdgeSet=array[1..MaxM]of TEdge;
var
	N,M:TIndex;
	Father:TFather;
	Edge:TEdgeSet;

function Find(x:TIndex):TIndex;
begin
	if Father[x]<0 then 
		Result:=x
	else
	begin
		Father[x]:=Find(Father[x]);
		Result:=Father[x];
	end;
end;
function Merge(x,y:TIndex):Boolean;
begin
	x:=Find(x);
	y:=Find(y);
	Result:=(x<>y);
	if x=y then Exit;
	Father[x]:=y;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TEdge;
begin
	i:=l;
	j:=r;
	Mid:=Edge[Random(j-i+1)+i];
	repeat
		while Edge[i].w<Mid.w do Inc(i);
		while Edge[j].w>Mid.w do Dec(j);
		if i<=j then
		begin
			Tmp:=Edge[i];
			Edge[i]:=Edge[j];
			Edge[j]:=Tmp;
			Inc(i);
			DeC(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure Main;
var
	i:TIndex;
	Max:TIndex;
	Num:TIndex;
begin
	Readln(N,M);
	for i:=1 to M do
		with Edge[i] do
			Readln(x,y,w);
	Randomize;
	QuickSort(1,M);
	
	FillChar(Father,SizeOf(Father),255);
	Max:=0;
	Num:=0;
	for i:=1 to M do
		with Edge[i] do
			if Merge(x,y) then
			begin
				if w>Max then Max:=w;
				w:=-w;
				Inc(Num);
				if Num=N-1 then Break;
			end;
	Writeln(Max);
	Writeln(N-1);
	Num:=0;
	for i:=1 to M do
		with Edge[i] do
			if w<0 then 
			begin
				Writeln(x,' ',y);
				Inc(Num);
				if Num=N-1 then Break;
			end;
end;
begin
	Main;
end.