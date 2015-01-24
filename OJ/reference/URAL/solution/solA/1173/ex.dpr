{
	Just sort by the angle of OPi.
	Using DET for sort avoids the angle between two vector OPi,OPi+1 >180. 
	Maybe <OP1,OPn> >180
}
program Ural_1173(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
	TPointSet=array[1..MaxN]of TPoint;
	TID=array[1..MaxN]of TIndex;
	TOrder=array[1..MaxN]of TIndex;
var
	N:TIndex;
	P:TPointSet;
	ID:TID;
	Q:TPoint;
	Order:TOrder;
function Det(B,C:TPoint):TData;
begin
	Result:=(B.x-Q.x)*(C.y-Q.y)-(C.x-Q.x)*(B.y-Q.y);
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=Order[(i+j) div 2];
	repeat
		while Det(P[Order[i]],P[Mid])<0 do Inc(i);
		while Det(P[Order[j]],P[Mid])>0 do Dec(j);
		if i<=j then
		begin
			Tmp:=Order[i];
			Order[i]:=Order[j];
			Order[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(Q.x,Q.y);
	Readln(N);
	for i:=1 to N do
	begin
		Readln(P[i].x,P[i].y,ID[i]);
		Order[i]:=i;
	end;
	QuickSort(1,N);
	Writeln(0);
	for i:=1 to N do
		Writeln(ID[Order[i]]);
	Writeln(0);
end;
begin
	Main;
end.