{$N+}
program Ural_1209(Input, Output);
type
    TIndex = Longint;
    TData = Extended;
var
    N: TIndex;
    K: TData;
begin
    Readln(N);
    while N > 0 do
    begin
        Dec(N);
        Readln(K);
        if Trunc(Sqrt(2 * (K - 1))) * (Trunc(Sqrt(2 * (K - 1))) + 1)
            = 2 * (K - 1) then
            Write('1 ')
        else
            Write('0 ');
    end;
    Writeln;
end.

