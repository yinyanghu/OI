{
	Author: Amber
	Method: Enumerate
	Clarity: 
		The maximum may occur in the case that one certain person stands at mid-point of two adjacent doors.
	Complexity: O(NM(N+M))
}
program SGU_158(Input,Output);
const
	MaxN=300;
	MaxM=300;
type
	TIndex=Longint;
	TDistance=array[1..MaxN]of TIndex;
	TPosition=array[1..MaxM]of TIndex;	
var
	N,M:TIndex;
	L:TIndex;
	D:TDistance;
	P:TPosition;
	MaxS:TIndex;
	Max:TIndex;
procedure Update(S:TIndex);
var
	i,j:TIndex;
	Sum:TIndex;
begin
	j:=1;
	Sum:=0;
	for i:=1 to M do
	begin
		while (j<N) and (Abs(S+D[j]-P[i])>Abs(S+D[j+1]-P[i])) do Inc(j);
		Inc(Sum,Abs(S+D[j]-P[i]));
	end;
	if Sum>Max then
	begin
		MaxS:=S;
		Max:=Sum;
	end;
end;
procedure Main;
var
	i,j:TIndex;
	S:TIndex;
begin
	Read(L,M);
	L:=L*2;
	for i:=1 to M do
	begin
		Read(P[i]);
		P[i]:=P[i]*2;
	end;
	Read(N);
	D[1]:=0;
	for i:=2 to N do
	begin
		Read(D[i]);
		D[i]:=D[i]*2;
	end;
	MaxS:=0;
	Max:=-1;
	Update(0);
	Update(L-D[N]);
	for i:=1 to N-1 do
		for j:=1 to M do
		begin
			S:=P[j]-(D[i]+D[i+1]) div 2;
			if (0<=S) and (S<=L-D[N]) then Update(S);
		end;
	Writeln(MaxS/2:0:1,' ',Max/2:0:1);
end;
begin
	Main;
end.