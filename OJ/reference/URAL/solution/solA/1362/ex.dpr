{
	Method: DP+Greedy
	Greedy:
	给出一列数,求它的一个排列,使得所有(序数+数值)的最大值最小.
	把这列数逆序排序即可.
	证明?
	
}
program Ural_1362(Input,Output);
const
	MaxN=100000;
type
	TIndex=Longint;
	TNext=array[1..MaxN*2-2]of TIndex;
	TPrev=array[1..MaxN*2-2]of TIndex;
	TLast=array[1..MaxN]of TIndex;
	TUsed=array[1..MaxN]of Boolean;
	TValue=array[1..MaxN*2]of TIndex; //为了统计count方便,不是紧凑的
	TCount=array[1..MaxN]of TIndex; 
var
	N:TIndex;
	Num:TIndex;
	Next:TNext;
	Prev:TPrev;
	Last:TLast;
	Used:TUsed;
	Value:TValue;
	Count:TCount;

procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	if l>=r then Exit;
	i:=l;
	j:=r;
	Mid:=Value[Random(j-i+1)+l];
	repeat
		while Value[i]<Mid do Inc(i);
		while Value[j]>Mid do Dec(j);
		if i<=j then
		begin
			Tmp:=Value[i];
			Value[i]:=Value[j];
			Value[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
function DFS(Cur:TIndex):TIndex;
var
	Start,Offset:TIndex;
	Ptr:TIndex;
begin
	Used[Cur]:=true;
	Offset:=Num;
	Start:=Offset;
	Inc(Num,Count[Cur]);
	Ptr:=Last[Cur];
	while Ptr>0 do
	begin
		if not Used[Next[Ptr]] then
		begin
			Inc(Offset);
			Value[Offset]:=DFS(Next[Ptr]);
		end;
		Ptr:=Prev[Ptr];
	end;
	QuickSort(Start+1,Offset);
	Result:=0;
	for Ptr:=1 to Offset-Start do 
		if Value[Offset-Ptr+1]+Ptr>Result then
			Result:=Value[Offset-Ptr+1]+Ptr;
end;
procedure Main;
var
	i,j:TIndex;
	M:TIndex;
begin
	Randomize;
	Readln(N);
	M:=0;
	FillChar(Last,SizeOf(Last),0);
	FillChar(Count,SizeOf(Count),0);
	for i:=1 to N do
		while true do
		begin
			Read(j);
			if j=0 then Break;
			Inc(Count[i]);
			Inc(Count[j]);
			Inc(M);
			Next[M]:=j;
			Prev[M]:=Last[i];
			Last[i]:=M;
			Inc(M);
			Next[M]:=i;
			Prev[M]:=Last[j];
			Last[j]:=M;
		end;
	Readln(i);
	FillChar(Used,SizeOf(Used),0);
	Num:=0;
	Writeln(DFS(i));
end;
begin
	Main;
end.