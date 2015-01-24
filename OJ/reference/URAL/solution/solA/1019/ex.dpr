{
	AC in 0.015s
	Time : O(N)
	It may be left=right!
}
program Ural_1019(Input,Output);
const
	MaxN=5000+1;
	MaxInterval=1000000000;
type
	TIndex=Longint;
	TCoordinates=array[1..MaxN*2+2]of TIndex;
	PCoordinates=^TCoordinates;
	TSegmentInfos=array[0..MaxN]of record
		Left,Right,Color:TIndex;
	end;
	TColorSegments=array[1..MaxN*2+2]of record
		Color,Next:TIndex;
	end;
var
	N:TIndex;
	SegmentInfo:TSegmentInfos;
	Nx:TIndex;
	x:TCoordinates;
	Segment:TColorSegments;

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
	Ch:Char;
	BestLeft,BestRight:TIndex;
begin
	Readln(N);
	SegmentInfo[0].Left:=0;
	SegmentInfo[0].Right:=MaxInterval;
	SegmentInfo[0].Color:=1;
	x[1]:=0;
	x[2]:=MaxInterval;
	for i:=1 to N do
		with SegmentInfo[i] do
		begin
			Read(Left,Right);
			repeat
				Read(Ch);
			until (Ch='b') or (Ch='w');
			if Ch='b' then Color:=2
			else if Ch='w' then Color:=1;
			x[2*i+1]:=Left;
			x[2*i+2]:=Right;
			Readln;
		end;
	Nx:=2*N+2;
	QuickSort(@x,1,Nx);
	Compress(@x,Nx);

	for i:=1 to Nx do
	begin
		Segment[i].Color:=0;
		Segment[i].Next:=i+1;
	end;
	for i:=N downto 0 do
		if SegmentInfo[i].Left<SegmentInfo[i].Right then //if left=right it will get WA
			InsertSegment(BinarySearch(@x,1,Nx,SegmentInfo[i].Left),BinarySearch(@x,1,Nx,SegmentInfo[i].Right)-1,SegmentInfo[i].Color);
	BestLeft:=0;
	BestRight:=0;
	i:=1;
	while i<=Nx-1 do
	begin
		j:=i;
		while (Segment[j+1].Color=Segment[i].Color) and (j+1<=Nx-1) do Inc(j);
		if (x[j+1]-x[i]>BestRight-BestLeft) and (Segment[i].Color=1) then
		begin
			BestLeft:=x[i];
			BestRight:=x[j+1];
		end;
		i:=j+1;
	end;
	Writeln(BestLeft,' ',BestRight);
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