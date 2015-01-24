{
	From mathworld:
	    A set of n vectors v_1, v_2, ..., v_n is linearly independent 
	iff the matrix rank of the matrix m=(v_1 v_2 ... v_n)  is n, in which case m is diagonalizable.
	
	So the number of the independent sorts of all vectors is n.
	Algorithm following:
	Sort all vectors into independent sorts.
	Sum the minimum vector of each sort.
}
program Ural_1041(Input,Output);
const
	MaxN=50;
	MaxM=2000;
type
	TIndex=Longint;
	TVector=array[1..MaxN]of TIndex;
	TVectorSet=array[1..MaxM]of TVector;
	TPriceSet=array[1..MaxM]of TIndex;
	TVectorIndex=array[1..MaxN]of TIndex;
var
	N,M:TIndex;
	V:TVectorSet;
	P:TPriceSet;
	C:TIndex;
	E:TVectorIndex;

function Independent(x,y:TIndex):Boolean;
var
	i:TIndex;
begin
	Result:=true;
	for i:=1 to N do
		if (V[x][i]=0) xor (V[y][i]=0) then Exit;
	Result:=false;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=E[(i+j) div 2];
	repeat
		while E[i]<Mid do Inc(i);
		while E[j]>Mid do Dec(j);
		if i<=j then
		begin
			Tmp:=E[i];
			E[i]:=E[j];
			E[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure Main;
var
	i,j:TIndex;
	IsZero,IsRepeat:Boolean;
	Ans:TIndex;
begin
	Readln(M,N);
	for i:=1 to M do
	begin
		for j:=1 to N do
			Read(V[i][j]);
		Readln;
	end;
	C:=0;
	for i:=1 to M do
	begin
		Readln(P[i]);
		IsZero:=true;
		for j:=1 to N do
			if V[i][j]<>0 then
			begin
				IsZero:=false;
				Break;
			end;
		if IsZero then Continue;
		IsRepeat:=false;
		for j:=1 to C do
			if not Independent(i,E[j]) then
			begin
				if P[E[j]]>P[i] then E[j]:=i;
				IsRepeat:=true;
				Break;
			end;
		if not IsRepeat then
		begin
			Inc(C);
			E[C]:=i;
		end;
	end;
	if C<N then
	begin
		Writeln(0);
		Exit;
	end;
	//Now C=N
	QuickSort(1,N);
	Ans:=0;
	for i:=1 to N do
		Inc(Ans,P[E[i]]);
	Writeln(Ans);
	for i:=1 to N do
		Writeln(E[i]);
end;
begin
	Main;
end.