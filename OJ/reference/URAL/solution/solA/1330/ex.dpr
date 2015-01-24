program Ural_1330(Input,Output);
const
	MaxN=10000;
type
	TIndex=Longint;
	TSum=array[0..MaxN]of TIndex;
var
	N,M:TIndex;
	Sum:TSum;

procedure Main;
var
	i,j:TIndex;
	x:TIndex;
begin
	Readln(N);
	Sum[0]:=0;
	for i:=1 to N do
	begin
		Readln(x);
		Sum[i]:=Sum[i-1]+x;
	end;
	Readln(M);
	while M>0 do
	begin
		Dec(M);
		Readln(i,j);
		Writeln(Sum[j]-Sum[i-1]);
	end;
end;
begin
	Main;
end.