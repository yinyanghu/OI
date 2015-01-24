program Ural_1110(Input, Output);
type
    TIndex = Integer;
var
    X, Y, N, M: TIndex;
    found: Boolean;

function IsValid: Boolean;
var
    T, i, j: TIndex;
begin
    T := 1;
    for i := 1 to N do
    begin
        T := T * X mod M;
        if T = 0 then
            Break;
    end;
    IsValid := (T = Y);
end;
begin
    Readln(N, M, Y);
    found := false;
    for X := 0 to M - 1 do
        if IsValid then
        begin
            found := true;
            Write(X, ' ');
        end;
    if not found then
        Write(-1);
    Writeln;
end.

