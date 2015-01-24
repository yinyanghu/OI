{
	Author: Amber
	Method: Normal-DP
	Clarity:
		求n*n棋盘上放k个象的方案数, 大数据版。
		详见SGU 220
	Complexity: O(n^2)
	Notice: 详见SGU 220
}
program SGU_220(Input,Output);
const
	MaxN=50;
	MaxLen=40;
	Bit=10000;
	BitLen=4;
type
	TIndex=Longint;
	THP=record
		Len:TIndex;
		D:array[1..MaxLen]of Longint;
	end;
	TDP=array[0..MaxN]of THP;
var
	N,K:TIndex;
	Count:THP;

procedure SetHP(var A:THP;B:TIndex);
begin
	FillChar(A,SizeOf(A),0);
	A.Len:=1;
	A.D[1]:=B;
end;
procedure PrintHP(const A:THP);
var
	i,j:TIndex;
	St:String[BitLen];
begin
	Write(A.D[A.Len]);
	for i:=A.Len-1 downto 1 do
	begin
		Str(A.D[i]:BitLen,St);
		for j:=1 to BitLen do
			if St[j]=' ' then St[j]:='0';
		Write(St);
	end;
	Writeln;
end;
procedure IncHP(var A:THP;B:THP);
var
	i:TIndex;
	R:TIndex;
begin
	i:=1;
	R:=0;
	while (i<=B.Len) or (R>0) do
	begin
		Inc(A.D[i],R);
		R:=0;
		if i<=B.Len then Inc(A.D[i],B.D[i]);
		if A.D[i]>=Bit then
		begin
			R:=1;
			Dec(A.D[i],Bit);
		end;
		Inc(i);
	end;
	if i-1>A.Len then A.Len:=i-1;
end;
function Multiply(const A:THP;B:TIndex):THP;
var
	i:TIndex;
	R:TIndex;
begin
	Result:=A;
	R:=0;
	for i:=1 to Result.Len do
	begin
		Result.D[i]:=Result.D[i]*B+R;
		R:=Result.D[i] div Bit;
		Result.D[i]:=Result.D[i] mod Bit;
	end;
	if R>0 then
	begin
		Inc(Result.Len);
		Result.D[Result.Len]:=R;
	end;
end;
function MultiplyHP(const A,B:THP):THP;
var
	i,j:TIndex;
begin
	SetHP(Result,0);
	for i:=1 to A.Len do
		for j:=1 to B.Len do
		begin
			Inc(Result.D[i+j-1],A.D[i]*B.D[j]);
			Inc(Result.D[i+j],Result.D[i+j-1] div Bit);
			Result.D[i+j-1]:=Result.D[i+j-1] mod Bit;
		end;
	Result.Len:=A.Len+B.Len;
	while (Result.D[Result.Len]=0) and (Result.Len>1) do Dec(Result.Len);
end;
procedure DP(First,Level:TIndex;var Num:TIndex;var F:TDP);
var
	i,j:TIndex;
begin
	FillChar(F,SizeOf(F),0);
	SetHP(F[0],1);
	SetHP(F[1],First);
	Num:=First;
	for i:=2 to Level do
	begin
		if Odd(i) then
		begin
			SetHP(F[Num+1],0);
			SetHP(F[Num+2],0);
			Inc(Num,2);
		end;
		for j:=Num downto 1 do
			IncHP(F[j],Multiply(F[j-1],(Num-j+1)));
	end;
end;
procedure Main;
var
	i:TIndex;
	Fp,Fq:TDP;
	Last,Left,Right:TIndex;
begin
	Readln(N,K);
	if N=1 then
	begin
		if K<=1 then 
			Writeln(1)
		else 
			Writeln(0);
		Exit;
	end;
	Left:=0;
	Right:=K;
	DP(1,N,Last,Fp);
	if Last<Right then Right:=Last;
	DP(2,N-1,Last,Fq);
	if K-Last>Left then Left:=K-Last;
	SetHP(Count,0);
	for i:=Left to Right do
		IncHP(Count,MultiplyHP(Fp[i],Fq[K-i]));
	PrintHP(Count);
end;
begin
	Main;
end.