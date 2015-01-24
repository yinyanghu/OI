{
	Rabin-Miller Strong Pseudoprime Test
	O(D*LogN) based on calcing "a*b mod c" in O(1).Here D is the number of Test Primes.
	But maybe a*b>maxint64, so calc "a*b mod c" in O(LogN).
	Exp,Mul are base on double iterating.

	Total Time:
	O(LogN*LogN*D*P)
	Here P is how many times a random suffix s.t. the 12-length number is a prime is found.

	AC in 0.015s once
	AC in 0.046s once
}
program Ural_1343(Input,Output);
const
	MaxLen=12;
	TestPrimeNum=9;
	TestPrime:array[1..TestPrimeNum]of Int64=(2,3,5,7,11,13,17,19,23);
type
	TIndex=Longint;
	TData=Int64;
var
	L:TIndex;
function GetMulMod(Base,Times,Divisor:TData):TData; //multiply a and b modulo c
begin
	if Times=0 then Result:=0
	else 
	begin
		Result:=GetMulMod(Base,Times shr 1,Divisor);
		Result:=Result shl 1 mod Divisor;
		if Odd(Times) then Result:=(Result+Base) mod Divisor;
	end;
end;
function GetExpMod(Base,Exponent,Divisor:TData):TData;//power a with b modulo c
begin
	if Exponent=0 then Result:=1
	else 
	begin
		Result:=GetExpMod(Base,Exponent shr 1,Divisor);
		Result:=GetMulMod(Result,Result,Divisor);
		if Odd(Exponent) then Result:=GetMulMod(Result,Base,Divisor);
	end;
end;

function IsPrime(N:TData):Boolean;
label
	Strong_Pseudoprime;
var
	i:TIndex;
	A,D,Rem:TData;
begin
	Result:=false;
	D:=N-1;
	while D mod 2=0 do D:=D shr 1;
	for i:=1 to TestPrimeNum do
	begin
		A:=TestPrime[i];
		if A>=N then Break;
		Rem:=GetExpMod(A,D,N);
		if Rem=1 then goto Strong_Pseudoprime;
		while D<=N-1 do
		begin
			if Rem=N-1 then goto Strong_Pseudoprime;
			Rem:=GetMulMod(Rem,Rem,N);
			D:=D shl 1;
		end;
		Exit;
		Strong_Pseudoprime: Continue;
	end;
	Result:=true;
end;
procedure Main;
var
	i:TIndex;
	Ch:Char;
	N,Base,Offset:TData;
	St:string[MaxLen];
begin
	Read(L);
	Base:=0;
	for i:=1 to L do
	begin
		repeat
			Read(Ch);
		until Ch in ['0'..'9'];
		Base:=Base*10+Ord(Ch)-Ord('0');
	end;
	Offset:=1;
	for i:=L+1 to MaxLen do
		Offset:=Offset*10;
	Base:=Base*Offset;
	Randomize;
	while true do
	begin
		N:=Base+Trunc(Random*Offset);
		if (N=0) or (N=1) then Continue;
		if not Odd(N) then Continue;
		if IsPrime(N) then
		begin
			Str(N:12,St);
			while Pos(' ',St)>0 do
				St[Pos(' ',St)]:='0';
			Writeln(St);
			Break;
		end;
	end;
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