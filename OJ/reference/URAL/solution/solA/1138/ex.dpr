program Ural_1138(Input, Output);
const
    MaxN = 10000;
type
    TIndex = Longint;
    TDP = array[1..MaxN] of Longint;
var
    S, T: TIndex;
    F: TDP;

procedure DP;
var
    i, j, Index, Max: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(T, S);
    F[S] := 1;
    for i := S + 1 to T do
    begin
        Max := 0;
        for j := 1 to 100 do
            if (i * 100) mod (100 + j) = 0 then
            begin
                Index := (i * 100) div (100 + j);
                if (Index >= S) and (Index <= i - 1) then
                    if F[Index] <> 0 then //can not impossible to impossible!
                        if F[Index] + 1 > Max then
                            Max := F[Index] + 1;
            end;
        F[i] := Max;
    end;
    Max := 0;
    for i := S to T do
        if F[i] > Max then
            Max := F[i];
    Writeln(Max);
end;
begin
    DP;
end.

