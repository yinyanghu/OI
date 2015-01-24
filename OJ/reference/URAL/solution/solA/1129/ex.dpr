{
	Method:
		1.Add virtual edge between two odd nodes
		2.Find Euler route for each connection
		3.Del virtual edge
			Because each node has one virtual edge at most,
			the difference of Indegree and Outdegree is not more than one.
}
program Ural_1129(Input, Output);
const
	MaxN = 100;
	C_Green = -1;
	C_Yellow = -2;
type
	TIndex = Longint;
	TGraph = array[1..MaxN, 1..MaxN] of ShortInt;
	TUsed = array[1..MaxN] of Boolean;
	TVirtual = array[1..MaxN] of TIndex;
var
	N: TIndex;
	G: TGraph;
	U: TUsed;
	Last: TIndex;
	V: TVirtual;

procedure EulerRoute(i: TIndex);
var
	j: TIndex;
begin
	U[i] := true;
	for j := 1 to N do
		if G[i, j] > 0 then
		begin
			Dec(G[i, j]);
			Dec(G[j, i]);
			EulerRoute(j);
		end;
	if Last <> 0 then
		if G[Last, i] = 0 then //without the case of double-edge
		begin
			G[Last, i] := C_Green;
			G[i, Last] := C_Yellow;
		end;
	Last := i;
end;

procedure Main;
var
	i, j, k: TIndex;
	M: TIndex;
begin
	FillChar(G, SizeOf(G), 0);
	FillChar(V, SizeOf(V), 0);
	Read(N);
	k := 0;
	for i := 1 to N do
	begin
		Read(M);
		if Odd(M) then
			if k = 0 then
				k := i
			else
			begin
				Inc(G[i, k]);
				Inc(G[k, i]);
				if G[k, i] = 1 then 
				//not g[i,k] , cuz Infos of node i haven't been read in.
				//virtual edge should be deleted in output
				begin
					V[i] := k;
					V[k] := i;
				end;
				k := 0;
			end;
		while M > 0 do
		begin
			Dec(M);
			Read(j);
			Inc(G[i, j]);
		end;
	end;
	FillChar(U, SizeOf(U), 0);
	for i := 1 to N do
		if not U[i] then
		begin
			Last := 0;
			EulerRoute(i);
		end;

	for i := 1 to N do
	begin
		for j := 1 to N do
			if V[i] <> j then
				if G[i, j] = C_Green then
					Write('G ')
				else if G[i, j] = C_Yellow then
					Write('Y ');
		Writeln;
	end;
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input, 'i.txt');
	Reset(Input);
	Assign(Output, 'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.