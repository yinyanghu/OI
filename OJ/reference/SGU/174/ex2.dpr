{
	Author: Amber
	Method: Disjoint-Set
	Clarity: 
		see version 1 (ex.dpr)
	Version: 2 (Hash)
	Complexiy: O(M)
	Notice:
		1) Hash value mustn't be negative!!! WA 1 times.
}
program SGU_174(Input,Output);
const
	MaxM=200000;
	MaxN=MaxM*2;
	MaxHashSize=MaxN*3-1;
type
	TIndex=Longint;
	TPoint=record
		x,y:TIndex;
	end;
	TPointSet=array[1..MaxN]of TPoint;
	TFather=array[1..MaxN]of TIndex;
	THash=array[0..MaxHashSize-1]of TIndex;
var
	N,M:TIndex;
	PointSet:TPointSet;
	Father:TFather;
	Hash:THash;

function Hash_Find(P:TPoint):TIndex;
var
	x:TIndex;
begin
	x:=Abs(Int64(P.x)*1000000000+Int64(P.y)*2) mod MaxHashSize;
	while Hash[x]>0 do
	begin
		with PointSet[Hash[x]] do
			if (x=P.x) and (y=P.y) then Break;
		Inc(x);
		if x=MaxHashSize then x:=0;
	end;
	//Create new value
	if Hash[x]=0 then
	begin
		Inc(N);
		PointSet[N]:=P;
		Hash[x]:=N;
	end;
	Result:=Hash[x];
end;
function Find(x:TIndex):TIndex;
begin
	if Father[x]<0 then
		Result:=x
	else
	begin
		Father[x]:=Find(Father[x]);
		Result:=Father[x];
	end;
end;
function Union(x,y:TIndex):Boolean; //T:x=y;F:else
begin
	Result:=true;
	if x=y then Exit;
	if Random(2)=0 then
		Father[y]:=x
	else 
		Father[x]:=y;
	Result:=false;
end;
procedure Main;
var
	i:TIndex;
	P,Q:TPoint;
begin
	Randomize;
	Readln(M);
	N:=0;
	FillChar(Father,SizeOf(Father),255);
	for i:=1 to M do
	begin
		Readln(P.x,P.y,Q.x,Q.y);
		if Union(Find(Hash_Find(P)),Find(Hash_Find(Q))) then
		begin
			Writeln(i);
			Exit;
		end;
	end;
	Writeln(0);
end;
begin
	Main;
end.