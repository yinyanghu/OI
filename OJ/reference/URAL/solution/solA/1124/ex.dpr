{
	Method: Euler Route
	Update connection by Disjoint Set
}
program Ural_1124(Input, Output);
const
	MaxM = 500;
type
	TIndex = Longint;
	TDeltaDegree = array[1..MaxM] of TIndex; //In - Out,viz In+,Out-
	TFather = array[1..MaxM] of TIndex;
	TDegreeSum = array[1..MaxM] of TIndex;
var
	D: TDeltaDegree;
	F: TFather;
	S: TDegreeSum;
	N, M: TIndex;
	Total: TIndex;

function Find(x: TIndex): TIndex;
begin
	if F[x] < 0 then
		Result := x
	else
	begin
		F[x] := Find(F[x]);
		Result := F[x];
	end;
end;

procedure Merge(x, y: TIndex);
var
	Rx, Ry: TIndex;
begin
	Rx := Find(x);
	Ry := Find(y);
	if Rx = Ry then
		Exit;
	if (-F[Rx]) < (-F[Ry]) then
	begin
		Inc(F[Ry], F[Rx]);
		F[Rx] := Ry;
	end
	else
	begin
		Inc(F[Rx], F[Ry]);
		F[Ry] := Rx;
	end
end;

procedure Main;
var
	i, j, k: TIndex;
begin
	FillChar(D, SizeOf(D), 0);
	FillChar(S, SizeOf(S), 0);
	FillChar(F, SizeOf(F), 255);
	Readln(M, N);
	Total := 0;
	for i := 1 to M do
		for j := 1 to N do
		begin
			Read(k);
			if k <> i then
			begin
				Inc(Total);
				Dec(D[i]);
				Inc(D[k]);
				Merge(i, k);
			end;
		end;
	for i := 1 to M do //Count absolute value of degree in each connection
		Inc(S[Find(i)], Abs(D[i]));
	for i := 1 to M do
		if F[i] <= -2 then //Over one node in one connection
		begin
			if S[i] = 0 then
				S[i] := 2;
			Inc(Total, S[i] div 2);
		end;
	if Total>0 then  //If only one connection, then it can't be counted. Else get WA.
		Dec(Total); //First Euler Route won't be counted
	Writeln(Total);
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