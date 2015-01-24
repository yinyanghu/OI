program Ural_1091(Input, Output);
const
    MaxN = 50;
    MaxMatch = 10000;
type
    TIndex = Longint;
    TSet = record
        N: TIndex;
        S: set of 1..MaxN;
    end;
    TGraphGCD = array[1..MaxN, 1..MaxN] of TIndex;
var
    K, S, Count: TIndex;
    Exceed: Boolean;
    G: TGraphGCD;
    ChoseSet: TSet;

function GCD(a, b: TIndex): TIndex;
var
    r: TIndex;
begin
    if b > a then
    begin
        r := a;
        a := b;
        b := r;
    end;
    while b > 0 do
    begin
        r := a mod b;
        a := b;
        b := r;
    end;
    GCD := a;
end;

procedure Init;
var
    i, j: TIndex;
begin
    FillChar(G, SizeOf(G), 0);
    for i := 1 to MaxN - 1 do
        for j := i to MaxN do
        begin
            G[i, j] := GCD(i, j);
            G[j, i] := G[i, j];
        end;
end;

procedure Search(Last, Depth: TIndex);
var
    i, T: TIndex;
begin
    if Exceed then Exit;
    if Depth = K + 1 then
    begin
        Inc(Count);
        if Count >= MaxMatch then
            Exceed := true;
        Exit;
    end;
    for i := Last + 1 to S - K + Depth do
    begin
        if ChoseSet.N = 0 then
        begin
            ChoseSet.S := ChoseSet.S + [i];
            ChoseSet.N := i;
            Search(i, Depth + 1);
            ChoseSet.N := 0;
            ChoseSet.S := ChoseSet.S - [i];
        end
        else if G[i, ChoseSet.N] > 1 then
        begin
            ChoseSet.S := ChoseSet.S + [i];
            T := ChoseSet.N;
            ChoseSet.N := G[i, ChoseSet.N];
            Search(i, Depth + 1);
            ChoseSet.N := T;
            ChoseSet.S := ChoseSet.S - [i];
        end;
        if Exceed then Exit;
    end;
end;

procedure Main;
begin
    Init;
    Readln(K, S);
    if K >= S then
    begin
        Writeln(0);
        Exit;
    end;
    Count := 0;
    Exceed := false;
    ChoseSet.S := [];
    ChoseSet.N := 0;
    Search(1, 1);
    Writeln(Count);
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);      }
    Main;
    { Close(Input);
     Close(Output);  }
end.

