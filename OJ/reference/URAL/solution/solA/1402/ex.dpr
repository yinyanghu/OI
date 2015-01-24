{
	Sum[P(n,m)|2<=m<=n]
}
program Ural_1402(Input,Output);
const
	Modulo=10000000000000000;
	BitLen=16;
type
	TIndex=Longint;
	THP=array[1..2]of Int64;  //16 bit
var
	N:TIndex;
procedure Multiply(var A:THP;B:TIndex);
begin
	A[1]:=A[1]*B;
	A[2]:=A[2]*B;
	Inc(A[2],A[1] div Modulo);
	A[1]:=A[1] mod Modulo;
end;
procedure Add(var A:THP;const B:THP);
begin
	Inc(A[1],B[1]);
	Inc(A[2],B[2]);
	Inc(A[2],A[1] div Modulo);
	A[1]:=A[1] mod Modulo;
end;
procedure Print(const A:THP);
var
	St:String[BitLen];
begin
	if A[2]=0 then
		Write(A[1])
	else
	begin
		Write(A[2]);
		Str(A[1]:BitLen,St);
		while Pos(' ',St)>0 do St[Pos(' ',St)]:='0';
		Write(St);
	end;
	Writeln;
end;
procedure Main;
var
	M:TIndex;
	Cur,Ans:THP;
begin
	Readln(N);
	FillChar(Cur,SizeOf(Cur),0);
	FillChar(Ans,SizeOf(Ans),0);
	Cur[1]:=N;
	for M:=2 to N do
	begin
		Multiply(Cur,N-M+1);
		Add(Ans,Cur);
	end;
	Print(Ans);
end;
begin
	Main;
end.