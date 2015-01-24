{
	Author: Amber
	Method: Filter
	Version: 1 (Filter)
	Clarity:
		Do filtering as filtering primes: N generates D(N) and filters D(N) from small to large.
		1)Cuz D(N)-N<=9*lgN, use Loop queue O(9*lgMaxN) in memory.
		2)Pre-calculate the digit sums from 0000 to 9999 to Sum[i].
			So the time of D(N) is reduced from O(lgN) (digit by digit) 
			to O(2) (4 digits by 4 digits, and N is O(10^7))
		3)sort the query
	Complexity: O(Sqrt(MaxN)*lgSqrt(MaxN)) for pre-processing the sum 
				O(MlogM) for sorting the querys
				O(N) for filtering
	Real time: 1134 ms
	Notice:
		1)It's Read not Readln.
		2)There may be two same querys!!
}
program SGU_108(Input,Output);
const
	MaxN=10000000;
	MaxM=5000;
	Block=10000;
	QueueLen=100;//>lgMaxN*9
type
	TIndex=Longint;
	TQuery=array[1..MaxM]of record
		Ask,Answer:TIndex;
	end;
	TOrder=array[1..MaxM]of TIndex;
	TQueue=array[0..QueueLen-1]of Boolean;
	TSum=array[0..Block-1]of TIndex;
var
	N,M:TIndex;
	Sum:TSum;
	Queue:TQueue;
	Query:TQuery;
	Order:TOrder;
	Count:TIndex;

procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=Order[i+Random(j-i+1)];
	repeat
		while Query[Order[i]].Ask<Query[Mid].Ask do Inc(i);
		while Query[Order[j]].Ask>Query[Mid].Ask do Dec(j);
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
procedure Preprocess_Sum;
var
	i:TIndex;
	T:TIndex;
begin
	for i:=0 to Block-1 do
	begin
		Sum[i]:=0;
		T:=i;
		while T>0 do
		begin
			Inc(Sum[i],T mod 10);
			T:=T div 10;
		end;
	end;
end;
procedure Main;
var
	i:TIndex;
	Cur,Ptr,Next:TIndex;
begin
	Preprocess_Sum;
	Read(N,M);
	for i:=1 to M do
	begin
		Read(Query[i].Ask);
		Order[i]:=i;
	end;
	Randomize;
	QuickSort(1,M);
	Cur:=0;
	FillChar(Queue,SizeOf(Queue),true);
	Ptr:=1;
	Count:=0;
	for i:=1 to N do
	begin
		if Queue[Cur] then
		begin
			Inc(Count);
			while (Ptr<=M) and (Query[Order[Ptr]].Ask=Count) do
			begin
				Query[Order[Ptr]].Answer:=i;
				Inc(Ptr);
			end;
		end;
		Next:=Cur+Sum[i div Block]+Sum[i mod Block];
		if Next>=QueueLen then Dec(Next,QueueLen);
		Queue[Next]:=false;
		Queue[Cur]:=true;
		Inc(Cur);
		if Cur=QueueLen then Cur:=0;
	end;
	Writeln(Count);
	Write(Query[1].Answer);
	for i:=2 to M do
		Write(' ',Query[i].Answer);
	Writeln;
end;
begin
	Main;
end.