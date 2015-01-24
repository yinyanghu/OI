{
	FDigit: Fdigit[n] denote the count of any number in range 00..0-99..9
		Fdigit[2] in range 00-99
	RZero:  Redundant zero
		Rzero[n] the count of lead zero in range 00..0-99..9

	for any number di
	increase:
	for 0..9:  di*FDigit(i-1)
	for 0..di-1: 10^(i-1)
	for di: [d(i-1)..d1]+1 
		([d(i-1)..d1] denote the number combined form d(i-1) to d1)
}
program Ural_1150(Input,Output);
const
	MaxLen=9;
	FDigit:array[0..MaxLen-1]of Longint=(0,1,20,300,4000,50000,600000,7000000,80000000);
	TenPow:array[0..MaxLen-1]of Longint=(1,10,100,1000,10000,100000,1000000,10000000,100000000);
	RZero:array[1..MaxLen]of Longint=(1,11,111,1111,11111,111111,1111111,11111111,111111111);
type
	TIndex=Longint;
	TData=array[1..MaxLen]of TIndex;
	TCount=array[0..9]of TIndex;
var
	S:TCount;
	D:TData;
	Len:TIndex;

procedure Main;
var
	i,j:TIndex;
	Tmp:TIndex;
	St:string;
begin
	Readln(St);
	Len:=Length(St);
	for i:=1 to Len do
		D[Len-i+1]:=Ord(St[i])-Ord('0');
	FillChar(S,SizeOf(S),0);
	for i:=Len downto 1 do
	begin
		for j:=0 to 9 do
			Inc(S[j],D[i]*FDigit[i-1]);
		for j:=0 to D[i]-1 do
			Inc(S[j],TenPow[i-1]);
		Tmp:=0;
		for j:=i-1 downto 1 do
			Tmp:=10*Tmp+D[j];
		Inc(S[D[i]],Tmp+1);
	end;
	Dec(S[0],RZero[Len]);
	for i:=0 to 9 do
		Writeln(S[i]);
end;
begin
	Main;
end.