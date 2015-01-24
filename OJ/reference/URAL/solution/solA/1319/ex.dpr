program Ural_1319(Input, Output);
type
    TIndex = Longint;
var
    N, M: TIndex;
    i, j: TIndex;
begin
    Readln(N);
    for i := 1 to N do
    begin
        for j := 1 to N do
            if i - j < 0 then
            begin
                M := N + i - j;
                Write(M * (M - 1) div 2 + i, ' ');
            end
            else
            begin
                M := N - (i - j) + 1;
                Write(N * (N - 1) div 2 + (N + M) * (N - M + 1) div 2 + j, ' ');
            end;
        Writeln;
    end;
end.

