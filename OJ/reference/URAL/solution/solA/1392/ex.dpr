{
	Disjoint set
}
program Ural_1392(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TFather=array[1..MaxN]of TIndex;
	TUsed=array[1..MaxN]of Boolean;
	TSphere=array[1..MaxN]of record
		x,y,z,r:TIndex;
	end;
var
	N:TIndex;
	S:TSphere;
	Father:TFather;
	Used:TUsed;
function Find(x:TIndex):TIndex;
begin
	if Father[x]<0 then
		Result:=x
	else
	begin
		Father[x]:=Find(Father[x]);
		Result:=Father[x];
	end;
end;
procedure Merge(i,j:TIndex);
begin
	i:=Find(i);
	j:=Find(j);
	if i=j then Exit;
	Father[i]:=j;
end;
function Touch(i,j:TIndex):Boolean;
begin
	Result:=(Sqr(S[i].x-S[j].x)+Sqr(S[i].y-S[j].y)+Sqr(S[i].z-S[j].z)<=Sqr(S[i].r+S[j].r));
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(N);
	FillChar(Father,SizeOf(Father),255);
	for i:=1 to N do
	begin
		with S[i] do
			Readln(x,y,z,r);
		for j:=1 to i-1 do
			if Touch(i,j) then 
				Merge(i,j);
	end;
	FillChar(Used,SizeOf(Used),0);
	for i:=1 to N do
		if not Used[i] then
		begin
			Used[i]:=true;
			Write(i-1);
			for j:=i+1 to N do
				if Find(i)=Find(j) then
				begin
					Used[j]:=true;
					Write(', ',j-1);
				end;
			Writeln;
		end;
end;
begin
	Main;
end.