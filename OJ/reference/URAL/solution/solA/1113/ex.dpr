program Ural_1113(Input, Output);
type
    TIndex = Longint;
    TLength = Real;
var
    M, L, S: TLength;
    N: TIndex;

function MyRound(X: TLength): TIndex;
//Round(0.49)=0 ,which is Wrong.
//So MyRound(0.49)=1
begin
    MyRound := Trunc(X) + Ord(X - 0.4 > 0);
end;
begin
    Readln(L, M);
    N := 0;
    S := 0;
    repeat
        Inc(N);
        S := S + 1 / (2 * N - 1);
    until S * M >= L;
    S := S - 1 / (2 * N - 1);
    Dec(N);
    Writeln(MyRound(M * N + (2 * N + 1) * (L - M * S)));
end.

