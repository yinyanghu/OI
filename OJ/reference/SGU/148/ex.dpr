{
	Author: Amber
	Method: Enumerate+Optimize
	Clarity:
		确定了减压的第一层，就可以模拟出来一个计划了.O(n)
		枚举所有的减压的第一层，计算出计划的价格，取最优。
		单调性优化：从下往上处理, 注意到所有层都只可能从付钱到不付钱。
		Sum(i)=SUM(Water(i)|i=n to i)
		j为当前枚举层, 对于i>j,若有 Limit(i)<Sum(j)-Sum(i+1)，则扣掉第i层的钱。
		这可以通过排序Sum(i+1)+Limit(i)实现。
	Notice:
		It will get MLE at 4 by QuickSort. (1349 kb)
		It got AC by Heapsort. (449kb)
}
program SGU_148(Input,Output);
const
	MaxN=15000;
	MaxValue=MaxLongint div 2;
type
	TIndex=Smallint;
	TValue=Longint;
	TData=array[1..MaxN]of TIndex;
	TNeed=array[1..MaxN+1]of TValue;
	TOrder=array[1..MaxN+1]of TIndex;
var
	N:TIndex;
	Water,Limit,Price:TData;
	Need:TNeed;
	P:TOrder;
function Compare(i,j:TIndex):TValue;
begin
	Result:=Need[i]-Need[j];
end;
procedure Sift(l,r:TIndex);
var
	i,j:TIndex;
	Tmp:TIndex;
begin
	i:=l;
	j:=i*2;
	Tmp:=P[i];
	while j<=r do
	begin
		if (j<r) and (Compare(P[j],P[j+1])<0) then Inc(j);
		if Compare(Tmp,P[j])<0 then
		begin
			P[i]:=P[j];
			i:=j;
			j:=i*2;
		end
		else
			Break;
	end;
	P[i]:=Tmp;
end;
procedure HeapSort;
var
	i:TIndex;
	Tmp:TIndex;
begin
	for i:=N div 2 downto 1 do
		Sift(i,N);
	for i:=N downto 2 do
	begin
		Tmp:=P[1];
		P[1]:=P[i];
		P[i]:=Tmp;
		Sift(1,i-1);
	end;
end;
procedure Main;
var
	i,j:TIndex;
	Sum,Cost,Best:TValue;
	BestInd:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		Readln(Water[i],Limit[i],Price[i]);
	
	Sum:=0;
	for i:=N downto 1 do
	begin
		Need[i]:=Sum+Limit[i];
		P[i]:=i;
		Inc(Sum,Water[i]);
	end;
	HeapSort;
	P[N+1]:=N+1;
	Need[N+1]:=MaxValue;
	
	Best:=MaxValue;
	BestInd:=0;
	Cost:=0;
	Sum:=0;
	j:=1;
	for i:=N downto 1 do
	begin
		Inc(Cost,Price[i]);
		Inc(Sum,Water[i]);
		while (j<=N) and (Need[P[j]]<Sum) do
		begin
			Dec(Cost,Price[P[j]]);
			Inc(j);
		end;
		if Cost<Best then
		begin
			Best:=Cost;
			BestInd:=i;
		end;
	end;
	
	Sum:=0;
	for i:=BestInd to N do
	begin
		Inc(Sum,Water[i]);
		if Sum<=Limit[i] then Writeln(i);
	end;
end;
begin
	Main;
end.
