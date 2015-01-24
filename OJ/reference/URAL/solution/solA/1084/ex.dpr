program Ural_1084(Input, Output);
type
    TData = Real;
var
    Alpha, A, R, L: TData;
begin
    Readln(A, R);
    A := A / 2;
    if Sqrt(2) * A <= R then
        Writeln(4 * A * A: 0: 3)
    else if R <= A then
        Writeln(R * R * Pi: 0: 3)
    else
    begin
        L := Sqrt(R * R - A * A);
        Alpha := Pi / 2 - 2 * ArcTan(L / A);
        Writeln((L * A + R * R * Pi * Alpha / (Pi * 2)) * 4: 0: 3);
    end;
end.

