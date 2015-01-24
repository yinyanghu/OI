{$N+}
program Ural_1075(Input, Output);
type
    TData = Extended;

function ArcCos(X: TData): TData;
begin
    if X = 0 then
        ArcCos := Pi / 2
    else if X < 0 then
        ArcCos := ArcTan(Sqrt(1 - Sqr(X)) / X) + Pi
    else
        ArcCos := ArcTan(Sqrt(1 - Sqr(X)) / X);
end;

procedure Main;
var
    Ax, Ay, Az, Bx, By, Bz, Cx, Cy, Cz: TData;
    R, D1, D2, D, A0, A1, A2: TData;
begin
    Readln(Ax, Ay, Az);
    Readln(Bx, By, Bz);
    Readln(Cx, Cy, Cz);
    Readln(R);
    D1 := Sqrt(Sqr(Cx - Ax) + Sqr(Cy - Ay) + Sqr(Cz - Az));
    D2 := Sqrt(Sqr(Cx - Bx) + Sqr(Cy - By) + Sqr(Cz - Bz));
    D := Sqrt(Sqr(Bx - Ax) + Sqr(By - Ay) + Sqr(Bz - Az));
    A0 := ArcCos((Sqr(D1) + Sqr(D2) - Sqr(D)) / (2 * D1 * D2));
    A1 := ArcCos(R / D1);
    A2 := ArcCos(R / D2);
    if A0 - A1 - A2 <= 0 then
        Writeln(D: 0: 2)
    else
        Writeln((A0 - A1 - A2) * R + Sqrt(Sqr(D1) - Sqr(R)) + Sqrt(Sqr(D2) - Sqr(R)): 0: 2);
end;
begin
    { Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);    }
    Main;
    { Close(Input);
     Close(Output); }
end.

