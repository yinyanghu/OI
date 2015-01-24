{
	¥Ì≈≈
    f(n)=(n-1)*(f(n-1)+f(n-2))
        =n!*sum{(-1)^i/i!|0<=i<=n}
}
program Ural_1366(Input,Output);
const
	MaxLen=3000;
type
	TIndex=Longint;
	THP=record
		Len:TIndex;
		D:array[1..MaxLen]of SmallInt;
	end;
var
	N:TIndex;
procedure AddHP(var A:THP;const B:THP);
var
	i:TIndex;
	R:TIndex;
begin
	R:=A.D[1]+B.D[1];
	i:=1;
	while (R>0) or (i<=B.Len) do
	begin
		A.D[i]:=R mod 10;
		Inc(i);
		R:=R div 10+A.D[i]+B.D[i];
	end;
	if i-1>A.Len then A.Len:=i-1;
end;
procedure MinusHP(var A:THP;const B:THP);
var
	i:TIndex;
	R:TIndex;
begin
	R:=A.D[1]-B.D[1];
	i:=1;
	while (R<>0) or (i<=B.Len) do
	begin
		if R<0 then
		begin
			Dec(A.D[i+1]);
			Inc(R,10);
		end;
		A.D[i]:=R mod 10;
		Inc(i);
		R:=R div 10+A.D[i]-B.D[i];
	end;
	while (A.D[A.Len]=0) and (A.Len>1) do Dec(A.Len);
end;
procedure MultiplyHP(var A:THP;const B:TIndex);  //B>0
var
	i:TIndex;
	R:TIndex;
begin
	R:=A.D[1]*B;
	i:=1;
	while (R>0) or (i<=A.Len) do
	begin
		A.D[i]:=R mod 10;
		Inc(i);
		R:=R div 10+A.D[i]*B;
	end;
	if i-1>A.Len then A.Len:=i-1;
end;
procedure SetHP(var A:THP;const B:TIndex);
begin
	FillChar(A,SizeOf(A),0);
	A.Len:=1;
	A.D[1]:=B;
end;
procedure Main;
var
	i:TIndex;
	Tmp,Base,Buffer,Answer:THP;
begin
	Readln(N);
	SetHP(Base,1);
	SetHP(Buffer,0);
	SetHP(Answer,0);
	for i:=N downto 0 do
	begin
		if Odd(i) then Buffer:=Base
		else
		begin
			Tmp:=Base;
			MinusHP(Base,Buffer);
			AddHP(Answer,Base);
			Base:=Tmp;
		end;
		MultiplyHP(Base,i);
	end;
	for i:=Answer.Len downto 1 do
		Write(Answer.D[i]);
	Writeln;
end;
begin
	Main;
end.