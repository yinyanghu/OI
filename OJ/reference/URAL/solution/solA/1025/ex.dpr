program Ural_1025(Input, Output);
const
    MaxGroup = 101;
type
    TIndex = Byte;
    TData = Longint;
    TData_Arr = array[1..MaxGroup] of TData;
var
    i, j, N: TIndex;
    D: TData_Arr;
    tmp, Sum: TData;
begin
    Readln(N);
    for i := 1 to N do
        Read(D[i]);
    {Sort}
    for i := 1 to N - 1 do
        for j := i + 1 to N do
            if D[i] > D[j] then
            begin
                tmp := D[i];
                D[i] := D[j];
                D[j] := tmp;
            end;
    Sum := 0;
    for i := 1 to N div 2 + 1 do
        Inc(Sum, D[i] div 2 + 1);
    Writeln(Sum);
end.

