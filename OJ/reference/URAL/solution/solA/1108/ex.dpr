program Ural_1108(Input,Output);
const
	MaxLen=30000;
	BitValue=100000000;
	BitWidth=8;
	MaxBitLen=MaxLen div BitWidth;
type
	TIndex=Longint;
	THP=record
		Len:TIndex;
		D:array[1..MaxBitLen]of Int64;
	end;
var
	N:TIndex;
	F:THP;
function SqrHPPro(F:THP):THP;  //n*(n-1)+1
var
	i,j:TIndex;
begin
	//note: 累加的时候 要与 进位分开0.3s 否则 1.4s 
	FillChar(Result,SizeOf(Result),0);
	for i:=1 to F.Len do
		for j:=1 to F.Len do
			if i=1 then Inc(Result.D[i+j-1],(F.D[i]-1)*F.D[j])
			else Inc(Result.D[i+j-1],F.D[i]*F.D[j]);
	Result.Len:=F.Len*2;
	Inc(Result.D[1]);
	for i:=1 to Result.Len-1 do
	begin
		Inc(Result.D[i+1],Result.D[i] div BitValue);
		Result.D[i]:=Result.D[i] mod BitValue;
	end;
	while (Result.D[Result.Len]=0) and (Result.Len>1) do Dec(Result.Len);
end;
procedure Print;
var
	i,j:TIndex;
	St:String;
begin
	for i:=F.Len downto 1 do
	begin
		if i<F.Len then
		begin
			Str(F.D[i]:BitWidth,St);
			for j:=1 to BitWidth do //replace ' ' with '0'
				if St[j]=' ' then St[j]:='0';
		end
		else Str(F.D[i],St);
		Write(St);
	end;
	Writeln;
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(N);
	F.Len:=1;
	F.D[1]:=2;
	Print;
	for i:=2 to N do
	begin
		F:=SqrHPPro(F);
		Print;
	end;
end;
begin
	Main;
end.