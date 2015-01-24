{
	Author: Amber
	Method: Math + (Precompute + BinarySearch)
	Clarity:
		A means a sequence of the valid M.
		A(0)=1, A(n)=A(n-1)+n
		Seek for each query in A by binary search.
}
program SGU_255(Input,Output);
const
	N=65535;
	MaxLimit=MaxLongint;
type
	TIndex=Longint;
	TNumber=Longint;
	TData=array[0..N]of TNumber;
var
	D:TData;
function BinarySearch(Key:TNumber;Left,Right:TIndex):Boolean;
var
	Mid:TIndex;
begin
	Result:=true;
	while Left<=Right do
	begin
		Mid:=(Left+Right) div 2;
		if D[Mid]<Key then
			Left:=Mid+1
		else if Key<D[Mid] then
			Right:=Mid-1
		else
			Exit;
	end;
	Result:=false;
end;
procedure Main;
var
	i:TIndex;
	M:TNumber;
	TestNum:TIndex;
begin
	//Precompute
	D[0]:=1;
	for i:=1 to N do
		D[i]:=D[i-1]+i;
	Writeln(D[N]); //debug

	//Process
	Readln(TestNum);
	while TestNum>0 do
	begin
		Dec(TestNum);
		Readln(M);
		if BinarySearch(M,1,N) then
			Writeln('YES')
		else
			Writeln('NO');
	end;
end;
begin
	Main;
end.
