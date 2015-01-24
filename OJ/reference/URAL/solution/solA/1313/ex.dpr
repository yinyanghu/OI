program Ural_1313(Input, Output);
const
    MaxN = 100;
type
    TIndex = Longint;
    TData = array[1..MaxN, 1..MaxN] of Shortint;
var
    D: TData;
    N: TIndex;
    i, j: TIndex;
begin
    Readln(N);
    for i := 1 to N do
        for j := 1 to N do
            Read(D[i, j]);
    for i := 1 to N do
        for j := 1 to i do
            Write(D[i - j + 1, j], ' ');
    for i := 2 to N do
        for j := i to N do
            Write(D[N + i - j, j], ' ');
    Writeln;
end.

