{$N+}
program Ural_1192(Input, Output);
const
    MyPi = 3.1415926535;
    MyG = 10.0;
type
    TData = Extended;
var
    V, A, K: TData;
begin
    Readln(V, A, K);
    A := A / 180 * MyPi;
    Writeln(2 * Sin(A) * Cos(A) / MyG * V * V * K / (K - 1): 0: 2);
end.

