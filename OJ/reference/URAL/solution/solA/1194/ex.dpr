{
Note:
Everyone shakes hands of each other.
But each of the couples can't shakes hands of other.
}
program Ural_1194(Input, Output);
type
    TData = Longint;
var
    N, K: TData;
begin
    Readln(N, K);
    Writeln(N * (N - 1) div 2 - K);
end.

