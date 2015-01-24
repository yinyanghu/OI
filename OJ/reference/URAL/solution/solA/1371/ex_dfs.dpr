{$M 2097152} //It's very important thing! Otherwise, Stack Overflow.
program Ural_1371(Input,Output);
const
	MaxN=50000;
	MaxM=MaxN*2;
type
	TIndex=Longint;
	TData=Int64;
	TUsed=array[1..MaxN]of Boolean;
	TLast=array[1..MaxN]of TIndex;
	TEdge=array[1..MaxM]of record
		PtrTo,Weight:TIndex;
		Prev:TIndex;
	end;
	TChildNum=array[1..MaxN]of TIndex;
var
	N:TIndex;
	Used:TUsed;
	Last:TLast;
	Edge:TEdge;
	Total:TData;
	ChildNum:TChildNum;

function GetChildNum(Cur:TIndex):TIndex;
var
	Ptr:TIndex;
begin
	Result:=1;
	Used[Cur]:=true;
	Ptr:=Last[Cur];
	while Ptr>0 do
	begin
		with Edge[Ptr] do
			if not Used[PtrTo] then
				Inc(Result,GetChildNum(PtrTo));
		Ptr:=Edge[Ptr].Prev;
	end;
	ChildNum[Cur]:=Result;
end;

function GetDistSum(Cur:TIndex):TData;
var
	Ptr:TIndex;
	DistSum:TData;
begin
	Result:=0;
	Used[Cur]:=true;
	Ptr:=Last[Cur];
	while Ptr>0 do
	begin
		with Edge[Ptr] do
			if not Used[PtrTo] then
			begin
				DistSum:=GetDistSum(PtrTo)+ChildNum[PtrTo]*Weight;
				Inc(Result,DistSum);
				Inc(Total,(ChildNum[Cur]-1-ChildNum[PtrTo])*DistSum);
			end;
		Ptr:=Edge[Ptr].Prev;
	end;
	Inc(Total,Result);
end;

procedure Main;
var
	i:TIndex;
	x,y,w:TIndex;
begin
	Readln(N);
	if N=1 then
	begin
		Writeln('0.0000');
		Exit;
	end;

	FillChar(Last,SizeOf(Last),0);
	for i:=1 to N-1 do
	begin
		Readln(x,y,w);

		Edge[i*2-1].PtrTo:=y;
		Edge[i*2-1].Weight:=w;
		Edge[i*2-1].Prev:=Last[x];
		Last[x]:=i*2-1;

		Edge[i*2].PtrTo:=x;
		Edge[i*2].Weight:=w;
		Edge[i*2].Prev:=Last[y];
		Last[y]:=i*2;
	end;

	Total:=0;
	FillChar(Used,SizeOf(Used),0);
	GetChildNum(1);
	FillChar(Used,SizeOf(Used),0);
	GetDistSum(1);

	Writeln(Total*2/N/(N-1):0:4);
end;
begin
	Main;
end.