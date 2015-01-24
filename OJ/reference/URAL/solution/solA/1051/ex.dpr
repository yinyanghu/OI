program Ural_1051(Input, Output);
type
    TIndex = Integer;
var
    N, M, tmp: TIndex;
begin
    Readln(N, M);
    if M > N then
    begin
        tmp := N;
        N := M;
        M := tmp;
    end;
    if M = 1 then
        Writeln((N + 1) div 2)
    else if (M mod 3 = 0) or (N mod 3 = 0) then
        Writeln(2)
    else
        Writeln(1);
end.

