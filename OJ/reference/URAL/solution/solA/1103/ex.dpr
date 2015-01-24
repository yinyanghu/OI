{$N+}
program Ural_1103(Input,Output);
const
	MaxN=5000;
type
	TIndex=Longint;
	TData=Extended; 
	//although all coordinate is integer but must use extended else get FLT_Invalid_Operation or WA
	TPoint=record
		x,y:TData;
		CosValue:TData;
	end;
	TVector=record
		x,y:TData;
	end;
	TPointSet=array[1..MaxN]of TPoint;
var
	N:TIndex;
	P:TPointSet;

function Vector(A,B:TPoint):TVector;
begin
	Result.x:=B.x-A.x;
	Result.y:=B.y-A.y;
end;
function Det(A,B:TVector):TData;
begin
	Result:=A.x*B.y-A.y*B.x;
end;
function Dot(A,B:TVector):TData;
begin
	Result:=A.x*B.x+A.y*B.y;
end;
function Len(A:TVector):TData;
begin
	Result:=Sqrt(Sqr(A.x)+Sqr(A.y));
end;
procedure Swap(var A,B:TPoint);
var
	Tmp:TPoint;
begin
	Tmp:=A;
	A:=B;
	B:=Tmp;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid:TPoint;
begin
	i:=l;
	j:=r;
	Mid:=P[(i+j) div 2];
	repeat
		while P[i].CosValue>Mid.CosValue do Inc(i);
		while Mid.CosValue>P[j].CosValue do Dec(j);
		if i<=j then
		begin
			Swap(P[i],P[j]);
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
begin
	Readln(N);
	if (N-3) mod 2<>0 then 
	begin
		Writeln('No solution');
		Exit;
	end;
	for i:=1 to N do
		Readln(P[i].x,P[i].y);
	j:=1;
	for i:=2 to N do
		if (P[i].y<P[j].y) or ((P[i].y=P[j].y) and (P[i].x>P[j].x)) then
			j:=i;
	Swap(P[1],P[j]);
	j:=2;
	for i:=3 to N do
		if Det(Vector(P[1],P[i]),Vector(P[1],P[j]))>0 then
			j:=i;
	Swap(P[2],P[j]);
	for i:=3 to N do
		P[i].CosValue:= Dot(Vector(P[i],P[1]),Vector(P[i],P[2]))/(Len(Vector(P[i],P[1]))*Len(Vector(P[i],P[2])));
	QuickSort(3,N);
	Writeln(P[1].x,' ',P[1].y);
	Writeln(P[2].x,' ',P[2].y);
	Writeln(P[(N+3) div 2].x,' ',P[(N+3) div 2].y);
end;
begin
{	Assign(Input, 'i.txt');
	Reset(Input);
	Assign(Output, 'o.txt');
	Rewrite(Output);}
	Main;
{	Close(Input);
	Close(Output);}
end.