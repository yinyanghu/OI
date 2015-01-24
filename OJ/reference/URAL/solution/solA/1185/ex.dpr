(*
____E_______F____ l
____A       B_____
|   |_______|    |
|   C       D    |
|________________|

1/4 Circle A + 1/4 Circle B + (AC - R) + (BD - R) + CD - 2R > EF
Defining convexity better than concavity
So convexity hull!!!
*)
program Ural_1185(Input, Output);
const
    MaxN = 1000;
type
    TIndex = Longint;
    TData = Real;
    TPoint = record
        X, Y: TData;
    end;
    TPoints = array[1..MaxN + 1] of TPoint;
var
    P: TPoints;
    N: TIndex;
    L: TData;

function Distance(A, B: TPoint): TData;
begin
    Distance := Sqrt(Sqr(A.X - B.X) + Sqr(A.Y - B.Y));
end;

function GetCos(A, B, C, D: TPoint): TData;
begin
    GetCos := ((A.X - B.X) * (C.X - D.X) + (A.Y - B.Y) * (C.Y - D.Y)) / Distance(A, B) / Distance(C, D);
end;

procedure Swap(var A, B: TPoint);
var
    tmp: TPoint;
begin
    tmp := A;
    A := B;
    B := tmp;
end;

procedure Main;
var
    i, M: TIndex;
    MinInd: TIndex;
    S: TData;
begin
    Readln(N, L);
    for i := 1 to N do
        Readln(P[i].X, P[i].Y);
    MinInd := 1;
    for i := 2 to N do
        if (P[i].Y < P[MinInd].Y) or ((P[i].Y = P[MinInd].Y) and (P[i].X > P[MinInd].X)) then
            MinInd := i;
    Swap(P[MinInd], P[1]);
    P[N + 1] := P[1];
    MinInd := 2;
    for i := 3 to N do
        if ((P[i].X - P[1].X) / Distance(P[1], P[i])
            > (P[MinInd].X - P[1].X) / Distance(P[1], P[MinInd]))
            or (
            ((P[i].X - P[1].X) / Distance(P[1], P[i])
            = (P[MinInd].X - P[1].X) / Distance(P[1], P[MinInd]))
            and (Distance(P[1], P[i]) > Distance(P[1], P[MinInd]))) then
            MinInd := i;
    Swap(P[MinInd], P[2]);
    M := 2;
    repeat
        MinInd := M + 1;
        for i := M + 2 to N + 1 do
            if (GetCos(P[M], P[i], P[M - 1], P[M]) > GetCos(P[M], P[MinInd], P[M - 1], P[M]))
                or (
                (GetCos(P[M], P[i], P[M - 1], P[M]) = GetCos(P[M], P[MinInd], P[M - 1], P[M]))
                and (Distance(P[M], P[i]) > Distance(P[M], P[MinInd]))) then
                MinInd := i;
        Inc(M);
        Swap(P[M], P[MinInd]);
    until MinInd = N + 1;
    S := 0;
    for i := 2 to M do
        S := S + Distance(P[i - 1], P[i]);
    S := S + 2 * L * Pi;
    Writeln(Trunc(S) + Ord(Frac(S) >= 8 / 12));
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Main;
   { Close(Input);    
    Close(Output);     }
end.

