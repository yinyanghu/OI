program Ural_1023(Input, Output);
type
    TIndex = Longint;
var
    K, L, i: TIndex;
begin
    Readln(K);
    L := 0;
    for i := 3 to K div 2 do
        if K mod i = 0 then
        begin
            L := i - 1;
            Break;
        end;
    if L = 0 then
        L := K - 1;
    Writeln(L);
end.

