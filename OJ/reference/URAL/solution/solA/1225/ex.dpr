program Ural_1225(Input, Output);
const
    MaxN = 45;
type
    TIndex = Byte;
    TData = Real;
    TData_Arr = array[1..MaxN] of TData;
var
    i, N: TIndex;
    F: TData_Arr;
begin
    Readln(N);
    FillChar(F, SizeOf(F), 0);
    F[1] := 2;
    F[2] := 2;
    for i := 3 to N do
        F[i] := F[i - 1] + F[i - 2];
    Writeln(F[N]: 0: 0);
end.

