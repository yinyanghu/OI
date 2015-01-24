program Ural_1053(Input, Output);
type
    TIndex = Longint;
var
    i, P, Q, N: TIndex;

function GCD(A, B: TIndex): TIndex;
var
    tmp, R: TIndex;
begin
    if A > B then
    begin
        tmp := A;
        A := B;
        B := tmp;
    end;
    while A > 0 do
    begin
        R := B mod A;
        B := A;
        A := R;
    end;
    GCD := B;
end;
begin
    Readln(N);
    Read(P);
    for i := 2 to N do
    begin
        Read(Q);
        P := GCD(P, Q);
    end;
    Writeln(P);
end.

