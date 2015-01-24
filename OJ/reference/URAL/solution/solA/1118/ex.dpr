program Ural_1118(Input, Output);
type
    TIndex = Longint;
    TData = Real;
var
    L, R: TIndex;

procedure Main;
var
    i, j: TIndex;
    MinIndex, S: TIndex;
    Min: TData;
    IsPrime: Boolean;
begin
    Readln(L, R);
    if L <= 1 then
    begin
        Writeln(1);
        Exit;
    end;
    Min := MaxLongint;
    MinIndex := 0;
    for i := R downto L do
    begin
        S := 1;
        IsPrime := true;
        for j := 2 to Trunc(Sqrt(i)) do
            if i mod j = 0 then
            begin
                IsPrime := false;
                Inc(S, j + i div j);
                if j = i div j then
                    Dec(S, j);
            end;
        if IsPrime then
        begin
            Writeln(i);
            Exit;
        end;
        if Min > S / i then
        begin
            Min := S / i;
            MinIndex := i;
        end;
    end;
    Writeln(MinIndex);
end;
begin
    Main;
end.

