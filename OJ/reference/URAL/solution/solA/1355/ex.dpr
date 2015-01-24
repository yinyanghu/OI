{
	Theorem:
	There is the only one or none of the prime over sqrt(n).
	O(Sqrt(N))
}
program Ural_1355(Input,Output);
type
	TIndex=Longint;
procedure Main;
var
	i:TIndex;
	N,S:TIndex;
	A,B:TIndex;
begin
	Readln(A,B);
	if B mod A>0 then 
	begin
		Writeln(0);
		Exit;
	end;
	N:=B div A;
	S:=0;
	for i:=2 to Trunc(Sqrt(B div A)) do
		while N mod i=0 do
		begin 
			Inc(S);
			N:=N div i;
		end;
	if N>1 then Inc(S);
	Writeln(S+1);
end;
var
	DataNum:TIndex;
begin
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		Main;
	end;
end.