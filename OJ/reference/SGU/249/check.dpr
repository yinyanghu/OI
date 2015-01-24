program SGU_249_Checker(Input,Output);
const
	MaxN=10;
type
	TIndex=Longint;
	TData=array[0..1 shl MaxN-1,0..1 shl MaxN-1]of Longint;
var
	N,M:TIndex;
	D:TData;
function IsValid(A,B:TIndex):Boolean;
var
	R:TIndex;
	i:TIndex;
begin
	R:=A xor B;
	Result:=true;
	for i:=0 to N*M-1 do
		if 1 shl i=R then Exit;
	Result:=false;
end;
procedure Main;
label
	Error;
var
	i,j:TIndex;
begin
	Readln(N,M);
	for i:=0 to 1 shl N-1 do
	begin
		for j:=0 to 1 shl M-1 do
		begin
			Read(D[i,j]);
			if i>0 then if not IsValid(D[i-1,j],D[i,j]) then goto Error;
			if j>0 then if not IsValid(D[i,j-1],D[i,j]) then goto Error;
		end;
		Readln;
	end;
	for i:=0 to 1 shl N-1 do
		if not IsValid(D[i,0],D[i,1 shl N-1]) then goto Error;
	for j:=0 to 1 shl M-1 do
		if not IsValid(D[0,j],D[1 shl M-1,j]) then goto Error;
	Writeln('Yes');
	Exit;
	Error:
	Writeln('No');
end;
begin
	Main;
end.