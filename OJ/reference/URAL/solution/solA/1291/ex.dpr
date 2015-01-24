program Ural_1291(Input, Output);
const
    MaxN = 1000;
type
    TIndex = Longint;
    TFraction = record
        Nume: TIndex; //numerator
        Deno: TIndex; //denominator
    end;
    TNode = array[1..MaxN] of record
        Speed: TFraction;
        Cog: TIndex;
        Checked: Boolean;
    end;
    TGraph = array[1..MaxN, 1..MaxN] of Boolean;
var
    D: TNode;
    G: TGraph;
    N: TIndex;

function GCD(A, B: TIndex): TIndex;
var
    R, T: TIndex;
begin
    if B > A then
    begin
        T := A;
        A := B;
        B := T;
    end;
    while B > 0 do
    begin
        R := A mod B;
        A := B;
        B := R;
    end;
    GCD := A;
end;

procedure DFS(Node: TIndex);
var
    T: TIndex;
    i: TIndex;
begin
    D[Node].Checked := true;
    for i := 1 to N do
        if not D[i].Checked and G[Node, i] then
        begin
            D[i].Speed.Nume := -D[Node].Speed.Nume * D[Node].Cog;
            D[i].Speed.Deno := D[Node].Speed.Deno * D[i].Cog;
            T := GCD(Abs(D[i].Speed.Nume), D[i].Speed.Deno);
            D[i].Speed.Nume := D[i].Speed.Nume div T;
            D[i].Speed.Deno := D[i].Speed.Deno div T;
            DFS(i);
        end;
end;

procedure Main;
var
    i, j, X: TIndex;
    T: TIndex;
begin
    FillChar(G, SizeOf(G), 0);
    FillChar(D, SizeOf(D), 0);
    Readln(N);
    for i := 1 to N do
    begin
        D[i].Speed.Nume := 0;
        D[i].Speed.Deno := 1;
        Read(D[i].Cog);
        repeat
            Read(j);
            if j = 0 then
                Break;
            G[i, j] := true;
            G[j, i] := true;
        until false;
        Readln;
    end;
    Read(X, T);
    D[X].Speed.Nume := T;
    D[X].Speed.Deno := 1;
    DFS(X);
    for i := 1 to N do
        with D[i].Speed do
            Writeln(Nume, '/', Deno);
end;
begin
    Main;
end.

