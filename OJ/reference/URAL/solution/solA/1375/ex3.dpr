{
	Author: Amber
	Method: Hash
	Time: 0.156s
}
program Ural_1375(Input,Output);
const
	MaxP=1000000;
type
	TIndex=Longint;
	THash=array[0..MaxP-1]of TIndex;
var
	K,P:TIndex;
	Hash:THash;
procedure Main;
var
	i:TIndex;
	Square,Current:TIndex;
begin
	Readln(K,P);
	for i:=0 to P-1 do
		Hash[i]:=-1;
	Square:=1;
	for i:=0 to P-1 do
	begin
		Square:=(Square+2*i-1) mod P;
		Hash[Square]:=i;
	end;
	Square:=1;
	for i:=0 to P-1 do
	begin
		Square:=(Square+2*i-1) mod P;
		Current:=K-Square;
		if Current<0 then Inc(Current,P);
		if Hash[Current]>=0 then
		begin
			Writeln(Hash[Current],' ',i);
			Exit;
		end;
	end;
	Writeln('NO SOLUTION');
end;
begin
	Main;
end.