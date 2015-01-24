{
	Author: Amber
	Method: Enumerate + Encode
	Clarity:
		1.Enumerate the length of answer Len increasing.
		2.Encode the substrings with length Len in string, label it in table.
		3.Enumerate unlabeled substrings with length Len, if not exists, goto 1.
	Complexity: O(N)*O(2^MaxCodeLen)
}
program SGU_142(Input,Output);
const
	MaxN=500000;
	MaxCode=1 shl 19;
type
	TIndex=Longint;
	TString=array[1..MaxN]of Byte;
	TFlag=array[0..MaxCode-1]of Boolean; //Simple Hash, Hash(x)=x
var 
	N:TIndex;
	F:TFlag;
	S:TString;

function Decode(Code,Len:TIndex):String;
var
	i:TIndex;
begin
	Str(0:Len,Result);
	for i:=Len downto 1 do
	begin
		Result[i]:=Chr(Code and 1+Ord('a'));
		Code:=Code shr 1;
	end;
end;

procedure Main;
var 
	i,j:TIndex;
	Code:TIndex;
	Modulo:TIndex;
	Ch:Char;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Read(Ch);
		S[i]:=Ord(Ch)-Ord('a');
	end;
	Readln;
	i:=1;
	repeat
		Modulo:=1 shl i-1;
		FillChar(F,SizeOf(F),0);
		Code:=0;
		for j:=1 to i-1 do
			Code:=Code shl 1 or S[j];
		for j:=i to N do
		begin
			Code:=Code shl 1 and Modulo or S[j];
			F[Code]:=true;
		end;
		for j:=0 to 1 shl i-1 do
			if not F[j] then
			begin
				Writeln(i);
				Writeln(Decode(j,i));
				Exit;
			end;
		Inc(i);
	until 1 shl (i-1)>N;
end;
begin
	Main;
end.