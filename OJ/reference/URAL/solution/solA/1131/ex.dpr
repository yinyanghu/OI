program Ural_1131(Input, Output);
type
    TIndex = Longint;
var
    P, T, N, K, S: TIndex;
begin
    Readln(N, K);
    P := 0;
    T := 1;
    S := 0;
    if K < N then
    begin
        while T < K do
        begin
            Inc(P);
            T := T * 2;
        end;
        S := (N - T) div K + Ord((N - T) mod K > 0);
    end
    else
        while T < N do
        begin
            Inc(P);
            T := T * 2;
        end;
    Writeln(S + P);
end.

