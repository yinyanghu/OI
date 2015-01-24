program Ural_1079(Input, Output);
const
    MaxN = 100000;
type
    TIndex = Longint;
    TData = Longint;
    TData_Arr = array[0..MaxN] of TData;
var
    i, N: TIndex;
    F: TData_Arr;
    Max: TData;
begin
    while true do
    begin
        Read(N);
        if N = 0 then
            Break;
        F[0] := 0;
        F[1] := 1;
        Max := 1;       // note!  F[1] is  Maximum Now
        for i := 2 to N do
        begin
            if Odd(i) then
                F[i] := F[(i - 1) div 2] + F[(i - 1) div 2 + 1]
            else
                F[i] := F[i div 2];
            if F[i] > Max then
                Max := F[i];
        end;
        Writeln(Max);
    end;
end.

