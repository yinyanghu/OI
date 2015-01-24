{
	Author: Amber
	Method: Construct
	Version: 2 (Construct)
	Clarity:
		see version 1(see ex.dpr)
		这样找规律:
		输出答案的差分(see output.txt)
		x:y 表示连续y个x
		发现
		每20行一个15
		每200行一个28 
		每2000行一个41
		每20000行一个54
		......
	Complexity:
		O(Sqrt(MaxN)*lgSqrt(MaxN)) for pre-processing the sum 
		O(MlogM) for sorting the querys
		O(R) for constructing. R is the number of solution in range [1..N].
	Real time: 221 ms
}
program SGU_108(Input,Output);
const
	MaxM=5000;
	Block=10000;
type
	TIndex=Longint;
	TQuery=array[1..MaxM]of record
		Ask,Answer:TIndex;
	end;
	TOrder=array[1..MaxM]of TIndex;
	TSum=array[0..Block-1]of TIndex;
var
	N,M:TIndex;
	Sum:TSum;
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
function GetSum(x:TIndex):TIndex;
begin
	Result:=Sum[x div Block]+Sum[x mod Block];
end;
procedure Main;
var
	i:TIndex;
	Cur,Ptr,Tmp:TIndex;
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
	Ptr:=1;
	Count:=0;
	i:=1;
	while i<=N do
	begin
		Inc(Count);
		while (Ptr<=M) and (Query[Order[Ptr]].Ask=Count) do
		begin
			Query[Order[Ptr]].Answer:=i;
			Inc(Ptr);
		end;
		Tmp:=i mod 100;
		Cur:=Tmp-GetSum(i-Tmp);
		if(i<9) then Inc(i,2)
		else if(Cur=+7) then Inc(i,2)
		else if(Cur=+5) then Inc(i,15)
		else if(Cur=+3) then Inc(i,28)
		else if(Cur=+1) then Inc(i,41)
		else if(Cur=-1) then Inc(i,54)
		else Inc(i,11);
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