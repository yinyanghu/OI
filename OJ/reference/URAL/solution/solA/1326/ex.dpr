{
	MLE 1 time
	WA 2 times

	there notice:
	(1)the taps may be not in shoplist.
	(2)taps may be not unique.
	(3)integer in fpc = longint , so should use smallint
}
program Ural_1326(Input,Output);
const
	MaxN=20;
	MaxM=100;
type
	TIndex=Longint;
	TData=Smallint;
	TDP=array[0..1 shl MaxN-1]of TData;
	TPrice=array[1..MaxN]of TData;
	TPack=array[1..MaxM]of record
		Price:TData;
		Code:TIndex;
	end;
var
	N,M:TIndex;
	Pack:TPack;
	Price:TPrice;
	F:TDP;

procedure Main;
var
	i,j,k:TIndex;
	Size,Code:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		Readln(Price[i]);
	Readln(M);
	for i:=1 to M do
		with Pack[i] do
		begin
			Read(Price,Size);
			Code:=0;
			for j:=1 to Size do
			begin
				Read(k);
				Inc(Code,1 shl (k-1));
			end;
			Readln;
		end;
	Read(Size);
	Code:=0;
	for i:=1 to Size do
	begin
		Read(k);
		Inc(Code,1 shl (k-1));
	end;
	//initialize costs based on individual prices
	FillChar(F,SizeOf(F),0);
	for i:=1 to 1 shl N-1 do
		for j:=1 to N do
			if i and (1 shl (j-1))>0 then
				Inc(F[i],Price[j]);
	//consider special offers
	for i:=0 to 1 shl N-1 do
		for j:=1 to M do
			if F[i or Pack[j].Code]>F[i]+Pack[j].Price then //it's not necessary s.t. A and B=0
				F[i or Pack[j].Code]:=F[i]+Pack[j].Price;
	//only contains shoplist, not necessary equals to shoplist.
	j:=Code; // j is index of max 
	for i:=Code+1 to 1 shl N-1 do
		if Code and i = Code then
			if F[i]<F[j] then 
				j:=i;
	Writeln(F[j]);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.