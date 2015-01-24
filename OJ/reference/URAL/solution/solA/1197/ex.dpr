program Ural_1197(Input, Output);
const
    TotWay = 8;
    XWay: array[1..TotWay] of Integer = (1, 2, 2, 1, -1, -2, -2, -1);
    YWay: array[1..TotWay] of Integer = (-2, -1, 1, 2, 2, 1, -1, -2);
type
    TIndex = Byte;
var
    i, N, X, Y, Count: TIndex;
    St: string;
begin
    Readln(N);
    while N > 0 do
    begin
        Dec(N);
        Readln(St);
        X := Ord(St[1]) - Ord('a') + 1;
        Y := Ord(St[2]) - Ord('0');
        Count := 0;
        for i := 1 to TotWay do
            if (XWay[i] + X <= 8) and (XWay[i] + X > 0)
                and (YWay[i] + Y <= 8) and (YWay[i] + Y > 0) then
                Inc(Count);
        Writeln(Count);
    end;
end.

