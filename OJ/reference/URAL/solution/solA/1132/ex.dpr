{
	Method: Maths

	It's not really hard problem.
	It only need some knowledge of number theory: square roots modulo a prime.
	I.e. Given an odd prime p and a quadratic residue a (mod p), returns an x such that x^2 mod p = a.

	This algorithm relies on Euler's criterion: 
	if p is an odd prime and a is a nonzero residue mod p, then 
	a^((p-1)/2) mod p = +1 if and only if a is a quadratic residue, 
	a^((p-1)/2) mod p = -1 if and only if a is not a quadratic residue. 
	Furthermore, it relies on the fact that precisely one half of the nonzero residues mod p are quadratic residues.

	Power: O(logn)
	Sqrt_Root: O(logn) * O(logn)
}
program Ural_1132(Input,Output);
type
	TIndex=Longint;

function Power(Base,Exponent,Modulo:TIndex):TIndex;
begin
	if Exponent=1 then
		Result:=Base mod Modulo
	else
	begin
		Result:=Power(Base,Exponent div 2,Modulo);
		Result:=Result*Result mod Modulo;
		if Odd(Exponent) then Result:=Result*Base mod Modulo;
	end;
end;
function Sqrt_Root(A,P:TIndex;var R:TIndex):Boolean;
var
	B:TIndex;
	S,T:TIndex;
begin
	Result:=false;
	if Power(A,(P-1) div 2,P)=P-1 then Exit;
	Result:=true;
	if P mod 4=3 then
		R:=Power(A,(P+1) div 4,P)
	else if P mod 8=5 then
	begin
		if Power(A,(P-1) div 4,P)=1 then
			R:=Power(A,(P+3) div 8,P)
		else //now a^((p-1)/4) mod p=-1
		begin
			repeat
				B:=Random(P-1)+1;
			until Power(B,(P-1) div 2,P)=P-1;
			R:=Power(A,(P+3) div 8,P)*Power(B,(P-1) div 4,P) mod P;
		end;
	end
	else //now p mod 8=1
	begin
		S:=(P-1) div 4;
		while Power(A,S,P)=1 do
			if Odd(S) then
			begin
				R:=Power(A,(S+1) div 2,P);
				Exit;
			end
			else
				S:=S div 2;
		//now a^s mod p=-1
		repeat
			B:=Random(P-1)+1;
		until Power(B,(P-1) div 2,P)=P-1;
		T:=(P-1) div 2;
		while not Odd(S) do
		begin
			S:=S div 2;
			T:=T div 2;
			if Power(A,S,P)*Power(B,T,P) mod P=P-1 then T:=T+(P-1) div 2;
			//a^s*b^t mod p=1
		end;
		R:=Power(A,(S+1) div 2,P)*Power(B,T div 2,P) mod P;
	end;
end;
procedure Main;
var
	A,P,R:TIndex;
	DataNum:TIndex;
begin
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		Readln(A,P);
		if Sqrt_Root(A,P,R) then
		begin
			if (R+P) mod P<(-R+P) mod P then //keep order
				Writeln((R+P) mod P,' ',(-R+P) mod P)
			else
				Writeln((-R+P) mod P,' ',(R+P) mod P);
		end
		else 
			Writeln('No root');
	end;
end;
begin
	Main;
end.