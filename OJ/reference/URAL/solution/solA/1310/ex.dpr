program Ural_1310(Input,Output);
const
	MaxL=100;
	MaxK=50;
	MaxLen=100;
	BitLen=4;
	BitSize=10000;
type
	TIndex=Longint;
	THP=record
		Len:TIndex;
		D:array[1..MaxLen]of SmallInt;
	end;
	TDP=array[0..MaxL,0..MaxK-1]of THP;
var
	L,M,K:TIndex;
	N:THP;
	F:TDP;

function StrToHP(A:String):THP;
var
	Code:Integer;
begin
	FillChar(Result,SizeOf(Result),0);
	while A<>'' do
	begin
		Inc(Result.Len);
		if Length(A)>=BitLen then
		begin
			Val(Copy(A,Length(A)-BitLen+1,BitLen),Result.D[Result.Len],Code);
			Delete(A,Length(A)-BitLen+1,BitLen);
		end
		else
		begin
			Val(Copy(A,1,Length(A)),Result.D[Result.Len],Code);
			Delete(A,1,Length(A));
		end;
	end;
end;
procedure IncHP(var A:THP;const B:THP);
var
	i:TIndex;
	R:TIndex;
begin
	i:=1;
	R:=0;
	while (i<=B.Len) or (R>0) do
	begin
		if i<=B.Len then Inc(A.D[i],B.D[i]);
		Inc(A.D[i],R);
		R:=0;
		if A.D[i]>=BitSize then
		begin
			Dec(A.D[i],BitSize);
			R:=1;
		end;
		Inc(i);
	end;
	if i-1>A.Len then A.Len:=i-1;
end;
procedure DecHP(var A:THP;const B:THP);
var
	i:TIndex;
	R:TIndex;
begin
	i:=1;
	R:=0;
	while (i<=B.Len) or (R>0) do
	begin
		if i<=B.Len then Dec(A.D[i],B.D[i]);
		Dec(A.D[i],R);
		R:=0;
		if A.D[i]<0 then
		begin
			Inc(A.D[i],BitSize);
			R:=1;
		end;
		Inc(i);
	end;
	while (A.D[A.Len]=0) and (A.Len>1) do Dec(A.Len);
end;
function Compare(const A,B:THP):TIndex;
var
	i:TIndex;
begin
	Result:=A.Len-B.Len;
	if Result=0 then
	begin
		i:=A.Len;
		while (A.D[i]=B.D[i]) and (i>1) do Dec(i);
		Result:=A.D[i]-B.D[i];
	end;
end;
function InRange(X:TIndex):TIndex;
begin
	Result:=(X mod K+K) mod K;
end;
procedure Main;
var
	i,j,p:TIndex;
	Sum:TIndex;
	St:String;
begin
	Readln(L,M,K);
	//Precompute by DP
	FillChar(F,SizeOf(F),0);
	for i:=0 to K-1 do
		F[0,i].Len:=1;
	F[0,0].D[1]:=1;
	for i:=1 to L do
		for j:=0 to K-1 do
		begin
			F[i,j].Len:=1;
			for p:=1 to M do
				IncHP(F[i,j],F[i-1,InRange(j-p)]);
		end;
	//Get Vector
	Readln(St);
	N:=StrToHP(St);
	IncHP(N,StrToHP('1'));
	Sum:=0;
	for i:=1 to L do
		for j:=1 to M do
			if Compare(F[L-i,InRange(-Sum-j)],N)>=0 then
			begin
				if i>1 then Write(' ');
				Write(j);
				Sum:=(Sum+j) mod K;
				Break;
			end
			else
				DecHP(N,F[L-i,InRange(-Sum-j)]);
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