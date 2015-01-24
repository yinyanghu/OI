{$N+}
program Ural_1215(Input, Output);
const
    MaxValue = MaxLongint;
    MaxN = 100;
type
    TIndex = Longint;
    TData = Extended;
    TPoint = record
        X, Y: TData;
    end;
    TPoints = array[1..MaxN + 1] of TPoint;
var
    P, Q: TPoint;
    N: TIndex;
    D: TPoints;
    MaxX: TData;

function Through(A, B, T: TPoint): Boolean;
begin
    Through := ((T.X - A.X) * (A.Y - B.Y) - (A.X - B.X) * (T.Y - A.Y) = 0);
end;

function Intersection(A, B: TPoint): Boolean;
var
    T: TPoint;
    A1, B1, C1, A2, B2, C2: TData;
begin
    Intersection := false;
    A1 := P.Y - Q.Y;
    B1 := Q.X - P.X;
    C1 := P.Y * (P.X - Q.X) - P.X * (P.Y - Q.Y);
    A2 := A.Y - B.Y;
    B2 := B.X - A.X;
    C2 := A.Y * (A.X - B.X) - A.X * (A.Y - B.Y);
    if B1 * A2 - B2 * A1 = 0 then
        Exit;
    T.X := (B2 * C1 - B1 * C2) / (B1 * A2 - B2 * A1);
    T.Y := (A2 * C1 - A1 * C2) / (A1 * B2 - A2 * B1);
    if ((T.X - A.X) * (T.X - B.X) <= 0) and ((T.Y - A.Y) * (T.Y - B.Y) <= 0)
        and ((T.X - P.X) * (T.X - Q.X) <= 0) and ((T.Y - P.Y) * (T.Y - Q.Y) <= 0) then
        Intersection := true;
end;

function PointInPolygons: Boolean; {ON or IN are true;OUT are false;}
var
    i, Count: TIndex;
    OnLine, Found: Boolean;
begin
    OnLine := false;
    for i := 1 to N do
        if Through(D[i], D[i + 1], P) and ((P.X - D[i].X) * (P.X - D[i + 1].X) <= 0)
            and ((P.Y - D[i].Y) * (P.Y - D[i + 1].Y) <= 0) then
        begin
            OnLine := true;
            Break;
        end;
    if Online then
        PointInPolygons := true
    else
    begin
        Q.X := MaxX;
        Randomize;
        repeat
            Found := true;
            Q.Y := Random(2000000) - 1000000;
            for i := 1 to N do
                if Through(D[i], D[i + 1], P) and Through(D[i], D[i + 1], Q) then
                begin
                    Found := false;
                    Break;
                end;
        until Found;
        Count := 0;
        for i := 1 to N do
            Inc(Count, Ord(Intersection(D[i], D[i + 1])));
        if Odd(Count) then
            PointInPolygons := true
        else
            PointInPolygons := false;
    end;
end;

function Distance(A, B: TPoint): TData;
begin
    Distance := Sqrt(Sqr(A.X - B.X) + Sqr(A.Y - B.Y));
end;

procedure Main;
var
    i: TIndex;
    Min: TData;
    D0, D1, D2, X0, X1, X2: TData;
begin
    Readln(P.X, P.Y, N);
    MaxX := -MaxValue;
    for i := 1 to N do
    begin
        Readln(D[i].X, D[i].Y);
        if D[i].X > MaxX then
            MaxX := D[i].X;
    end;
    MaxX := MaxX * 2;
    D[N + 1] := D[1];
    if not PointInPolygons then
    begin
        Min := MaxValue;
        for i := 1 to N do
            if Min > Distance(P, D[i]) then
                Min := Distance(P, D[i]);
        for i := 1 to N do
        begin
            D0 := Distance(D[i], D[i + 1]);
            D1 := Distance(D[i], P);
            D2 := Distance(D[i + 1], P);
            X1 := (D0 + (Sqr(D1) - Sqr(D2)) / D0) / 2;
            X2 := (D0 - (Sqr(D1) - Sqr(D2)) / D0) / 2;
            if (X1 < 0) or (X2 < 0) then Continue;
            X0 := Sqrt(Sqr(D1) - Sqr(X1));
            if Min > X0 then
                Min := X0;
        end;
    end
    else
        Min := 0;
    Writeln(Min * 2: 0: 3);
end;
begin
  {  assign(input, 'i.txt');
    reset(input);
    assign(output, 'o.txt');
    rewrite(output); }
    Main;
   { close(input);
    close(output); }
end.

