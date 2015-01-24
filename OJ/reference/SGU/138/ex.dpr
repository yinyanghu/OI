{
	Author: Amber
	Method: Construct
	Clarity: 
		����������,���ڱ�֤�н�,��ೡ���Ǹ��˲��ᳬ���ܺ͵�һ��(�����Լ����Լ���).
		���԰����·��������һ��(��һ��Ϊwin,�ڶ���lose)
		�������δӴ�С���������һ��,��ֻʣһ������ڶ���ȥ.
		win lose
		x
		x
		x
		y   x
		y
		z   y
		z
		...
		����ʣ�µ���ڶ���û��ĵط�.
	Complexity: O(N)
}
program SGU_138(Input,Output);
const
	MaxN=100;
	MaxG=10000;
type
	TIndex=Longint;
	TOrder=array[1..MaxN]of TIndex;
	TCount=array[0..MaxN]of TIndex;
	TList=array[1..MaxG]of TIndex;
var
	N,Sum:TIndex;
	Order:TOrder;
	Count:TCount;
	Win,Lose:TList;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=Order[(i+j) div 2];
	repeat
		while Count[Order[i]]<Count[Mid] do Inc(i);
		while Count[Mid]<Count[Order[j]] do Dec(j);
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
	i,j:TIndex;
begin
	Readln(N);
	Sum:=0;
	for i:=1 to N do
	begin
		Read(Count[i]);
		Order[i]:=i;
		Inc(Sum,Count[i]);
	end;
	Readln;
	QuickSort(1,N);
	FillChar(Win,SizeOf(Win),0);
	FillChar(Lose,SizeOf(Lose),0);
	j:=N;
	for i:=1 to Sum div 2 do
	begin
		if Count[Order[j]]=1 then
		begin
			Lose[i]:=Order[j];
			Dec(Count[Order[j]]);
			Dec(j);
		end;
		Win[i]:=Order[j];
		Dec(Count[Order[j]]);
	end;
	for i:=1 to Sum div 2 do
	begin
		if Lose[i]>0 then Continue;
		while Count[Order[j]]=0 do Dec(j);
		Lose[i]:=Order[j];
		Dec(Count[Order[j]]);
	end;
	Writeln(Sum div 2);
	for i:=1 to Sum div 2 do
		Writeln(Win[i],' ',Lose[i]);
end;
begin
	Main;
end.