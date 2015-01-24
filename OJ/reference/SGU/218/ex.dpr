{
	Author: Amber
	Method: Binary Search+Match
	Clarity: Max-Min Match Problem
	Complexity: O(NMlogW), W denotes the Weight Range.
	Notice:
		1.It's important to match unmatch nodes firstly.
		2.Weight may be negative.
}
program SGU_218(Input,Output);
const
	MaxN=500;
	MaxValue=1000000;
type
	TIndex=Longint;
	TGraph=array[1..MaxN,1..MaxN]of TIndex;
	TCover=array[1..MaxN]of Boolean;
	TLink=array[1..MaxN]of TIndex;
var 
	N:TIndex;
	Graph:TGraph;
	Limit:TIndex;
	Cover:TCover;
	Link:TLink;

function FindPath(u:TIndex):Boolean;
var
	v:TIndex;
	p:TIndex;
begin
	Result:=true;
	if u=0 then Exit;
	for p:=0 to 1 do
		for v:=1 to N do
			if (Graph[u,v]<=Limit) and not Cover[v] 
			and ((Link[v]+p=0) xor (Link[v]*p>0)) then 
				//it's important to match unmatch nodes firstly! that gets 443ms, otherwise 5734 ms.
			begin
				Cover[v]:=true;
				if (Link[v]=0) or FindPath(Link[v]) then
				begin
					Link[v]:=u;
					Exit;
				end;
			end;
	Result:=false;
end;

function Match:Boolean;
var 
	u:TIndex;
begin
	FillChar(Link,SizeOf(Link),0);
	Result:=false;
	for u:=1 to N do
	begin
		FillChar(Cover,SizeOf(Cover),false);
		if not FindPath(u) then Exit;
	end;
	Result:=true;
end;

procedure Main;
var 
	u,v:TIndex;
	Left,Right:TIndex;
	Min:TIndex;
	Best:TLink;
begin
	//Init
	Readln(N);
	Left:=MaxValue;
	Right:=-MaxValue;
	for u:=1 to N do
	begin
		for v:=1 to N do
		begin
			Read(Graph[u,v]);
			if Graph[u,v]<Left then Left:=Graph[u,v];
			if Graph[u,v]>Right then Right:=Graph[u,v];
		end;
		Readln;
	end;
	//Binary search and Match
	Min:=MaxValue;
	while Left<=Right do
	begin
		Limit:=(Left+Right) div 2;
		if not Match then 
			Left:=Limit+1
		else 
		begin
			Right:=Limit-1;
			if Limit<Min then 
			begin
				Min:=Limit;
				for u:=1 to N do
					Best[Link[u]]:=u;
			end;
		end;
	end;
	//Print
	Writeln(Min);
	for u:=1 to N do
		Writeln(u,' ',Best[u]);
end;
begin
	Main;
end.