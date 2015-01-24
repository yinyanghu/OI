
{
	Author: Amber
	Method: Count by Pointer
	Clarity:
		A classical problem.
		Count by a next pointer array.
	Complexity: O(N*(N+M))
}
program SGU_177(Input,Output);
const
	MaxN=1000;
	MaxM=5000;
type
	TIndex=Longint;
	TRectangles=array[0..MaxM]of record
		x1,y1,x2,y2:TIndex;
		c:Boolean;
	end;
	TNext=array[1..MaxN]of TIndex;
	TCover=array[1..MaxN]of Boolean;
var
	N,M:TIndex;
	Rect:TRectangles;
	Cover:TCover;
	Next:TNext;
procedure Swap(var a,b:TIndex);
var
	t:TIndex;
begin
	t:=a;
	a:=b;
	b:=t;
end;
procedure Main;
var
	i,j,k,t:TIndex;
	Sum,Count:TIndex;
	Ch:Char;
begin
	Readln(N,M);
	with Rect[0] do
	begin
		x1:=1;
		y1:=1;
		x2:=N;
		y2:=N;
		c:=true;
	end;
	for i:=1 to M do
		with Rect[i] do
		begin
			Read(x1,y1,x2,y2);
			repeat
				Read(Ch);
			until (Ch='w') or (Ch='b');
			Readln;
			c:=(Ch='w');
			if x1>x2 then Swap(x1,x2);
			if y1>y2 then Swap(y1,y2);
		end;
	Sum:=0;
	for i:=1 to N do
	begin
		for j:=1 to N do
		begin
			Next[j]:=j+1;
			Cover[j]:=false;
		end;
		Count:=0;
		for k:=M downto 0 do
			with Rect[k] do
			begin
				if (i<x1) or (i>x2) then Continue;
				j:=y1;
				while j<=y2 do
				begin
					if not Cover[j] then
					begin
						if c then Inc(Count);
						Cover[j]:=true;
					end;
					t:=j;
					j:=Next[j];
					Next[t]:=Next[y2];
				end;
			end;
		Inc(Sum,Count);
	end;
	Writeln(Sum);
end;
begin
	Main;
end.