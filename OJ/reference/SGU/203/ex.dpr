{
	Author: Amber
	Method: Simulate by Queue
	Clarity:
		Simulate according to the definition of Huffman tree which is to choose two smallest nodes and to merge them each time.
		O(nlogn) by Heap
		But the data are in order, so we can maintain two ordered queues to solve it in O(N).
		A huffman property that the values of mergings are increasing one by one time.
		One queue is the data queue.
		The other queue is the new-node queue.
		Each time choose two smallest node from the heads of two queues, merge them and push it to the tail of the second queue.	
	Complexity: O(N)
}
program SGU_203(Input,Output);
const
	MaxN=500000;
type
	TIndex=Longint;
	TData=Int64;
	TElement=array[1..MaxN]of TData;
	TQueue=array[1..MaxN+1]of TData;
var
	N:TIndex;
	Ptr:TIndex;
	D:TElement;
	Pop,Push:TIndex;
	Q:TQueue;
	Sum:TData;
	
function PopMinimum:TData;
begin
	if Pop>=Push then
	begin
		Result:=D[Ptr];
		Inc(Ptr);
		Exit;
	end;
	if Ptr>N then 
	begin
		Result:=Q[Pop];
		Inc(Pop);
		Exit;
	end;
	if D[Ptr]<Q[Pop] then
	begin
		Result:=D[Ptr];
		Inc(Ptr);
	end
	else 
	begin
		Result:=Q[Pop];
		Inc(Pop);
	end;
end;
procedure Main;
var
	i:TIndex;
	x,y:TData;
begin
	Readln(N);
	Sum:=0;
	
	Ptr:=1;
	for i:=1 to N do
		Read(D[i]);
	Readln;
	Pop:=1;
	Push:=1;
	
	for i:=1 to N-1 do
	begin
		x:=PopMinimum;
		y:=PopMinimum;
		Inc(Sum,x+y);
		Q[Push]:=x+y;
		Inc(Push);
	end;
	Writeln(Sum);
end;
begin
	Main;
end.