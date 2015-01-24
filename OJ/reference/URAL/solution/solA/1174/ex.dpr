{
	See: "note.txt"
}
program Ural_1174(Input,Output);
const
	MaxN=100;
	MaxLen=200;
	Buffer=3;
type
	TIndex=Longint;
	TPermutation=array[1..MaxN]of TIndex;
	THP=record
		Len:TIndex;
		D:array[1..MaxLen]of Integer;
	end;
var
	N:TIndex;
	D,P,F:TPermutation;
	S,Ite:THP;

procedure SetHP(var A:THP;B:TIndex);
begin
	FillChar(A,SizeOf(A),0);
	A.Len:=1;
	A.D[1]:=B;
end;

function Add(A,B:THP):THP;
var
	i:TIndex;
begin
	FillChar(Result,SizeOf(Result),0);
	Result.Len:=A.Len;
	if B.Len>A.Len then Result.Len:=B.Len;
	for i:=1 to Result.Len do
	begin
		Inc(Result.D[i],A.D[i]+B.D[i]);
		Inc(Result.D[i+1],Result.D[i] div 10);
		Result.D[i]:=Result.D[i] mod 10;
	end;
	Inc(Result.Len);
	while (Result.D[Result.Len]=0) and (Result.Len>1) do Dec(Result.Len);
end;

function Multiply(A:THP;B:TIndex):THP;
var
	i:TIndex;
begin
	FillChar(Result,SizeOf(Result),0);
	Result.Len:=A.Len;
	for i:=1 to Result.Len+Buffer do
	begin
		Inc(Result.D[i],A.D[i]*B);
		Inc(Result.D[i+1],Result.D[i] div 10);
		Result.D[i]:=Result.D[i] mod 10;
	end;
	Inc(Result.Len,Buffer);
	while (Result.D[Result.Len]=0) and (Result.Len>1) do Dec(Result.Len);
end;

procedure Main;
var
	i,j:TIndex;
	M:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Read(D[i]);
		P[D[i]]:=i;
	end;
	Readln;
	FillChar(F,SizeOf(F),0);
	for i:=1 to N do //Number
		for j:=1 to P[i]-1 do //Position
			if D[j]<i then Inc(F[i]);
	M:=0;
	for i:=2 to N do
	begin
		if M=0 then F[i]:=i-1-F[i]; 
		M:=(M*i+F[i]) mod 2;
	end;
	SetHP(S,1);
	SetHP(Ite,1);
	for i:=N downto 2 do
	begin
		S:=Add(S,Multiply(Ite,F[i]));
		Ite:=Multiply(Ite,i);
	end;
	for i:=S.Len downto 1 do
		Write(S.D[i]);
	Writeln;
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
