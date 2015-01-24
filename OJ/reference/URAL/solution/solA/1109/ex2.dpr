{
	Algorithm: Bipartite-match
	Version: Data Compression
}
program Ural_1109(Input, Output);
const
	MaxN = 1000;
	BitGroup=125;
	BitWidth=8;
type
	TIndex = Longint;
	TChecked = array[1..MaxN] of Boolean;
	TLink = array[1..MaxN] of TIndex;
	TGraph = array[1..MaxN, 1..BitGroup] of Byte;
var
	N1, N2, E: TIndex;
	Graph: TGraph;
	Link: TLink;
	Checked: TChecked;

function GetGraph(x,y:TIndex):Boolean;
var
	p,q:TIndex;
begin
	p:=(y-1) div BitWidth+1;
	q:=BitWidth-((y-1) mod BitWidth+1);
	Result:=(Graph[x,p] mod (1 shl (q+1)) div (1 shl q)=1);
end;

procedure SetGraphTrue(x,y:TIndex);
var
	p,q:TIndex;
begin
	if GetGraph(x,y) then Exit;
	p:=(y-1) div BitWidth+1;
	q:=BitWidth-((y-1) mod BitWidth+1);
	Inc(Graph[x,p],1 shl q);
end;

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
		SetGraphTrue(X, Y);
	end;
end;

function FindPath(v: TIndex): Boolean;
var
	i, w, p: TIndex;
begin
	FindPath := true;
	for p:=0 to 1 do //0: search unmatched nodes at first, 1: search matched nodes then
		for i := 1 to N2 do
			if GetGraph(v, i) and not Checked[i] 
				and ((Link[i]+p=0) xor (Link[i]*p>0)) then
			begin
				w := Link[i];
				Link[i] := v;
				Checked[i] := true;
				if (w = 0) or FindPath(w) then Exit;
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

