{
	Method: Math
	1)x=0,1
	2)p|x, q|x-1 or q|x, p|x-1
		solve ap+bq=1,
		=>x=ap,x=bp
	3)pq|x-1 or pq|x
		now x>=n, so cut
}
program Ural_1204(Input,Output);
const
	MaxN=1000000000;
	MaxPrime=31622;
	MaxPrimeNum=3401;
type
	TIndex=Longint;
	TFilter=array[1..MaxPrime]of Boolean;
	TPrime=array[1..MaxPrime]of TIndex;
var
	PrimeNum:TIndex;
	Filter:TFilter;
	Prime:TPrime;

procedure PrecomputePrime;
var
	i,j:TIndex;
begin
	PrimeNum:=0;
	FillChar(Filter,SizeOf(Filter),true);
	for i:=2 to MaxPrime do
		if Filter[i] then
		begin
			Inc(PrimeNum);
			Prime[PrimeNum]:=i;
			for j:=i to MaxPrime div i do
				Filter[i*j]:=false;
		end;
end;
function Extended_GCD(A,B:TIndex;var X,Y:TIndex):TIndex;
var
	T:TIndex;
begin
	if B=0 then 
	begin
		Result:=A;
		X:=1;
		Y:=0;
	end 
	else
	begin
		Result:=Extended_GCD(B,A mod B,X,Y);
		T:=X;
		X:=Y;
		Y:=T-(A div B)*Y;
	end;
end;
function Trim(X,Modulo:TIndex):TIndex;
begin
	Result:=((X mod Modulo)+Modulo) mod Modulo;
end;
procedure Main;
var
	i:TIndex;
	DataNum:TIndex;
	N,P,Q,A,B:TIndex;
	X,Y:TIndex;
	Range:TIndex;
begin
	PrecomputePrime;
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		Readln(N);
		//Get P,Q
		P:=0;
		Q:=0;
		i:=1;
		Range:=Trunc(Sqrt(N));
		while Prime[i]<=Range do
		begin
			if N mod Prime[i]=0 then
			begin
				P:=Prime[i];
				Q:=N div Prime[i];
				Break;
			end;
			Inc(i);
			if i>PrimeNum then Break;
		end;
		//solve xp+yq=1
		Extended_GCD(P,Q,X,Y);
		//ans=xp ans=yq
		A:=Trim(X,Q)*P;
		B:=Trim(Y,P)*Q;
		if A<B then
			Writeln('0 1 ',A,' ',B)
		else
			Writeln('0 1 ',B,' ',A);
	end;
end;
begin
	Main;
end.