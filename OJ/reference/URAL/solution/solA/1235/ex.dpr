program Ural_1235(Input,Output);
const
	MaxN=100;
type
	TIndex=Longint;
	TCoordinate=array[1..MaxN+2]of TIndex;
	TPoint=record
		x,y:TIndex;
	end;
	TPointSet=array[1..MaxN]of TPoint;
	TSum=array[0..MaxN+2,0..MaxN+2]of TIndex;
var
	N:TIndex; //may be 0
	P:TPointSet;
	x,y:TCoordinate;
	Nx,Ny:TIndex;
	Sum:TSum;
	B:TPoint;
	Max:TIndex;

procedure QuickSort(var D:TCoordinate;l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=D[(i+j) div 2];
	repeat
		while D[i]<Mid do Inc(i);
		while D[j]>Mid do Dec(j);
		if i<=j then
		begin
			Tmp:=D[i];
			D[i]:=D[j];
			D[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(D,l,j);
	if i<r then QuickSort(D,i,r);
end;
function BinarySearch(const D:TCoordinate;Left,Right:TIndex;Key:TIndex):TIndex;
var
	Mid:TIndex;
begin
	Result:=0;
	while Left<=Right do
	begin
		Mid:=(Left+Right) div 2;
		if Key<D[Mid] then
			Right:=Mid-1
		else if Key>D[Mid] then
			Left:=Mid+1
		else
		begin
			Result:=Mid;
			Exit;
		end;
	end;
end;
procedure MakeUnique(var D:TCoordinate;var N:TIndex);
var
	NewN:TIndex;
	i,j:TIndex;
begin
	NewN:=0;
	i:=1;
	while i<=N do
	begin
		j:=i+1;
		while (D[j]=D[i]) and (j<=N) do Inc(j);
		Inc(NewN);
		D[NewN]:=D[i];
		i:=j;
	end;
	N:=NewN;
end;
procedure Update(l,i,j:TIndex);
begin
	if l<=Max then Exit;
	B.x:=x[i];
	B.y:=y[j];
	Max:=l;
end;
function GetSum(x1,y1,x2,y2:TIndex):TIndex;
begin
	if (x1>x2) or (y1>y2) then
		Result:=0
	else
		Result:=Sum[x2,y2]-Sum[x1-1,y2]-Sum[x2,y1-1]+Sum[x1-1,y1-1];
end;
procedure Main;
var
	i,j:TIndex;
	s,t:TIndex;
begin
	x[1]:=0;
	y[1]:=0;
	Readln(N,x[N+2],y[N+2]);
	for i:=1 to N do
	begin
		Readln(P[i].x,P[i].y);
		x[i+1]:=P[i].x;
		y[i+1]:=P[i].y;
	end;
	Nx:=N+2;
	QuickSort(x,1,Nx);
	MakeUnique(x,Nx);
	Ny:=N+2;
	QuickSort(y,1,Ny);
	MakeUnique(y,Ny);
	FillChar(Sum,SizeOf(Sum),0);
	for i:=1 to N do
		Inc(Sum[BinarySearch(x,1,Nx,P[i].x),BinarySearch(y,1,Ny,P[i].y)]);
	for i:=1 to Nx do
		for j:=1 to Ny do
			Inc(Sum[i,j],Sum[i,j-1]);
	for j:=1 to Ny do
		for i:=1 to Nx do
			Inc(Sum[i,j],Sum[i-1,j]);
	Max:=0;
	for i:=1 to Nx-1 do
		for j:=1 to Ny-1 do
		begin
			s:=1;
			t:=1;
			repeat
				if x[i+s]-x[i]<y[j+t]-y[j] then
				//each time expand the shorter side
				begin
					Update(x[i+s]-x[i],i,j);
					Inc(s);
				end
				else
				begin
					Update(y[j+t]-y[j],i,j);
					Inc(t);
				end;
				if (i+s>Nx) or (j+t>Ny) then Break;
				if GetSum(i+1,j+1,i+s-1,j+t-1)>0 then Break;
			until false;
		end;
	Writeln(B.x,' ',B.y,' ',Max);
end;
begin
	Main;
end.