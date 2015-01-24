{
	Author: Amber
	Method: Greedy
	Clarity: 
		ki = [xi/y*m] or [xi/y*m]+1 only.
		
		Let ki=[xi/y*m] firstly, so it may remaining some coins.
		diff=|ki/m-xi/y|
		Sort robber by diff, and distribute remaining coins to robbers (a man gets a added coin) by diff desc order.
	Complexity: O(nlogn)
}
program SGU_207(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TData=array[1..MaxN]of TIndex;
	TOrder=array[1..MaxN]of TIndex;
var
	N,M,Y:TIndex;
	P:TOrder;
	K,X:TData;
	
function Compare(i,j:TIndex):TIndex;
begin
	Result:=(X[i]*M-K[i]*Y)-(X[j]*M-K[j]*Y);
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=P[i];
	repeat
		while Compare(P[i],Mid)<0 do Inc(i);
		while Compare(Mid,P[j])<0 do Dec(j);
		if i<=j then
		begin
			Tmp:=P[i];
			P[i]:=P[j];
			P[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure Main;
var
	i:TIndex;
	S:TIndex;
begin
	Readln(N,M,Y);
	S:=0;
	for i:=1 to N do
	begin
		Read(X[i]);
		K[i]:=Trunc(X[i]/Y*M);
		Inc(S,K[i]);
		P[i]:=i;
	end;
	Readln;
	QuickSort(1,N);
	i:=N;
	while (S<M) and (i>=1) do
	begin
		Inc(K[P[i]]);
		Inc(S);
		Dec(i);
	end;
	Write(K[1]);
	for i:=2 to N do
		Write(' ',K[i]);
	Writeln;
end;
begin
	Main;
end.
