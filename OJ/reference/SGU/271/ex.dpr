{
	Author: Amber
	Method: Data Processing(Loop Queue)
	Clarity:
		维护一个长度为K的有一个是否反向的标志的数据块。
		因为只关心最顶上的K个数据，所以只要有add操作，就可以输出掉(pop)一个最下面的数据，然后加入当前add的数据至顶(push)。
		用一个循环队列(两端都可以加数据)来实现这个数据块，有两个指针head,tail。正向的话，tail为顶部。反向则head为顶部。
		具体见程序。
	Notice:
		(1)
		String operation in Pascal is slow!!! I got TLE n times.
		TLE -> AC
		String -> String[8]
		(2)
		Be careful that Boundary K=0!
}
program SGU_271(Input, Output);
const
	MaxN=40000;
	MaxK=40000;
	MaxQueueSize=MaxK+10;
	MaxM=100000;
type
	TIndex=Longint;
	TData=String[3];
	TQuery=String[8];
	TLoopQueue=array[0..MaxQueueSize-1]of TData;
	TAnswer=array[1..MaxN+MaxM]of TData;
var
	N,M,K:TIndex;
	Direct:Boolean;
	Head,Tail:TIndex;
	Num:TIndex;
	Queue:TLoopQueue;
	Len:TIndex;
	Answer:TAnswer;
procedure Next(var Ptr:TIndex);
begin
	Inc(Ptr);
	if Ptr=MaxQueueSize then Ptr:=0;
end;
procedure Prev(var Ptr:TIndex);
begin
	Dec(Ptr);
	if Ptr=-1 then Ptr:=MaxQueueSize-1;
end;
procedure Push(const St:TData);
begin
	Inc(Num);
	if Direct then
	begin
		Next(Tail);
		Queue[Tail]:=St;
	end
	else
	begin
		Prev(Head);
		Queue[Head]:=St;
	end;
end;
procedure Pop;
begin
	Inc(Len);
	Dec(Num);
	if Direct then
	begin
		Answer[Len]:=Queue[Head];
		Next(Head);
	end
	else
	begin
		Answer[Len]:=Queue[Tail];
		Prev(Tail);
	end;
end;
procedure Main;
var
	i:TIndex;
	St:TQuery;
begin
	Head:=1;
	Tail:=0;
	Num:=0;
	Direct:=false;
	Len:=0;

	Readln(N,M,K);
	for i:=1 to N do
	begin
		Readln(St);
		Push(St);
	end;
	Direct:=true;
	while Num>K do Pop;
	for i:=1 to M do
	begin
		Readln(St);
		if St='ROTATE' then
			Direct:=not Direct
		else
		begin
			Delete(St,1,4);//"ADD("
			Delete(St,Length(St),1);//")"
			if (Num>=K) and (Num>0) then Pop;
			Push(St);
		end;
	end;
	while Num>0 do Pop;
	for i:=Len downto 1 do
		Writeln(Answer[i]);
end;
begin
	Main;
end.