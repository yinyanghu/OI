{
	TLE
	at first, make data discrete 
	for each discrete line, overlay the paper with rectangles from UP to DOWN
	use "SEGMENT TREE" of segment to overlay the each segment on a discrete line 
	total time: O(N^2*logN). 
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
	TSegment=record
		Left,Right:TIndex;
		LeftChild,RightChild:TIndex;
		Color:TIndex;
	end;
	TSegmentTree=array[1..MaxN*4+8]of TSegment;
	TRectangles=array[0..MaxN]of record
		llx,lly,urx,ury,color:TIndex;
	end;
var
	N:TIndex;
	Rect:TRectangles;
	Root,SegmentNum:TIndex;
	Segment:TSegmentTree;
	Nx,Ny:TIndex;
	x,y:TCoordinates;
	Count:TColors;
	
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
function CreateSegmentTree(NewLeft,NewRight:TIndex):TIndex;
var
	Mid:TIndex;
begin
	Inc(SegmentNum);
	Result:=SegmentNum;
	with Segment[Result] do
	begin
		Left:=NewLeft;
		Right:=NewRight;
		LeftChild:=0;
		RightChild:=0;
		Color:=0;
		if Right-Left>1 then
		begin
			Mid:=(Left+Right) div 2;
			LeftChild:=CreateSegmentTree(Left,Mid);
			RightChild:=CreateSegmentTree(Mid,Right);
		end;
	end;
end;
procedure InsertSegment(Node,NewLeft,NewRight,NewColor:TIndex);
var
	Mid:TIndex;
begin
	if Node=0 then Exit;
	with Segment[Node] do
		if (Left=NewLeft) and (Right=NewRight) then
			Color:=NewColor
		else
		begin
			Mid:=(Left+Right) div 2;
			if Color>0 then InsertSegment(LeftChild,Left,Mid,Color);
			if Color>0 then InsertSegment(RightChild,Mid,Right,Color);
			Color:=0;
			if NewRight<=Mid then
				InsertSegment(LeftChild,NewLeft,NewRight,NewColor)
			else if Mid<=NewLeft then
				InsertSegment(RightChild,NewLeft,NewRight,NewColor)
			else
			begin
				InsertSegment(LeftChild,NewLeft,Mid,NewColor);
				InsertSegment(RightChild,Mid,NewRight,NewColor);
			end;
		end;
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
procedure GetStatistic(Node,Height:TIndex);
begin
	if Node=0 then Exit;
	with Segment[Node] do
		if Color>0 then
			Inc(Count[Color],(x[Right]-x[Left])*Height)
		else
		begin
			GetStatistic(LeftChild,Height);
			GetStatistic(RightChild,Height);
		end;
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

	SegmentNum:=0;
	Root:=CreateSegmentTree(1,Nx);

	FillChar(Count,SizeOf(Count),0);
	for i:=1 to Ny-1 do
	begin
		for j:=1 to SegmentNum do Segment[j].Color:=0;
		for j:=0 to N do
			if (Rect[j].lly<=y[i]) and (y[i+1]<=Rect[j].ury) then
				InsertSegment(Root,BinarySearch(@x,1,Nx,Rect[j].llx)
						,BinarySearch(@x,1,Nx,Rect[j].urx), Rect[j].color);

		GetStatistic(Root,y[i+1]-y[i]);
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