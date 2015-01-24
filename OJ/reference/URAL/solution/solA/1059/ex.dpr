program Ural_1059(Input, Output);
type
    TIndex = Integer;
var
    i, N: TIndex;
begin
    Readln(N);
    Writeln(0);
    for i := 1 to N do
    begin
        Writeln('X');
        Writeln('*');
        Writeln(i);
        Writeln('+');
    end;
end.
