{
	Author: Amber
	Method: Construct
	Clarity: 
		�����������L[x],����L[x],L[x+1]�������ڶ��塣
		N   L
		L1: 000 001
		L2: 000 001 011 010
		L3: 000 001 011 010 110 111 101 100
		....
		���Է��� Ln �� L(n-1) �� L(n-1)�ķ�ת(ǰ����һ��1)���
		���Կ��Թ����L.

		��MatrixΪD[x,y]
		ģ������ı���P[x,y]=(x-1)*M+y
		�����D[x,y]=L[x]*2^m+L[y]
	Complexity: O(2^(n+m))
}
program SGU_249(Input,Output);
const
	MaxN=20;
type
	TIndex=Longint;
	TData=Longint;
	TLine=array[0..1 shl MaxN-1]of TData;
var
	N,M:TIndex;
	Line:TLine;
procedure Construct(P:TIndex);
var
	i,j:TIndex;
	T:TIndex;
begin
	Line[0]:=0;
	Line[1]:=1;
	for i:=1 to P-1 do
	begin
		T:=1 shl i;
		for j:=0 to T-1 do
			Line[T+j]:=T xor Line[T-1-j];
	end;
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(N,M);
	if N>M then 
		Construct(N)
	else
		Construct(M);
	for i:=0 to 1 shl N-1 do
	begin
		for j:=0 to 1 shl M-1 do
		begin
			if j>0 then Write(' ');
			Write(Line[i] shl M xor Line[j]);
		end;
		Writeln;
	end;
end;
begin
	Main;
end.