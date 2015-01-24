{
	How foolish I am!
	I use expanded queue to store map for some repeated state.
	But in that way, i got TLE.

	Solve this problem only by simulating it in two or more step length.
	In this version, the step length is 2.
}
program Ural_1386(Input,Output);
const
	MaxSize=100;
type
	TIndex=Longint;
	TTransfer=array[0..4-1,0..MaxSize*MaxSize-1]of TIndex;
	TDoubleTransfer=array[0..16-1,0..MaxSize*MaxSize-1]of TIndex;
	TMap=array[0..MaxSize*MaxSize-1]of TIndex;
	TUsed=array[0..MaxSize*MaxSize-1]of Boolean;
var
	N,M:TIndex;
	Step:TIndex;
	Map:TMap;
	Used:TUsed;
	T:TTransfer;
	D:TDoubleTransfer;
	Count:TIndex;

procedure Main;
var
	i,j,k,x,y:TIndex;
begin
	Readln(N,M);
	for i:=0 to 3 do
		for k:=0 to N*M-1 do
		begin
			Read(x,y);
			T[i,k]:=(x-1)*M+(y-1);
		end;

	for i:=0 to 3 do
		for j:=0 to 3 do
			for k:=0 to N*M-1 do
				D[i*4+j,k]:=T[j,T[i,k]];
	for k:=0 to N*M-1 do
		Map[k]:=k;

	Read(Step);
	while Step>1 do
	begin
		Dec(Step,2);
		Read(i,j);
		i:=(i-1)*4+(j-1);
		for k:=0 to N*M-1 do 
			Map[k]:=D[i,Map[k]];
	end;
	if Step>0 then
	begin
		Read(i);
		Dec(i);
		for k:=0 to N*M-1 do
			Map[k]:=T[i,Map[k]];
	end;

	for k:=0 to N*M-1 do
		Used[k]:=false;
	for k:=0 to N*M-1 do
		Used[Map[k]]:=true;
	Count:=0;
	for k:=0 to N*M-1 do
		if Used[k] then
			Inc(Count);
	Writeln(Count);
	for i:=0 to N-1 do
		for j:=0 to M-1 do
			if Used[i*M+j] then
				Writeln(i+1,' ',j+1);
end;
begin
	Main;
end.