program Ural_1258(Input, Output);
type
    TCoordinates = Real;
    TPoint = record
        X, Y: TCoordinates;
    end;

procedure Main;
var
    W, D: TCoordinates;
    Ch: Char;
    S, E: TPoint;
begin
    Readln(W, D);
    Readln(S.X, S.Y);
    Readln(E.X, E.Y);
    while not Eof do
    begin
        Read(Ch);
        case Ch of
            'F': S.Y := -S.Y;
            'B': S.Y := 2 * D - S.Y;
            'L': S.X := -S.X;
            'R': S.X := 2 * W - S.X;
        end;
    end;
    Writeln(Sqrt(Sqr(S.X - E.X) + Sqr(S.Y - E.Y)): 0: 4);
end;
begin
    Main;
end.

