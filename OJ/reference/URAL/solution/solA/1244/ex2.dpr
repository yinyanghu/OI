program Ural_1244(Input,Output);
const
	MaxN=100;
	MaxM=MaxN*1000;
	MaxValue=127;
type
	TIndex=Longint;
	TData=array[1..MaxN]of TIndex;
	TDP_Pred=array[0..MaxM]of ShortInt;
	TPath=array[1..MaxN]of ShortInt;
var
	N,M:TIndex;
	D:TData;
	F:TDP_Pred;
	Len:TIndex;
	Path:TPath;

procedure Main;
var
	i,j:TIndex;
	Last:TIndex;
begin
	Readln(M);
	M:=-M;
	Readln(N);
	for i:=1 to N do
	begin
		Readln(D[i]);
		Inc(M,D[i]);
	end;
	if M<0 then
	begin
		Writeln(0);
		Exit;
	end;
	F[0]:=0;
	for i:=1 to M do
		F[i]:=MaxValue;
	for i:=0 to M-1 do
		if F[i]<MaxValue then
			for j:=F[i]+1 to N do
				if (i+D[j]<=M) and (j<F[i+D[j]]) then
					F[i+D[j]]:=j;
	if F[M]=MaxValue then
	begin
		Writeln(0);
		Exit;
	end;
	i:=M;
	Last:=N+1;
	Len:=0;
	while i>0 do
	begin
		for j:=F[i]+1 to Last-1 do
			if (i-D[j]>=0) and (F[i-D[j]]<j) then
			begin
				Writeln(-1);
				Exit;
			end;
		Inc(Len);
		Path[Len]:=F[i];
		Last:=F[i];
		Dec(i,D[F[i]]);
	end;
	for i:=Len downto 1 do
		Write(Path[i],' ');
	Writeln;
end;
begin
	Main;
end.