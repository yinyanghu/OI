program Ural_1020(Input, Output);
type
    TIndex = Byte;
    TData = Real;
    TPoint = record
        x, y: TData;
    end;
var
    i, N: TIndex;
    Line, R: TData;
    T, P, Q: TPoint;
begin
    Readln(N, R);
    Line := 2 * Pi * R;
    Readln(P.x, P.y);
    T.x := P.x;
    T.y := P.y;
    for i := 2 to N do
    begin
        Readln(Q.x, Q.y);
        Line := Line + Sqrt(Sqr(P.x - Q.x) + Sqr(P.y - Q.y));
        P.x := Q.x;
        P.y := Q.y;
    end;
    Line := Line + Sqrt(Sqr(P.x - T.x) + Sqr(P.y - T.y));
    Writeln(Line: 0: 2);
end.

