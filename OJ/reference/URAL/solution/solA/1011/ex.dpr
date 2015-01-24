{$N+}
program Ural_1011(Input, Output);
type
    TIndex = Longint;
    TData = Extended;
var
    P, Q: TData;
    N: TIndex;
begin
    Read(P, Q);
    N := 1;
    while not ((Trunc(Q * N / 100) - Trunc(P * N / 100) > 0)
        and (Frac(Q * N / 100) > 0) and (Frac(P * N / 100) > 0)) do
        Inc(N);
    Writeln(N);
end.

