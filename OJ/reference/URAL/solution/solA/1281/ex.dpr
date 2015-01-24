{
	Faint, the problem's statement is uncompletely.
	Two rivers are intersecting iff they have the same nodes
	Crossing in segments excluding their ends isn't considered intersecting.
}
program Ural_1281(Input,Output);
const
	MaxN=10;
	MaxK=1000;
	Precision=1E-15;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		X,Y:TData;
	end;
	TPointSet=record
		Len:TIndex;
		P:array[1..MaxK+1]of TPoint;
	end;
	TRiver=array[1..MaxN]of TPointSet;
	TFather=array[1..MaxN]of TIndex;
	TUsed=array[1..MaxN]of Boolean;
	TLink=array[1..MaxK+1]of record
		Next,Prev:TIndex;
	end;
var
	N:TIndex;
	R:TRiver;
	Father:TFather;
	Used:TUsed;
	MaxArea:TData;
	Cur:TPointSet;
	Link:TLink;

function Det(const A,B,C:TPoint):TData;
begin
	Result:=(B.x-A.x)*(C.y-A.y)-(B.y-A.y)*(C.x-A.x);
end;
function RiverIntersect(const x,y:TIndex):Boolean;
var
	i,j:TIndex;
begin
	Result:=true;
	for i:=1 to R[x].Len do
		for j:=1 to R[y].Len do
			if (R[x].P[i].x=R[y].P[j].x) and (R[x].P[i].y=R[y].P[j].y) then
				Exit;
	Result:=false;
end;
function Find(x:TIndex):TIndex;
begin
	if Father[x]<0 then Result:=x
	else
	begin
		Father[x]:=Find(Father[x]);
		Result:=Father[x];
	end;
end;
procedure Merge(x,y:TIndex);
var
	rx,ry:TIndex;
begin
	rx:=Find(x);
	ry:=Find(y);
	if rx=ry then Exit;
	Father[rx]:=ry;
end;
procedure Swap(var A,B:TPoint);
var
	T:TPoint;
begin
	T:=A;
	A:=B;
	B:=T;
end;
function Compare(const A,B:TPoint):TData;
begin
	Result:=-Det(Cur.P[1],A,B);
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Tmp,Mid:TPoint;
begin
	i:=l;
	j:=r;
	Mid:=Cur.P[(i+j) div 2];
	repeat
		while Compare(Cur.P[i],Mid)<0 do Inc(i);
		while Compare(Mid,Cur.P[j])<0 do Dec(j);
		if i<=j then
		begin
			Tmp:=Cur.P[i];
			Cur.P[i]:=Cur.P[j];
			Cur.P[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
function Convex_Hull:TData; //Graham
var
	i,j,k:TIndex;
	O:TPoint;
begin
	with Cur do
	begin
		Result:=0;
		j:=1;
		for i:=2 to Len do
			if (P[j].y>P[i].y) or ((P[j].y=P[i].y) and (P[j].x<P[i].x)) then
				j:=i;
		Swap(P[1],P[j]);
		QuickSort(2,Len);
		for i:=1 to Len do
			with Link[i] do
			begin
				Prev:=i-1;
				Next:=i+1;
			end;
		Link[Len].Next:=1;
		Link[1].Prev:=Len;
		i:=1;
		repeat
			j:=Link[i].Next;
			k:=Link[j].Next;
			if Det(P[i],P[j],P[k])<=0 then
			begin
				Link[k].Prev:=i;
				Link[i].Next:=k;
				i:=Link[i].Prev;
			end
			else
				i:=Link[i].Next;
		until Link[i].Next=1;
		i:=1;
		O.x:=0;
		O.y:=0;
		repeat
			Result:=Result+Det(O,P[i],P[Link[i].Next]);
			i:=Link[i].Next;
		until i=1;
		Result:=Result/2;
	end;
end;
procedure Main;
var
	i,j:TIndex;
	CurArea:TData;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Readln(R[i].Len);
		for j:=1 to R[i].Len do
			with R[i].P[j] do
				Readln(x,y);
	end;

	FillChar(Father,SizeOf(Father),255);
	for i:=1 to N-1 do
		for j:=i+1 to N do
			if Find(i)<>Find(j) then
				if RiverIntersect(i,j) then Merge(i,j);
	
	FillChar(Used,SizeOf(Used),0);
	MaxArea:=0;
	for i:=1 to N do
		if not Used[i] then
		begin
			Cur.Len:=0;
			for j:=i to N do
				if Find(i)=Find(j) then
				begin
					Move(R[j].P[1],Cur.P[Cur.Len+1],R[j].Len*SizeOf(TPoint));
					Inc(Cur.Len,R[j].Len);
					Used[j]:=true;
				end;
			CurArea:=Convex_Hull;
			if CurArea>MaxArea then MaxArea:=CurArea;
		end;
	Writeln(MaxArea:0:2);
end;
begin
	Main;
end.