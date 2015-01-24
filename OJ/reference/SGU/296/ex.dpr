{
	Author: Amber
	Method: Greedy
	Clarity:
		For each K, delete the last digit of the non-increasing order from start point.
}
program SGU_296(Input,Output);
const
	MaxN=1000;
	Ch_DEL='?';
	Ch_MAX='@';
type
	TIndex=Longint;
	TData=array[0..MaxN+1]of Char;
var
	N,K:TIndex;
	D:TData;

function Prev(i:TIndex):TIndex;
begin
	repeat
		Dec(i);
	until D[i]<>Ch_DEL;
	Result:=i;
end;
function Next(i:TIndex):TIndex;
begin
	repeat
		Inc(i);
	until D[i]<>Ch_DEL;
	Result:=i;
end;
procedure Main;
var
	i,j:TIndex;
begin
	N:=0;
	repeat
		Inc(N);
		Read(D[N]);
	until D[N]=' ';
	D[0]:=Ch_MAX;
	Dec(N);
	D[N+1]:=Ch_MAX;
	Readln(K);

	i:=0;
	while K>0 do
	begin
		j:=Next(i);
		if D[i]<D[j] then
		begin
			D[i]:=Ch_DEL;
			Dec(K);
			i:=Prev(i);
		end
		else
			i:=j;
	end;
	for i:=1 to N do
		if D[i]<>Ch_DEL then
			Write(D[i]);
	Writeln;
end;
begin
	Main;
end.