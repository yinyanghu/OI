program Ural_1400(Input,Output);
const
	MaxN=256;
	MaxValue=MaxLongint div 16;
type
	TIndex=Longint;
	TWay=array[1..4]of TIndex;
	TModResult=array[1..MaxN]of TIndex;
	TDistance=array[1..MaxN]of TIndex;
	TQueue=array[1..MaxN]of TIndex;
var
	N,M:TIndex;
	ModRes:TModResult;
	Way:TWay;
	D:TDistance;
	Q:TQueue;
	Min:TIndex;
	MinInd:TIndex;

procedure BFS(s:TIndex);
var
	Pop,Push:TIndex;
	i:TIndex;
	x,y:TIndex;
	Sum:TIndex;
begin
	FillChar(D,SizeOf(D),255);
	D[s]:=0;
	Q[1]:=s;
	Pop:=1;
	Push:=2;
	Sum:=0;
	while Pop<Push do
	begin
		x:=Q[Pop];
		Inc(Pop);
		Inc(Sum,D[x]);
		if Sum>Min then Exit;
		for i:=1 to 4 do
		begin
			y:=x+Way[i];
			if (i>2) and ((y>N) or (y<1)) then Continue;
			if y=0 then y:=N;
			if y=N+1 then y:=1;
			if D[y]>-1 then Continue;
			D[y]:=D[x]+1;
			Q[Push]:=y;
			Inc(Push);
		end;
	end;
	Min:=Sum;
	MinInd:=s;
end;
procedure Main;
var
	i:TIndex;
begin
	//Init
	Readln(N,M);
	for i:=1 to N do
		ModRes[i]:=i mod M;
	Way[1]:=1;
	Way[2]:=-1;
	Way[3]:=M;
	Way[4]:=-M;
	//Main
	Min:=MaxValue;
	MinInd:=0;
	for i:=1 to N do BFS(i);
	//Output
	BFS(MinInd);
	Writeln('Mean = ',Min/N:0:2);
	for i:=1 to N do
	begin
		Write(D[i]);
		if ModRes[i]=0 then 
			Writeln
		else if i<N then
			Write(' ');
	end;
	if ModRes[N]>0 then Writeln;
end;
begin
	Main;
end.