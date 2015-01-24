program Ural_1021(Input, Output);
const
    MinRange = -32768;
    MaxRange = 32767;
type
    TIndex = Longint;
    TFlag = array[MinRange..MaxRange] of Boolean;
var
    i, N, T: TIndex;
    Flag: TFlag;
    found: Boolean;
begin
    Readln(N);
    FillChar(Flag, SizeOf(Flag), false);
    for i := 1 to N do
    begin
        Readln(T);
        Flag[T] := true;
    end;
    Readln(N);
    found := false;
    for i := 1 to N do
    begin
        Readln(T);
        if (MinRange <= 10000 - T) and (10000 - T <= MaxRange) then
            if Flag[10000 - T] then
            begin
                found := true;
                Break;
            end;
    end;
    if found then
        Writeln('YES')
    else
        Writeln('NO');
end.

