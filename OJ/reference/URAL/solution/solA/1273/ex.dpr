program Ural_1273(Input, Output);
const
    MaxN = 100;
type
    TIndex = Integer;
    TSegment = record
        X, Y: TIndex;
    end;
    TSegments = array[1..MaxN] of TSegment;
    TDp = array[1..MaxN] of TIndex;
var
    D: TSegments;
    F: TDp;
    N: TIndex;

procedure Main;
var
    i, j: TIndex;
    Max: TIndex;
    T: TSegment;
begin
    FillChar(D, SizeOf(D), 0);
    FillChar(F, SizeOf(F), 0);
    Readln(N);
    if N = 0 then
    begin
        Writeln(0);
        Exit;
    end;
    for i := 1 to N do
        Readln(D[i].X, D[i].Y);
    for i := 1 to N - 1 do
        for j := i + 1 to N do
            if D[i].X > D[j].X then
            begin
                T := D[i];
                D[i] := D[j];
                D[j] := T;
            end;
    F[1] := 1;
    for i := 2 to N do
    begin
        Max := 0;
        for j := 1 to N - 1 do
            if D[i].Y >= D[j].Y then
                if F[j] > Max then
                    Max := F[j];
        F[i] := Max + 1;
    end;
    Max := F[1];
    for i := 2 to N do
        if F[i] > Max then
            Max := F[i];
    Writeln(N - Max);
end;
begin
    Main;
end.

