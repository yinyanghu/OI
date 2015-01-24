program Ural_1139(Input, Output);
type
    TIndex = Longint;
    TData = Real;
var
    T: TData;
    i, N, M, Count, tmp, P, Q: TIndex;
begin
    Readln(N, M);
    if M < N then
    begin
        tmp := N;
        N := M;
        M := tmp;
    end;
    Count := 0;
    P := 0;
    for i := 1 to N - 1 do
    begin
        T := (M - 1) / (N - 1) * i;
        Q := Trunc(T);
        if Frac(T) > 0 then
            Inc(Q);
        Count := Count + Q - P;
        P := Trunc(T);
    end;
    Writeln(Count);
end.

