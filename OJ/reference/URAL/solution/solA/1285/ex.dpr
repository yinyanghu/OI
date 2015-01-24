{$N+}
program Ural_1285(Input, Output);
const
    MaxD = 8;
type
    TData = Extended;
    TPoint = array[1..MaxD] of TData;

function ArcCos(X: TData): TData;
begin
    if X = 0 then
        ArcCos := Pi / 2
    else if X < 0 then
        ArcCos := ArcTan(Sqrt(1 - Sqr(X)) / X) + Pi
    else
        ArcCos := ArcTan(Sqrt(1 - Sqr(X)) / X);
end;

function GetDistance(A, B: TPoint): TData;
begin
    GetDistance := Sqrt(Sqr(B[1] - A[1]) + Sqr(B[2] - A[2]) + Sqr(B[3] - A[3]) +
        Sqr(B[4] - A[4]) + Sqr(B[5] - A[5]) + Sqr(B[6] - A[6]) + Sqr(B[7] - A[7]) + Sqr(B[8] - A[8]));
end;

procedure Main;
var
    A, B, C: TPoint;
    R, D1, D2, D, A0, A1, A2: TData;
begin
    Readln(A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8]);
    Readln(B[1], B[2], B[3], B[4], B[5], B[6], B[7], B[8]);
    Readln(C[1], C[2], C[3], C[4], C[5], C[6], C[7], C[8]);
    Readln(R);
    D1 := GetDistance(C, A);
    D2 := GetDistance(C, B);
    D := GetDistance(B, A);
    A0 := ArcCos((Sqr(D1) + Sqr(D2) - Sqr(D)) / (2 * D1 * D2));
    A1 := ArcCos(R / D1);
    A2 := ArcCos(R / D2);
    if A0 - A1 - A2 <= 0 then
        Writeln(D: 0: 2)
    else
        Writeln((A0 - A1 - A2) * R + Sqrt(Sqr(D1) - Sqr(R)) + Sqrt(Sqr(D2) - Sqr(R)): 0: 2);
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Main;
 {   Close(Input);
    Close(Output);   }
end.

