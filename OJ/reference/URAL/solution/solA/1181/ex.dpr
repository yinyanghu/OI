{
	Method: Greedy
	Consider this problem always has solutions.
	It satisfies the property of sub problem.
	1)if the amount of one color is 1 then
		regarding it as the vexter of all triangles, cut them.
	2)it must be found seriate 3 numbers k,k+1,k+2 which have different colors.
		cut it, and get a sub-problem.
}
program Ural_1181(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TCount=array[1..3]of TIndex;
	TPointer=array[1..MaxN]of TIndex;
	TValue=array[1..MaxN]of TIndex;
var
	N:TIndex;
	Count:TCount;
	Left,Right:TPointer;
	Value:TValue;

procedure Main;
var
	i:TIndex;
	Ch:Char;
	Cur,Ptr:TIndex;
	Times:TIndex;
	Vertex:TIndex;
begin
	Readln(N);
	FillChar(Count,SizeOf(Count),0);
	for i:=1 to N do
	begin
		Read(Ch);
		case Ch of 
			'R': Cur:=1;
			'G': Cur:=2;
			else Cur:=3;//now 'B'
		end;
		Value[i]:=Cur;
		Left[i]:=i-1;
		Right[i]:=i+1;
		Inc(Count[Cur]);
	end;
	Left[1]:=N;
	Right[N]:=1;
	Readln;

	Writeln(N-3);
	Times:=0;
	Ptr:=1;
	while Times<N-3 do
	begin
		Cur:=0;
		for i:=1 to 3 do
			if Count[i]=1 then
			begin
				Cur:=i;
				Break;
			end;
		if Cur>0 then
		begin
			while Value[Ptr]<>Cur do
				Ptr:=Right[Ptr];
			Vertex:=Ptr;
			Ptr:=Right[Vertex];
			while Right[Ptr]<>Left[Vertex] do
			begin
				Writeln(Right[Ptr],' ',Vertex);
				Ptr:=Right[Ptr];
			end;
			Break;
		end
		else
		begin
			while [Value[Left[Ptr]],Value[Ptr],Value[Right[Ptr]]]<>[1,2,3] do
				Ptr:=Right[Ptr];
			Writeln(Left[Ptr],' ',Right[Ptr]);
			Dec(Count[Value[Ptr]]);
			Right[Left[Ptr]]:=Right[Ptr];
			Left[Right[Ptr]]:=Left[Ptr];
			Ptr:=Right[Ptr];
			Inc(Times);
		end;
	end;
end;
begin
	Main;
end.