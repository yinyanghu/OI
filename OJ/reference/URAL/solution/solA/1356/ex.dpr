{
	1.Goldbach conjecture.
	2.All primes without 2,3 are in form 6k-1 or 6k+1. O(n/6)
}
program Ural_1356(Input,Output);
const
	TestPrimeNum=6;
	TestPrime:array[1..TestPrimeNum]of Longint=(2,3,5,7,11,13);
type
	TIndex=Longint;

function GetMulMod(Base,Times,Divisor:TIndex):TIndex; //multiply a and b modulo c
begin
	if Times=0 then Result:=0
	else 
	begin
		Result:=GetMulMod(Base,Times shr 1,Divisor);
		Result:=Result shl 1 mod Divisor;
		if Odd(Times) then Result:=(Result+Base) mod Divisor;
	end;
end;
function GetExpMod(Base,Exponent,Divisor:TIndex):TIndex;//power a with b modulo c
begin
	if Exponent=0 then Result:=1
	else 
	begin
		Result:=GetExpMod(Base,Exponent shr 1,Divisor);
		Result:=GetMulMod(Result,Result,Divisor);
		if Odd(Exponent) then Result:=GetMulMod(Result,Base,Divisor);
	end;
end;

function IsPrime(N:TIndex):Boolean;
label
	Strong_Pseudoprime;
var
	i:TIndex;
	A,D,Rem:TIndex;
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

function Decompose(N:TIndex):TIndex;
	function Check(x:TIndex):Boolean;
	begin
		Result:=false;
		if x<=N div 2 then
			if (N mod x>0) or ((N mod x=0) and (N div x=2)) then 
				if IsPrime(x) and IsPrime(N-x)then
					Result:=true;
	end;
var
	i:TIndex;
begin
	Result:=0;
	if Check(3) then
	begin
		Result:=3;
		Exit;
	end;
	for i:=1 to N div 2 div 6 do
		if Check(i*6-1) then
		begin
			Result:=i*6-1;
			Break;
		end
		else if Check(i*6+1) then
		begin
			Result:=i*6+1;
			Break;
		end;
end;
procedure Main;
var
	x:TIndex;
	N:TIndex;
begin
	Readln(N);
	if N=2 then 
		Writeln(2)
	else if N=4 then
		Writeln(2,' ',2)
	else if not Odd(N) then
	begin
		x:=Decompose(N);
		Writeln(x,' ',N-x);
	end
	else if Odd(N) then
	begin
		if IsPrime(N) then
			Writeln(N)
		else if IsPrime(N-2) then
			Writeln(2,' ',N-2)
		else
		begin
			x:=Decompose(N-3);
			Writeln(3, ' ',x,' ',N-3-x);
		end;
	end;
end;

var
	DataNum:TIndex;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		Main;
	end;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.