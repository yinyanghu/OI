program Ural_1263(Input, Output);
const
    MaxN = 10000;
type
    TIndex = Longint;
    TVotings = array[1..MaxN] of TIndex;
var
    F: TVotings;
    i, K, N, M: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N, M);
    for i := 1 to M do
    begin
        Readln(K);
        Inc(F[K]);
    end;
    for i := 1 to N do
        Writeln(F[i] / M * 100: 0: 2, '%');
end.

