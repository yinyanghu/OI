{
	F[i,j,k,p] means
	Land 1 has i cities, Land 2 has j cities and Land 3 has k cities.
	One will go to Land p.
	F[1,0,0,1] means 1 city left in Land 1.
	Because of keeping identical,
	Ans=(F[n,n,n,2]+F[n,n,n,3])/2=F[n,n,n,2]
}
program Ural_1172(Input,Output);
const
	MaxN=30;
	MaxLen=18;
	BitLen=7;
	Bit=10000000;
type
	TIndex=Longint;
	TData=LongWord;
	THP=record
		Len:TIndex;
		D:array[0..MaxLen]of TData;
	end;
	TDP=array[Boolean,0..MaxN,0..MaxN,1..3]of THP;
var
	N:TIndex;
	F:TDP;
function AddMul(const A,B:THP;C:TData):THP;//Result=(A+B)*C
var
	i:TIndex;
	R:TData;
begin
	i:=0;
	R:=0;
	while (i<=A.Len) or (i<=B.Len) or (R>0) do
	begin
		Result.D[i]:=R;
		if i<=A.Len then Inc(Result.D[i],A.D[i]*C);
		if i<=B.Len then Inc(Result.D[i],B.D[i]*C);
		R:=Result.D[i] div Bit;
		Result.D[i]:=Result.D[i] mod Bit;
		Inc(i);
	end;
	Result.Len:=i-1;
end;
procedure Main;
var
	i,j,k:TIndex;
	p:Boolean;
	St:String[BitLen];
begin
	Readln(N);
	FillChar(F,SizeOf(F),0);
	p:=Odd(1);
	F[p,0,0,1].D[0]:=1;
	for i:=1 to N do
	begin
		for j:=0 to N do
			for k:=0 to N do
			begin
				if i+j+k=1 then Continue;
				if i>1 then F[p,j,k,1]:=AddMul(F[not p,j,k,2],F[not p,j,k,3],i-1);
				if j>0 then F[p,j,k,2]:=AddMul(F[p,j-1,k,1],F[p,j-1,k,3],j);
				if k>0 then F[p,j,k,3]:=AddMul(F[p,j,k-1,1],F[p,j,k-1,2],k);
			end;
		p:=not p;
	end;
	with F[Odd(N),N,N,2] do 
	begin
		Write(D[Len]);
		for i:=Len-1 downto 0 do
		begin
			Str(D[i]:BitLen,St);
			for j:=1 to BitLen do
				if St[j]=' ' then Write(0)
				else Write(St[j]);
		end;
		Writeln;
	end;
end;
begin
	Main;
end.