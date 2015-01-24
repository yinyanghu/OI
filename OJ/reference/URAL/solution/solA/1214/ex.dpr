program Ural_1214(Input, Output);
type
    TData = Longint;
var
    x, y, tmp: TData;
begin
    Readln(x, y);
    if (x > 0) and (y > 0) and Odd(x + y) then
    begin
        tmp := x;
        x := y;
        y := tmp;
    end;
    Writeln(x, ' ', y);
end.

