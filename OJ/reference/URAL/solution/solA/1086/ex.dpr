program Ural_1086(Input, Output);
const
    MaxN = 15000;
    MaxValue = 163841;
type
    TIndex = Longint;
    TFilterPrime = array[1..MaxValue] of Boolean;
    TPrime = array[1..MaxN] of Longint;
var
    Filter: TFilterPrime;
    Prime: TPrime;
    CountPrime: TIndex;
    i, j, T, N: TIndex;
begin
    FillChar(Filter, SizeOf(Filter), true);
    FillChar(Prime, SizeOf(Prime), 0);
    CountPrime := 0;
    for i := 2 to MaxValue do
        if Filter[i] then
        begin
            Inc(CountPrime);
            Prime[CountPrime] := i;
            for j := 2 to MaxValue div i do
                Filter[i * j] := false;
        end;
    Readln(N);
    for i := 1 to N do
    begin
        Readln(T);
        Writeln(Prime[T]);
    end;
end.

