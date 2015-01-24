{
	The compression of the element of Hash.
	Int64
	63-37 Bit: Index
	36-19 Bit: X1
	18-1  Bit: X2
}
program Ural_1175(Input,Output);
const
	MaxHashSize=98129;
	Bit=18;
	Modulo=1 shl 18-1;
type
	TIndex=Longint;
	TValue=Int64;
	THash=array[0..MaxHashSize-1]of TValue;
var
	Hash:THash;
function HashInsert(X1,X2,Ind:TIndex;var Ret:TIndex):Boolean;
var
	i:TIndex;
begin
	i:=(X1 shl 7+X2) mod MaxHashSize; //Calc Hash
	Result:=false;
	while Hash[i]>0 do
	begin
		if (Hash[i] shr Bit and Modulo=X1) and (Hash[i] and Modulo=X2) then //IsEqual
		begin
			Ret:=Hash[i] shr Bit shr Bit;
			Exit;
		end;
		Inc(i);
		if i=MaxHashSize then i:=0;
	end;
	Result:=true;
	Hash[i]:=TValue(Ind) shl Bit shl Bit+TValue(X1) shl Bit+X2; //Calc Value
end;
procedure Main;
var
	i,j:TIndex;
	A1,A2,A3,A4,B1,B2,C,X1,X2:TIndex;
	T:TValue;
begin
	FillChar(Hash,SizeOf(Hash),0);
	Read(A1,A2,A3,A4,B1,B2,C,X1,X2);
	i:=0;
	repeat
		Inc(i);
		//Loop up in Hash
		if not HashInsert(X1,X2,i,j) then
		begin
			Writeln(j,' ',i-j);
			Break;
		end;
		//Transfer
		T:=A1*X1*X2+A2*X1+A3*X2+A4;
		if T>B1 then
			while T>B2 do
				Dec(T,C);
		X1:=X2;
		X2:=T;
	until false;
end;
begin
	Main;
end.