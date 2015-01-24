{
	Greedy: from last day to first day
}
program Ural_1403(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TOrder=record
		Time,Money,Index:TIndex;
	end;
	TOrderSet=array[0..MaxN]of TOrder;
	TList=array[1..MaxN]of TIndex;
	THeap=array[1..MaxN]of TIndex;
var
	N:TIndex;
	Order:TOrderSet;
	Num:TIndex;
	List:TList;
	Size:TIndex;
	Heap:THeap;
function Compare(x,y:TIndex):TIndex;
begin
	Result:=Order[x].Money-Order[y].Money;
end;
procedure Heap_Push(x:TIndex);
var
	i:TIndex;
begin
	Inc(Size);
	i:=Size;
	while (i>1) and (Compare(x,Heap[i div 2])>0) do
	begin
		Heap[i]:=Heap[i div 2];
		i:=i div 2;
	end;
	Heap[i]:=x;
end;
function Heap_Pop:TIndex;
var
	x:TIndex;
	i,j:TIndex;
begin
	Result:=Heap[1];
	x:=Heap[Size];
	Dec(Size);
	i:=1;
	j:=2;
	while (j<=Size) do
	begin
		if (j+1<=Size) and (Compare(Heap[j],Heap[j+1])<0) then Inc(j);
		if Compare(x,Heap[j])>=0 then Break;
		Heap[i]:=Heap[j];
		i:=j;
		j:=i*2;
	end;
	Heap[i]:=x;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TOrder;
begin
	i:=l;
	j:=r;
	Mid:=Order[(i+j) div 2];
	repeat
		while Order[i].Time<Mid.Time do Inc(i);
		while Order[j].Time>Mid.Time do Dec(j);
		if i<=j then
		begin
			Tmp:=Order[i];
			Order[i]:=Order[j];
			Order[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure Main;
var
	i:TIndex;
	CurTime,Times:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Readln(Order[i].Time,Order[i].Money);
		Order[i].Index:=i;
	end;
	QuickSort(1,N);

	Num:=0;
	Size:=0;
	Order[0].Time:=0;
	i:=N;
	repeat
		CurTime:=Order[i].Time;
		repeat
			Heap_Push(i);
			Dec(i);
		until Order[i].Time<CurTime;
		Times:=CurTime-Order[i].Time;
		repeat
			Dec(Times);
			Inc(Num);
			List[Num]:=Order[Heap_Pop].Index;
		until (Size=0) or (Times=0);
	until i=0;

	Writeln(Num);
	for i:=Num downto 1 do
		Write(List[i],' ');
	Writeln;
end;
begin
	Main;
end.