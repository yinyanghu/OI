program Ural_1068(Input, Output);
type
    TIndex = Longint;
var
    i, N, Sum: TIndex;
begin
    Readln(N);
    Sum := 0;
    if N > 0 then
    begin
        for i := 1 to N do
            Inc(Sum, i);
    end
    else
    begin
        for i := 1 downto N do
            Inc(Sum, i);
    end;
    Writeln(Sum);
end.

