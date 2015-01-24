{
	Author: Amber
	Method: Recursion
	Clarity:
		����:��������Lλ��N����Ai,ѡ��һЩ,��xor����,���Lλ��������X.
		���������Եݹ�˼�봦��:
			0.�ظ�1-4,ֱ��L=1
			1.�ҳ�һ����LλΪ1����A(i),�ҵ�ת2,����ת4
			2.��X�ĵ�LλΪ0,��X=X xor A(i).
			3.ʹ���е�LλΪ1����A(j), A(j)'=A(j) xor A(i) 
			4.��������Ĺ�ģ��С��: L-1λ��N����Ai',���L-1λ�������X'.
		���ڿ�����A(i)'=A(i) xor A(j), 
		���������������X,���кܶ����ͬ��: X=(A1 xor A1 xor ... xor A1) xor (A2 xor A2 xor ... xor A2) xor ...
		��������P xor P=0,��������������ͬ��.������X������Ŀ�����X,X=A(i1) xor A(i2) xor ...,�˷��ǿ��е�.
	Complexity: O(64*N)
}
program SGU_275(Input,Output);
const
	MaxN=100;
type
	TIndex=Longint;
	TNumber=Int64;
	TData=array[1..MaxN]of TNumber;
var
	N:TIndex;
	D:TData;
	X:TNumber;
procedure Main;
var
	i,j,k:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		Read(D[i]);
	Readln;
	X:=0;
	for i:=63 downto 0 do
	begin
		k:=0;
		for j:=1 to N do
			if TNumber(1) shl i and D[j]>0 then 
			begin
				k:=j;
				Break;
			end;
		if k=0 then Continue;
		if TNumber(1) shl i and X=0 then X:=X xor D[k];
		for j:=1 to N do
			if (j<>k) and (TNumber(1) shl i and D[j]>0) then
				D[j]:=D[j] xor D[k];
		D[k]:=0;
	end;
	Writeln(X);
end;
begin
	Main;
end.
