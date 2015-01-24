program Ural_1149(Input, Output);
type
    TIndex = Byte;
var
    N: TIndex;

procedure A(X: TIndex);
var
    i: TIndex;
begin
    for i := 1 to X do
    begin
        Write('sin(', i);
        if i <> X then
            if Odd(i) then
                Write('-')
            else
                Write('+');
    end;
    for i := 1 to X do
        Write(')');
end;

procedure S(X: TIndex);
var
    i: TIndex;
begin
    for i := 1 to X - 1 do
        Write('(');
    for i := 1 to X do
    begin
        if i <> 1 then
            Write(')');
        A(i);
        Write('+', X - i + 1);
    end;
end;
begin
    Readln(N);
    S(N);
    Writeln;
end.

