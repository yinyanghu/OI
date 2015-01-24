program Ural_1375(Input,Output);
const
	MaxP=1000000;
type
	TIndex=Longint;
	THash=array[0..MaxP-1]of TIndex;
	TNext=array[0..MaxP-1]of TIndex;
var
	K,P:TIndex;
	Hash:THash;
	Next:TNext;
procedure Main;
var
	i,j:TIndex;
	Square,Current:TIndex;
begin
	Readln(K,P);
	for i:=0 to P-1 do
		Hash[i]:=-1;
	Square:=1;
	for i:=0 to P-1 do
	begin
		Square:=(Square+2*i-1) mod P;
		Next[i]:=Hash[Square];
		Hash[Square]:=i;
	end;
	Square:=1;
	for i:=0 to P-1 do
	begin
		Square:=(Square+2*i-1) mod P;
		Current:=K-Square;
		if Current<0 then Inc(Current,P);
		j:=Hash[Current];
		while j>=0 do
		begin
			if i<=j then
				Writeln(i,' ',j);
			j:=Next[j];
		end;
	end;
end;
begin
	Main;
end.