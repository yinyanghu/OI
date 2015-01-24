{
	Author: Amber
	Method: DP+HP
	Clarity:
		由于放上一个rook,就等价于删去其所在列和行。所以有序化的数据后，问题是等价的。
		f(n,k)=f(n-1,k-1)*(r(n)-(k-1)) //选
		       +f(n-1,k) //不选
		可用滚动数组优化。
	Complexity: O(NK), Here HP operation is considered O(1).
	Notice:
		可以透过"沟"攻击, 比如下面p可以攻击q.
		xxp
		x
		xxq
}
program SGU_269(Input,Output);
const
	MaxN=250;
	MaxK=250;
	BitLen=6;
	Bit=1000000;
	MaxLen=120;
type
	TIndex=Longint;
	THP=record
		Len:TIndex;
		D:array[1..MaxLen]of Longint;
	end;
	TRow=array[1..MaxN]of TIndex;
	TDP=array[0..MaxK]of THP;
var
	N,K:TIndex;
	B:TRow;
	F:TDP;

procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=B[(i+j) div 2];
	repeat
		while B[i]<Mid do Inc(i);
		while Mid<B[j] do Dec(j);
		if i<=j then
		begin
			Tmp:=B[i];
			B[i]:=B[j];
			B[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure AddMultiply(var A:THP;const B:THP;C:TIndex);
var
	i:TIndex;
	R:TIndex;
begin
	if C=0 then Exit;
	R:=0;
	i:=1;
	while (i<=B.Len) or (R>0) do
	begin
		if i<=B.Len then Inc(R,B.D[i]*C);
		Inc(A.D[i],R);
		R:=A.D[i] div Bit;
		A.D[i]:=A.D[i] mod Bit;
		Inc(i);
	end;
	if i-1>A.Len then A.Len:=i-1;
end;
procedure Main;
var
	i,j:TIndex;
	St:String[BitLen];
begin
	//Read data
	Readln(N,K);
	for i:=1 to N do
		Read(B[i]);
	Readln;
	QuickSort(1,N);
	//Fill Zero
	for i:=0 to K do
	begin
		FillChar(F[i],SizeOf(F[i]),0);
		F[i].Len:=1;
	end;
	//Init for Dp
	F[0].D[1]:=1;
	//Dp
	for i:=1 to N do
		for j:=K downto 1 do
			AddMultiply(F[j],F[j-1],B[i]-j+1);
	//Print
	Write(F[K].D[F[K].Len]);
	for i:=F[K].Len-1 downto 1 do
	begin
		Str(F[K].D[i]:BitLen,St);
		for j:=1 to BitLen do
			if St[j]=' ' then
				St[j]:='0';
		Write(St);
	end;
	Writeln;
end;
begin
	Main;
end.