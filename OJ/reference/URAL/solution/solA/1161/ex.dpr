program Ural_1161(Input, Output);
const
    MaxN = 100;
type
    TIndex = Byte;
    TData = Real;
    TData_Arr = array[1..MaxN] of TData;
var
    i, j, N: TIndex;
    R, tmp: TData;
    D: TData_Arr;
begin
    Readln(N);
    for i := 1 to N do
        Readln(D[i]);
    for i := 1 to N - 1 do
        for j := i + 1 to N do
            if D[i] < D[j] then
            begin
                tmp := D[i];
                D[i] := D[j];
                D[j] := tmp;
            end;
    R := D[1];
    for i := 1 to N - 1 do
        R := 2 * Sqrt(R * D[i + 1]);
    Writeln(R: 0: 2);
end.

