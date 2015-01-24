{$N+}
program Ural_1207(Input, Output);
const
    MaxN = 10000;
    MaxValue = 1E10;
type
    TIndex = Longint;
    TData = Extended;
    TPoint = record
        X, Y: TData;
    end;
    TListItem = record
        P: TPoint;
        ID: TIndex;
    end;
    TList = array[1..MaxN] of TListItem;
var
    Q: TList;
    N: TIndex;

procedure Swap(var A, B: TListItem);
var
    T: TListItem;
begin
    T := A;
    A := B;
    B := T;
end;

function Slope(P: TPoint): TData;
begin
    if Abs(P.X - Q[1].P.X) < 1E-10 then
        Slope := MaxValue
    else
        Slope := (P.Y - Q[1].P.Y) / (P.X - Q[1].P.X);
end;

procedure QuickSort(l, r: TIndex);
var
    i, j: TIndex;
    X: TListItem;
begin
    i := l;
    j := r;
    X := Q[Random(r - l + 1) + l];
    repeat
        while Slope(Q[i].P) < Slope(X.P) do
            Inc(i);
        while Slope(X.P) < Slope(Q[j].P) do
            Dec(j);
        if i <= j then
        begin
            Swap(Q[i], Q[j]);
            Inc(i);
            Dec(j);
        end;
    until i > j;
    if l < j then QuickSort(l, j);
    if i < r then QuickSort(i, r);
end;

procedure Main;
var
    i, k: TIndex;
begin
    FillChar(Q, SizeOf(Q), 0);
    Randomize;
    Readln(N);
    for i := 1 to N do
    begin
        Readln(Q[i].P.X, Q[i].P.Y);
        Q[i].ID := i;
    end;
    k := 1;
    for i := 2 to N do
        if (Q[k].P.X > Q[i].P.X) or ((Q[k].P.X = Q[i].P.X) and (Q[k].P.Y > Q[i].P.Y)) then
            k := i;
    Swap(Q[1], Q[k]);
    QuickSort(2, N);
    Writeln(Q[1].ID, ' ', Q[(2 + N) div 2].ID);
end;
begin
    Main;
end.

