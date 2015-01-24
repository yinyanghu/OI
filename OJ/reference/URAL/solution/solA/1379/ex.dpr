program Ural_1379(Input,Output);
const
	MaxN=500;
	MaxM=MaxN*MaxN;
	MaxValue=MaxLongint div 8;
	MaxCup=10000000;
	DayTimeLimit=1440;
	UnitWeight=100;
	BaseWeight=3*1000*1000;
type
	TIndex=Longint;
	TLast=array[1..MaxN]of TIndex;
	TEdge=array[1..MaxM]of record
		Prev,PtrTo,Limit,Time:TIndex;
	end;
	TCheck=array[1..MaxN]of Boolean;
	TDist=array[1..MaxN]of TIndex;
var
	N,M:TIndex;
	Last:TLast;
	Edge:TEdge;
	Check:TCheck;
	Dist:TDist;

function Dijkstra(UnitNum:TIndex):Boolean;
var
	i:TIndex;
	Ptr:TIndex;
	Min:TIndex;
	MinInd:TIndex;
begin
	Result:=false;
	for i:=1 to N do
	begin
		Dist[i]:=MaxValue;
		Check[i]:=false;
	end;
	Dist[1]:=0;
	while not Check[N] do
	begin
		Min:=MaxValue;
		MinInd:=0;
		for i:=1 to N do
			if not Check[i] and (Dist[i]<Min) then
			begin
				Min:=Dist[i];
				MinInd:=i;
			end;
		if MinInd=0 then Exit;
		if Min>DayTimeLimit then Exit; //Important cut
		Check[MinInd]:=true;
		Ptr:=Last[MinInd];
		while Ptr>0 do
		begin
			with Edge[Ptr] do
				if not Check[PtrTo] and (Limit>=UnitNum) and (Dist[PtrTo]>Dist[MinInd]+Time) then
					Dist[PtrTo]:=Dist[MinInd]+Time;
			Ptr:=Edge[Ptr].Prev;
		end;
	end;
	Result:=(Dist[N]<=DayTimeLimit);
end;
procedure Main;
var
	i:TIndex;
	x,y:TIndex;
	Time,Limit:TIndex;
	Left,Right,Mid:TIndex;
begin
	Readln(N,M);
	if N=1 then //WA for 5 times at test 2.
	begin
		Writeln(MaxCup);
		Exit;
	end;

	Left:=0;
	Right:=0;
	FillChar(Last,SizeOf(Last),0);
	for i:=1 to M do
	begin
		Readln(x,y,Time,Limit);
		Limit:=(Limit-BaseWeight) div UnitWeight;
		if Limit>Right then Right:=Limit;

		Edge[i].PtrTo:=y;
		Edge[i].Limit:=Limit;
		Edge[i].Time:=Time;
		Edge[i].Prev:=Last[x];
		Last[x]:=i;

		Edge[i+M].PtrTo:=x;
		Edge[i+M].Limit:=Limit;
		Edge[i+M].Time:=Time;
		Edge[i+M].Prev:=Last[y];
		Last[y]:=i+M;
	end;

	if Right>MaxCup then Right:=MaxCup;

	//Binary Search
	while Left<Right do
	begin
		Mid:=(Left+Right+1) div 2;
		if Dijkstra(Mid) then 
			Left:=Mid
		else 
			Right:=Mid-1;
	end;
	Writeln(Left);
end;
begin
	Main;
end.