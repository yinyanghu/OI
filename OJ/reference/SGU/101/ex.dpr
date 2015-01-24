{
	Author: Amber
	Method: Euler Path
	Complexity: O(N^2)
}
program SGU_101(Input,Output);
const
	MaxN=100;
	Num=7;
type
	TIndex=Longint;
	TDegree=array[0..Num-1]of TIndex;
	TGraph=array[0..Num-1,0..Num-1]of TIndex;
	TDomino=array[1..MaxN]of record
		P,Q:TIndex;
		Used:Boolean;
	end;
	TVisited=array[0..Num-1]of Boolean;
	TStack=array[1..MaxN+1]of TIndex;
var
	N:TIndex;
	Degree:TDegree;
	Graph:TGraph;
	Domino:TDomino;
	Visited:TVisited;
	Top:TIndex;
	Last:TIndex;
	Stack:TStack;
procedure FloodFill(x:TIndex);
var
	i:TIndex;
begin
	Visited[x]:=true;
	for i:=0 to Num-1 do
		if not Visited[i] and (Graph[x,i]>0) then
			FloodFill(i);
end;
function Main:Boolean;
var
	i:TIndex;
	OddNum:TIndex;
begin
	Result:=false;
	FillChar(Degree,SizeOf(Degree),0);
	FillChar(Graph,SizeOf(Graph),0);
	Readln(N);
	for i:=1 to N do
		with Domino[i] do
		begin
			Readln(P,Q);
			Inc(Degree[P]);
			Inc(Degree[Q]);
			Inc(Graph[P,Q]);
			Inc(Graph[Q,P]);
			Used:=false;
		end;
		
	i:=0;
	while (i<Num-1) and (Degree[i]=0) do Inc(i);
	FillChar(Visited,SizeOf(Visited),0);
	if Degree[i]>0 then FloodFill(i);
	for i:=0 to Num-1 do
		if (Degree[i]>0) and not Visited[i] then
			Exit;

	OddNum:=0;
	for i:=0 to Num-1 do
		if Odd(Degree[i]) then Inc(OddNum);
	if OddNum>2 then Exit;
	
	i:=0;
	if OddNum=0 then
		while (i<Num-1) and (Degree[i]=0) do Inc(i)
	else //now OddNum=2
		while (i<Num-1) and not Odd(Degree[i]) do Inc(i);
	Stack[1]:=i;
	Top:=1;
	Last:=-1; //WA 1 times! not Last:=0 cuz the number of node may be 0.
	repeat
		i:=0;
		while (i<Num-1) and (Graph[Stack[Top],i]=0) do Inc(i);
		if Graph[Stack[Top],i]=0 then
		begin
			if Last>=0 then
			begin
				for i:=1 to N do
					with Domino[i] do
						if not Used and (P=Last) and (Q=Stack[Top]) then
						begin
							Used:=true;
							Writeln(i,' +');
							Break;
						end
						else if not Used and (Q=Last) and (P=Stack[Top]) then 
						begin
							Used:=true;
							Writeln(i,' -');
							Break;
						end;
			end;
			Last:=Stack[Top];
			Dec(Top);
		end
		else
		begin
			Dec(Graph[Stack[Top],i]);
			Dec(Graph[i,Stack[Top]]);
			Inc(Top);
			Stack[Top]:=i;
		end;
	until Top=0;
	Result:=true;
end;
begin
	if not Main then Writeln('No solution');
end.
