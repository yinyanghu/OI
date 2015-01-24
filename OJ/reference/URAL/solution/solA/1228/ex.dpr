program Ural_1228(Input, Output);
type
    TIndex = Byte;
    TData = Longint;
var
    N: TIndex;
    S, T: TData;
begin
    Readln(N, S);
    Dec(S);
    while N > 0 do
    begin
        Dec(N);
        Readln(T);
        Write(S div T, ' ');
        S := S mod T;
    end;
    Writeln;
end.

