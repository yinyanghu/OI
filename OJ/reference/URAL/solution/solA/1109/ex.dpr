{
	Bipartite-match
	Konig's Theorem: Minimal Path Cover = Vextex Number - Max Match

	TLE at 7: 
	one optimization about the order of search: search the unmatched nodes in y first! I can get AC in 0.031s.
	NOTE: to assign inital match by greed may get wrong.
	MLE: 
	I must compress the data before improvement in memory of Ural.
}
{
	Algorithm: Bipartite-match
	Version: Normal
}
program Ural_1109(Input, Output);
const
	MaxN = 1000;
type
	TIndex = Longint;
	TChecked = array[1..MaxN] of Boolean;
	TLink = array[1..MaxN] of TIndex;
	TGraph = array[1..MaxN, 1..MaxN] of Boolean;
var
	N1, N2, E: TIndex;
	Graph: TGraph;
	Link: TLink;
	Checked: TChecked;

procedure Init;
var
	i, X, Y: TIndex;
begin
	FillChar(Graph, SizeOf(Graph), 0);
	FillChar(Checked, SizeOf(Checked), 0);
	FillChar(Link, SizeOf(Link), 0);
	Readln(N1, N2, E);
	for i := 1 to E do
	begin
		Readln(X, Y);
		Graph[X, Y] := true;
	end;
end;

function FindPath(v: TIndex): Boolean;
var
	i, w, p: TIndex;
begin
	FindPath := true;
	for p:=0 to 1 do
		for i := 1 to N2 do //0: search unmatched nodes at first, 1: search matched nodes then
			if Graph[v, i] and not Checked[i] and ((Link[i]+p=0) xor (Link[i]*p>0)) then
			begin
				w := Link[i];
				Link[i] := v;
				Checked[i] := true;
				if (w = 0) or FindPath(w) then
					Exit;
				Link[i] := w;
			end;
	FindPath := false;
end;

procedure Hungary;
var
	i: TIndex;
begin
	for i := 1 to N1 do
	begin
		FillChar(Checked, SizeOf(Checked), false);
		FindPath(i);
	end;
end;

procedure Print;
var
	i, S: TIndex;
begin
	S := 0;
	for i := 1 to N2 do
		if Link[i] <> 0 then
			Inc(S);
	Writeln(N1 + N2 - S);
	{Minimal Path Cover = Vextex Number - Max Match}
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Init;
	Hungary;
	Print;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.

