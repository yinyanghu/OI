{
	AC
	at first, make data discrete 
	for each discrete line, overlay the paper with rectangles from UP to DOWN
	use pointer "next" of segment as "THE PATH COMPRESSION of A DISJOINT SET" to overlay the each segment on a discrete line 
	to overlay all segment is linear or exactly by an ackermann function.
	total time: O(N^2*a(N)). here a(N) is inverse function of ackermann function.
}
program Ural_1147(Input,Output);
const
	ColorNum=2500;
	MaxN=1000;
type
	TIndex=Longint;
	TCoordinates=array[1..MaxN*2+2]of TIndex;
	PCoordinates=^TCoordinates;
	TColors=array[1..ColorNum]of TIndex;
	TRectangles=array[0..MaxN]of record
		llx,lly,urx,ury,color:TIndex;
	end;
	TSegments=array[1..MaxN*2+2]of record
		Color,Next:TIndex;
	end;
var
	N:TIndex;
	Rect:TRectangles;
	Nx,Ny:TIndex;
	x,y:TCoordinates;
	Count:TColors;
	Segment:TSegments;

procedure QuickSort(Ptr:PCoordinates;l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=Ptr^[(i+j) div 2];
	repeat
		while Ptr^[i]<Mid do Inc(i);
		while Mid<Ptr^[j] do Dec(j);
		if i<=j then
		begin
			Tmp:=Ptr^[i];
			Ptr^[i]:=Ptr^[j];
			Ptr^[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(Ptr,l,j);
	if i<r then QuickSort(Ptr,i,r);
end;
procedure Compress(Ptr:PCoordinates;var Num:TIndex);
var
	i,j,NewNum:TIndex;
begin
	NewNum:=0;
	i:=1;
	while i<=Num do
	begin
		j:=i+1;
		while (Ptr^[i]=Ptr^[j]) and (j<=Num) do Inc(j);
		Inc(NewNum);
		Ptr^[NewNum]:=Ptr^[i];
		i:=j;
	end;
	Num:=NewNum;
end;
function BinarySearch(Ptr:PCoordinates;Left,Right:TIndex;Key:TIndex):TIndex;
var
	Mid:TIndex;
begin
	Result:=0;
	while Left<=Right do
	begin
		Mid:=(Left+Right) div 2;
		if Ptr^[Mid]<Key then Left:=Mid+1
		else if Ptr^[Mid]>Key then Right:=Mid-1
		else 
		begin
			Result:=Mid;
			Break;
		end;
	end;
end;
function InsertSegment(Left,Right,NewColor:TIndex):TIndex;
begin
	if Segment[Left].Color=0 then Segment[Left].Color:=NewColor;
	if Segment[Left].Next<=Right then Segment[Left].Next:=InsertSegment(Segment[Left].Next,Right,NewColor);
	Result:=Segment[Left].Next;
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(Rect[0].urx,Rect[0].ury,N);
	Rect[0].llx:=0;
	Rect[0].lly:=0;
	Rect[0].color:=1;
	x[1]:=0;
	x[2]:=Rect[0].urx;
	y[1]:=0;
	y[2]:=Rect[0].ury;
	for i:=1 to N do
		with Rect[i] do
		begin
			Readln(llx, lly, urx, ury, color);
			x[2*i+1]:=llx;
			x[2*i+2]:=urx;
			y[2*i+1]:=lly;
			y[2*i+2]:=ury;
		end;
	Nx:=2*N+2;
	QuickSort(@x,1,Nx);
	Compress(@x,Nx);
	Ny:=2*N+2;
	QuickSort(@y,1,Ny);
	Compress(@y,Ny);

	FillChar(Count,SizeOf(Count),0);
	for i:=1 to Ny-1 do
	begin
		for j:=1 to Nx do
		begin
			Segment[j].Color:=0;
			Segment[j].Next:=j+1;
		end;
		for j:=N downto 0 do
			if (Rect[j].lly<=y[i]) and (y[i+1]<=Rect[j].ury) then
				InsertSegment(BinarySearch(@x,1,Nx,Rect[j].llx),BinarySearch(@x,1,Nx,Rect[j].urx)-1,Rect[j].color);

		for j:=1 to Nx do
			if Segment[j].Color>0 then
				Inc(Count[Segment[j].Color],(x[j+1]-x[j])*(y[i+1]-y[i]));
	end;
	for i:=1 to ColorNum do
		if Count[i]>0 then 
			Writeln(i,' ',Count[i]);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.