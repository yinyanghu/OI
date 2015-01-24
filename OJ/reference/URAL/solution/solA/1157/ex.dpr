program Ural_1157(Input, Output);
type
    TData = Longint;

function GetRectangleNumber(X: TData): TData;
var
    i, P: TData;
begin
    P := 0;
    for i := 1 to Trunc(Sqrt(X)) do
        if X mod i = 0 then
            Inc(P);
    GetRectangleNumber := P;
end;

procedure Main;
var
    M, N, K, L: TData;
begin
    Readln(M, N, K);
    L := K;
    repeat
        Inc(L);
    until (L > 10000) or
        ((GetRectangleNumber(L) = N) and (GetRectangleNumber(L - K) = M));
    if L > 10000 then
        Writeln(0)
    else
        Writeln(L);
end;
begin
    Main;
end.

