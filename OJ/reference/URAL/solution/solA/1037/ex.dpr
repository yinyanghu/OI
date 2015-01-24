{
	Complexity: O(Sqrt(N)*Q), here Q is the amount of requiring.

	Divide the list of block into the O(Sqrt(N)) segments.
	Record the minimum time of the segment whose length is O(Sqrt(N)).
	FindMinimum Operation:
		1. Search the first segment whose minimum time isn't over the current time. O(Sqrt(N))
		2. Search the fisrt block whose time isn't over the current time in that segment. O(Sqrt(N))
		complexity in total : O(Sqrt(N))
	Update Operation:
		1. the block X is assigned to new value. O(1)
		2. update the MinTime by search in the segment where the block X is. O(Sqrt(N))
		complexity in total : O(Sqrt(N))

	AC in 0.3s
----------------------------------------------------
	But how to solve it using the heap?
}
program Ural_1037(Input,Output);
const
	N=30000;
	SegmentSize=173;//Trunc(Sqrt(N))
	SegmentNum=N div SegmentSize+1;
	T=600;
type
	TIndex=Longint;
	TBlockTimes=array[1..N]of TIndex;
	TSegmentMinTimes=array[1..SegmentNum]of TIndex;
var
	Block:TBlockTimes;
	MinTime:TSegmentMinTimes;

procedure Update(BlockNo,NewTime:TIndex);
var
	MinIndex,SegmentNo,Offset:TIndex;
	i:TIndex;
begin
	Block[BlockNo]:=NewTime;
	SegmentNo:=(BlockNo-1) div SegmentSize+1;
	Offset:=(SegmentNo-1)*SegmentSize;	
	MinIndex:=Offset+1;
	for i:=2 to SegmentSize do
		if Block[Offset+i]<Block[MinIndex] then
			MinIndex:=Offset+i;
	MinTime[SegmentNo]:=Block[MinIndex];
end;
function FindMinimum(Time:TIndex):TIndex;
var
	i,j:TIndex;
begin
	Result:=0;
	for i:=1 to SegmentNum do
		if MinTime[i]<=Time then
		begin
			for j:=1 to SegmentSize do
				if Block[(i-1)*SegmentSize+j]<=Time then 
				begin
					Result:=(i-1)*SegmentSize+j;
					Break;
				end;
			Update(Result,Time+T);
			Break;
		end;
end;
procedure Main;
var
	BlockNo,Time:TIndex;
	Ch:Char;
begin
	FillChar(Block,SizeOf(Block),0);
	FillChar(MinTime,SizeOf(MinTime),0);
	while not SeekEof do
	begin
		Read(Time);
		Read(Ch); //Buf
		Read(Ch);
		if Ch='+' then
			Writeln(FindMinimum(Time))
		else if Ch='.' then
		begin
			Read(BlockNo);
			if Block[BlockNo]>Time then
			begin
				Update(BlockNo,Time+T);
				Writeln('+');
			end
			else
				Writeln('-');
		end;
		Readln;
	end;
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