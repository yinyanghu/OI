program Ural_1317(Input, Output);
const
    MaxN = 10;
type
    TIndex = Longint;
    TData = Real;
    TPoint = record
        X, Y: TData;
    end;
    TPolygon = array[1..MaxN + 1] of TPoint;
var
    P: TPolygon;
    N: TIndex;
    M, K: TIndex;
    O, Q: TPoint;
    R, H: TData;

function GetDistance(A, B: TPoint): TData;
begin
    GetDistance := Sqrt(Sqr(A.X - B.X) + Sqr(A.Y - B.Y));
end;

function Intersect(P1, P2, Q1, Q2: TPoint; var F: TPoint): Boolean;
var
    A1, B1, C1, A2, B2, C2: TData;
begin
    A1 := P2.Y - P1.Y;
    B1 := P1.X - P2.X;
    C1 := P2.X * P1.Y - P1.X * P2.Y;
    A2 := Q2.Y - Q1.Y;
    B2 := Q1.X - Q2.X;
    C2 := Q2.X * Q1.Y - Q1.X * Q2.Y;
    Intersect := false;
    if A1 * B2 - A2 * B1 <> 0 then
    begin
        F.X := (B1 * C2 - B2 * C1) / (A1 * B2 - A2 * B1);
        F.Y := (A2 * C1 - A1 * C2) / (A1 * B2 - A2 * B1);
        Intersect := ((F.X - P1.X) * (P2.X - F.X) >= 0)
            and ((F.Y - P1.Y) * (P2.Y - F.Y) >= 0)
            and ((F.X - Q1.X) * (Q2.X - F.X) >= 0)
            and ((F.Y - Q1.Y) * (Q2.Y - F.Y) >= 0);
    end;
    //superposition mean inside
end;

function Outside(Q: TPoint; var F: TPoint): Boolean;
var
    i: TIndex;
begin
    Outside := true;
    for i := 1 to N do
        if Intersect(O, Q, P[i], P[i + 1], F) then Exit;
    Outside := false;
end;

procedure Main;
var
    i: TIndex;
    F: TPoint;
    Sp, Hp: TData;
begin
    Readln(N, H);
    for i := 1 to N do
        Readln(P[i].X, P[i].Y);
    P[N + 1] := P[1];
    Readln(R, O.X, O.Y);
    Readln(M);
    K := 0;
    for i := 1 to M do
    begin
        Readln(Q.X, Q.Y);
        if Outside(Q, F) then
        begin
            Sp := GetDistance(O, Q);
            Hp := H * Sp / GetDistance(O, F);
            if Sqr(R) >= Sqr(Hp) + Sqr(Sp) then Inc(K);
        end
        else if Sqr(R) - Sqr(Q.X - O.X) - Sqr(Q.Y - O.Y) >= 0 then
            Inc(K);
    end;
    Writeln(K);
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
   {Close(Input);
    Close(Output);  }
end.

