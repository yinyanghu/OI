{
	Use a linear special queue
	Keep the queue decreasing
	Insert:
	while tail of queue<cur do 
		delete(tail of queue)
	insert cur to tail of queue
	Max:
	head of queue
}
program Ural_1126(Input,Output);
const
	MaxN=25000;
type
	TIndex=Longint;
	TQueue=array[1..MaxN]of record
		Value,Index:TIndex;
	end;
var
	N,M:TIndex;
	Queue:TQueue;
procedure Main;
var
	Head,Tail:TIndex;
	X:TIndex;
begin
	Readln(M);
	Head:=1;
	Tail:=1;
	N:=1;
	Readln(Queue[N].Value);
	Queue[N].Index:=1;
	while true do
	begin
		Inc(N);
		Readln(X);
		if X=-1 then Break;
		if Queue[Head].Index<=N-M then Inc(Head);
		while (Tail>=Head) and (Queue[Tail].Value<X) do
			Dec(Tail);
		Inc(Tail);
		Queue[Tail].Value:=X;
		Queue[Tail].Index:=N;
		if N>=M then Writeln(Queue[Head].Value);
	end;
end;
begin
	Main;
end.