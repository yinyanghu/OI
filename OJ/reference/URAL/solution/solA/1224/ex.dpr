{$N+}
program Ural_1224(Input, output);
type
    TData = Extended;
var
    N, M: TData;
begin
    Readln(N, M);
    if N <= M then
        Writeln((N - 1) * 2: 0: 0)
    else
        Writeln((M - 1) * 2 + 1: 0: 0);
end.

