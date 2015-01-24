program Ural_1081(Input, Output);
const
    MaxN = 44;
type
    TIndex = Longint;
    TFibonacci = array[1..MaxN + 2] of Longint;
    TFibonacciExpress = array[1..MaxN + 2] of Boolean;
var
    N, K, i: TIndex;
    F: TFibonacci;
    S: TFibonacciExpress;
begin
    FillChar(F, SizeOf(F), 0);
    FillChar(S, SizeOf(S), 0);
    Readln(N, K);
    F[1] := 1;
    F[2] := 2;
    for i := 3 to N + 1 do
        F[i] := F[i - 1] + F[i - 2];
    if K > F[N + 1] then
    begin
        Writeln(-1);
        Exit;
    end;
    Dec(K);
    i := N;
    while (K > 0) and (i > 0) do
    begin
        if F[i] <= K then
        begin
            S[i] := true;
            Dec(K, F[i]);
        end;
        Dec(i);
    end;
    for i := N downto 1 do
        Write(Ord(S[i]));
    Writeln;
end.

