{
	Code optimization:
		2D coordinates (x,y) is compressed 1D ((x-1)*M+y)
		3 Steps of transfers are compressed to 1 Step of transfer.
}
program Ural_1386(Input,Output);
const
	MaxSize=100;
type
	TIndex=Longint;
	TTransfer=array[0..4-1,0..MaxSize*MaxSize-1]of TIndex;
	TTriadTransfer=array[0..64-1,0..MaxSize*MaxSize-1]of TIndex;
	TMap=array[0..MaxSize*MaxSize-1]of TIndex;
	TUsed=array[0..MaxSize*MaxSize-1]of Boolean;
var
	N,M:TIndex;
	Step:TIndex;
	Map:TMap;
	Used:TUsed;
	T:TTransfer;
	D:TTriadTransfer;
	Count:TIndex;

procedure Main;
var
	i,j,k,p,x,y:TIndex;
begin
	Readln(N,M);
	for i:=0 to 3 do
		for p:=0 to N*M-1 do
		begin
			Read(x,y);
			T[i,p]:=(x-1)*M+(y-1);
		end;

	for i:=0 to 3 do
		for j:=0 to 3 do
			for k:=0 to 3 do
				for p:=0 to N*M-1 do
					D[i shl 4+j shl 2+k,p]:=T[k,T[j,T[i,p]]];
	for p:=0 to N*M-1 do
		Map[p]:=p;

	Read(Step);
	while Step>2 do
	begin
		Dec(Step,3);
		Read(i,j,k);
		i:=(i-1) shl 4+(j-1) shl 2+(k-1);
		for p:=0 to N*M-1 do 
			Map[p]:=D[i,Map[p]];
	end;
	while Step>0 do
	begin
		Dec(Step);
		Read(i);
		Dec(i);
		for p:=0 to N*M-1 do
			Map[p]:=T[i,Map[p]];
	end;

	for p:=0 to N*M-1 do
		Used[p]:=false;
	for p:=0 to N*M-1 do
		Used[Map[p]]:=true;
	Count:=0;
	for p:=0 to N*M-1 do
		if Used[p] then
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