{$N+}
program Ural_1162(Input,Output);
const
	MaxN=100;
	MaxM=100;
	MaxValue=MaxLongint div 4;
type
	TIndex=Longint;
	TData=Extended;
	TEdge=record
		x,y:TIndex;
		Rate,Comm:TData;
	end;
	TEdgeSet=array[1..MaxM*2]of TEdge;
	TDistance=array[1..MaxN]of TData;
	TRightSplit=array[0..MaxN]of TIndex;
var 
	N,M:TIndex;
	Start:TIndex;
	StartValue:TData;
	Edge:TEdgeSet;
	D:TDistance;
	H:TRightSplit;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TEdge;
begin
	i:=l;
	j:=r;
	Mid:=Edge[(i+j) div 2];
	repeat
		while Edge[i].x < Mid.x do Inc(i);
		while Edge[j].x > Mid.x do Dec(j);
		if i<=j then
		begin
			Tmp:=Edge[i];
			Edge[i]:=Edge[j];
			Edge[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j; 
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
function Relax(Cur:TEdge):Boolean;
begin
	Result:=false;
	with Cur do
		if (D[y]<(D[x]-Comm)*Rate) and (D[x]>-MaxValue) then
		begin
			D[y]:=(D[x]-Comm)*Rate;
			Result:=true;
		end;
end;
function Bellman_Ford:Boolean;
var
	i,j,k:TIndex;
	Count:TIndex;
begin
	Result:=true;
	for i:=1 to N do
		D[i]:=-MaxValue;
	D[Start]:=StartValue;
	for k:=1 to 2*N-1 do
	begin
		Count:=0;
		for i:=1 to N do
			for j:=H[i-1]+1 to H[i] do
				with Edge[j] do
					if Relax(Edge[j]) then Inc(Count);
		if Count=0 then Break;
		//if D[Start]>StartValue then Exit;
	end;
	for i:=1 to N do
		for j:=H[i-1]+1 to H[i] do
			with Edge[j] do
				if Relax(Edge[j]) then Exit;
	Result:=false;
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(N,M,Start,StartValue);
	for i:=1 to M do
	begin
		with Edge[i*2-1] do
			Read(x,y,Rate,Comm);
		Edge[i*2].x:=Edge[i*2-1].y;
		Edge[i*2].y:=Edge[i*2-1].x;
		with Edge[i*2] do
			Readln(Rate,Comm);
	end;
	QuickSort(1,M*2);
	j:=0;
	H[0]:=0;
	for i:=1 to N do
	begin
		while (j+1<=2*M) and (Edge[j+1].x=i)do Inc(j);
		H[i]:=j;
	end;
	if Bellman_Ford then 
		Writeln('YES')
	else 
		Writeln('NO');
end;
begin
{    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
  {  Close(Input);
    Close(Output);}
end.