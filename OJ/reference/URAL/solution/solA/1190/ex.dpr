{
	WA 1 times due to decreasing order means non-increasing order!!!
}
program Ural_1190(Input,Output);
const
	Limit=10000;
type
	TIndex=Longint;
	TCount=Int64;
var
	N:TIndex;

procedure Main;
var
	i,x:TIndex;
	v,Last,Min,Max,Count:TCount;
	Ch:Char;
begin
	Readln(N);
	Last:=Limit+1;
	Max:=0;
	Min:=0;
	Count:=0;
	for i:=1 to N do
	begin
		repeat
			Read(Ch);
		until Ch=' ';
		Read(x);
		if x=0 then
		begin
			Inc(Max,Last);
			Inc(Count);
		end
		else if x=1 then
		begin
			Read(v);
			Inc(Max,v);
			Inc(Min,(Count+1)*v);
			Last:=v;
			Count:=0;
		end;
		Readln;
	end;
	if (Min>Limit) or (Max<Limit) then
		Writeln('NO')
	else 
		Writeln('YES');
end;
begin
	Main;
end.