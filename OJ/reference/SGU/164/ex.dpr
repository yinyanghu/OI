{
	Author: Amber
	Method: Math + Floyd
	Clarity:
		A hard-think proposition:
			Divide M into two parts A,B such that |A|,|B|<=(M+1) div 2.
			A or B must satisfy the condition.
		Its proof is in Zhou Yuan's solution.

	Complexity: O(N^3)
}
program SGU_164(Input,Output);
const
	MaxN=200;
	MaxValue=4;
type
	TIndex=Longint;
	TGraph=array[1..MaxN,1..MaxN]of TIndex;
var
	N,M:TIndex;
	G:TGraph;

procedure Main;
var
	i,j,k:TIndex;
	X:TIndex;
begin
	Readln(N,M);
	for i:=1 to N do
	begin
		for j:=1 to N do
		begin
			Read(X);
			if X>(M+1) div 2 then
				G[i,j]:=1
			else
				G[i,j]:=MaxValue;
		end;
		Readln;
	end;
	for k:=1 to N do
		for i:=1 to N do
			for j:=1 to N do
				if (i<>j) and (G[i,j]>G[i,k]+G[k,j]) then
					G[i,j]:=G[i,k]+G[k,j];
	for i:=1 to N do
		for j:=1 to N do
			if (i<>j) and (G[i,j]>3) then 
			begin
				Writeln((M+1) div 2);
				for k:=1 to (M+1) div 2 do
					Write(k,' ');
				Writeln;
				Exit;
			end;
	Writeln(M-(M+1) div 2);
	for k:=(M+1) div 2+1 to M do
		Write(k,' ');
	Writeln;
end;
begin
	Main;
end.