{
	typical Single Shortest Path 
	Algorithm: Dijkstra
}
{$N+}
program Ural_1205(Input, Output);
const
	MaxN = 200;
	MaxValue = MaxLongint;
type
	TIndex = Longint;
	TData = Extended;
	TStation = array[0..MaxN + 1] of record
		X, Y: TData;
	end;
	TGraph = array[0..MaxN + 1, 0..MaxN + 1] of TData;
	TDijkstra = array[0..MaxN + 1] of record
		Distance: TData;
		Checked: Boolean;
		Prev: TIndex;
	end;
	TPath=array[1..MaxN+2]of TIndex;
var
	SpeedFeet, SpeedSubway: TData;
	N: TIndex;
	G: TGraph;
	D: TDijkstra;
	P: TStation;
	Q: TPath;

procedure Dijkstra;
var
	MinIndex, S, T, Len: TIndex;
	i: TIndex;
	MinDistance: TData;
begin
	S := 0;
	T := N + 1;
	for i := 0 to N + 1 do
	begin
		D[i].Distance := MaxValue;
		D[i].Checked := false;
		D[i].Prev := -1;
	end;
	D[S].Distance := 0;
	while not D[T].Checked do
	begin
		MinDistance := MaxValue;
		MinIndex := -1;
		for i := 0 to N + 1 do
			if (D[i].Distance < MinDistance) and not D[i].Checked then
			begin
				MinDistance := D[i].Distance;
				MinIndex := i;
			end;
		if MinIndex=-1 then Break;
		D[MinIndex].Checked := true;
		for i := 0 to N + 1 do
			if not D[i].Checked and (D[i].Distance > D[MinIndex].Distance + G[MinIndex, i]) then
			begin
				D[i].Distance := D[MinIndex].Distance + G[MinIndex, i];
				D[i].Prev:=MinIndex;
			end;
	end;	
	Len := 0;
	i:=D[T].Prev;
	while i>0 do
	begin
		Inc(Len);
		Q[Len]:=i;
		i:=D[i].Prev;
	end;
	Writeln(D[T].Distance: 0: 7);
	Write(Len);
	for i:=Len downto 1 do
		Write(' ',Q[i]);
	Writeln;
end;

function GetDistance(i, j: TIndex): TData;
begin
	GetDistance := Sqrt(Sqr(P[i].X - P[j].X) + Sqr(P[i].Y - P[j].Y));
end;

procedure Init;
var
	i, j: TIndex;
begin
	FillChar(G, SizeOf(G), 0);
	Readln(SpeedFeet, SpeedSubway);
	Readln(N);
	for i := 1 to N do
		Readln(P[i].X, P[i].Y);
	while true do
	begin
		Readln(i, j);
		if (i = 0) or (j = 0) then Break;
		G[i, j] := MaxValue;
		G[j, i] := MaxValue;
	end;
	Readln(P[0].X, P[0].Y);
	Readln(P[N + 1].X, P[N + 1].Y);
	for i := 0 to N + 1 do
		for j := 0 to N + 1 do
			if i = j then
				G[i, j] := MaxValue
			else if G[i, j] > 0 then
				G[i, j] := GetDistance(i, j) / SpeedSubway
			else 
				G[i, j] := GetDistance(i, j) / SpeedFeet;
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Init;
	Dijkstra;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.

