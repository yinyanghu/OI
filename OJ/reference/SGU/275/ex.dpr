{
	Author: Amber
	Method: Recursion
	Clarity:
		问题:二进制下L位的N个数Ai,选出一些,按xor运算,组成L位的最大的数X.
		可以这样以递归思想处理:
			0.重复1-4,直到L=1
			1.找出一个第L位为1的数A(i),找到转2,否则转4
			2.若X的第L位为0,则X=X xor A(i).
			3.使所有第L位为1的数A(j), A(j)'=A(j) xor A(i) 
			4.这样问题的规模减小到: L-1位的N个数Ai',组成L-1位的最大数X'.
		由于可能有A(i)'=A(i) xor A(j), 
		所以这样处理出的X,就有很多个相同项: X=(A1 xor A1 xor ... xor A1) xor (A2 xor A2 xor ... xor A2) xor ...
		但由于有P xor P=0,可以两两消掉相同项.这样的X就是题目所求的X,X=A(i1) xor A(i2) xor ...,此法是可行的.
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
