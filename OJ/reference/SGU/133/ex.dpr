{
	Author: Amber
	Method: Sort and Count
	Complexity: 
		O(nlogn) for sort
		O(n) for scan
}
program SGU_133(Input,Output);
const
	MaxN=16000;
type
	TIndex=Longint;
	TSegment=record
		Left,Right:TIndex;
	end;
	TSegmentSet=array[1..MaxN]of TSegment;
	TOrder=array[1..MaxN]of TIndex;
var
	N:TIndex;
	S:TSegmentSet;
	P:TOrder;
function Compare(const A,B:TSegment):TIndex;
begin
	Result:=A.Left-B.Left;
	if Result=0 then Result:=A.Right-B.Right;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=P[Random(j-i+1)+i];
	repeat
		while Compare(S[P[i]],S[Mid])<0 do Inc(i);
		while Compare(S[Mid],S[P[j]])<0 do Dec(j);
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
	i,j:TIndex;
	Count:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Readln(S[i].Left,S[i].Right);
		P[i]:=i;
	end;
	Randomize;
	QuickSort(1,N);
	j:=1;
	Count:=1;
	for i:=2 to N do
	begin
		if (S[P[i]].Left=S[P[j]].Left) or (S[P[i]].Right>=S[P[j]].Right) then 
		begin
			j:=i;
			Inc(Count);
		end;
	end;
	Writeln(N-Count);
end;
begin
	Main;
end.