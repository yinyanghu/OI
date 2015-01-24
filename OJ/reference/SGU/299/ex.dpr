{
	Author: Amber
	Method: Sort+HP
}
program SGU_299(Input,Output);
const
	MaxN=1000;
	MaxLen=500 div 8+1;
	Bit=100000000;
	BitLen=8;
type
	TIndex=Longint;
	THP=record
		Len:TIndex;
		D:array[1..MaxLen]of TIndex;
	end;
	THPSet=array[1..MaxN]of THP;
	TOrder=array[1..MaxN]of TIndex;
var
	N:TIndex;
	P:TOrder;
	A:THPSet;

procedure ReadHP(var A:THP);
var
	i:TIndex;
	Code:Integer;
	St:AnsiString;
begin
	with A do
	begin
		Readln(St);
		i:=Length(St);
		Len:=0;
		while i>=BitLen do
		begin
			Inc(Len);
			Dec(i,BitLen);
			Val(Copy(St,i+1,BitLen),D[Len],Code);
		end;
		if i>0 then
		begin
			Inc(Len);
			Val(Copy(St,1,i),D[Len],Code);
		end;
	end;
end;
procedure WriteHP(const A:THP);
var
	i,j:TIndex;
	St:String[BitLen];
begin
	with A do
	begin
		Write(D[Len]);
		for i:=Len-1 downto 1 do
		begin
			Str(D[i]:BitLen,St);
			for j:=1 to BitLen do
				if St[j]=' ' then St[j]:='0';
			Write(St);
		end;
	end;
end;
function Add(const A,B:THP):THP;
var
	i:TIndex;
	R:TIndex;
begin
	FillChar(Result,SizeOf(Result),0);
	i:=1;
	R:=0;
	while (i<=A.Len) or (i<=B.Len) or (R>0) do
	begin
		Result.D[i]:=R;
		R:=0;
		if i<=A.Len then Inc(Result.D[i],A.D[i]);
		if i<=B.Len then Inc(Result.D[i],B.D[i]);
		if Result.D[i]>=Bit then
		begin
			R:=1;
			Dec(Result.D[i],Bit);
		end;
		Inc(i);
	end;
	Result.Len:=i-1;
end;
function Minus(const A,B:THP):THP;
var
	i:TIndex;
	R:TIndex;
begin
	FillChar(Result,SizeOf(Result),0);
	i:=1;
	R:=0;
	while (i<=A.Len) or (i<=B.Len) or (R<0) do
	begin
		Result.D[i]:=R;
		R:=0;
		if i<=A.Len then Inc(Result.D[i],A.D[i]);
		if i<=B.Len then Dec(Result.D[i],B.D[i]);
		if Result.D[i]<0 then
		begin
			R:=-1;
			Inc(Result.D[i],Bit);
		end;
		Inc(i);
	end;
	Result.Len:=i-1;
	with Result do
		while (D[Len]=0) and (Len>1) do Dec(Len);
end;
function Compare(const A,B:THP):TIndex;
var
	i:TIndex;
begin
	Result:=A.Len-B.Len;
	if Result<>0 then Exit;
	i:=A.Len;
	while (A.D[i]=B.D[i]) and (i>1) do Dec(i);
	Result:=A.D[i]-B.D[i];
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=P[(i+j) div 2];
	repeat
		while Compare(A[P[i]],A[Mid])<0 do Inc(i);
		while Compare(A[P[j]],A[Mid])>0 do Dec(j);
		if i<=j then
		begin
			Tmp:=P[i];
			P[i]:=P[j];
			P[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		ReadHP(A[i]);
		P[i]:=i;
	end;
	QuickSort(1,N);
	for i:=3 to N do
		if (Compare(Minus(A[P[i-1]],A[P[i-2]]),A[P[i]])<0)
			and (Compare(Add(A[P[i-1]],A[P[i-2]]),A[P[i]])>0) then 
		begin
			WriteHP(A[P[i-2]]);
			Write(' ');
			WriteHP(A[P[i-1]]);
			Write(' ');
			WriteHP(A[P[i]]);
			Writeln;
			Exit;
		end;
	Writeln('0 0 0');
end;
begin
	Main;
end.