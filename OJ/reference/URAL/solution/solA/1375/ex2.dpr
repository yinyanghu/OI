{
	Author: Amber
	Method: Enumerate
	Time: 0.437s
}
program Ural_1375(Input,Output);
type
	TIndex=Longint;
var
	K,P:TIndex;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(K,P);
	for i:=0 to P-1 do
		for j:=0 to P-1 do
			if (Sqr(Int64(i))+Sqr(Int64(j))) mod P=K then 
			begin
				Writeln(i,' ',j);
				Exit;
			end;
	Writeln('NO SOLUTION');
end;
begin
	Main;
end.