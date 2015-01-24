(*
f(i, j) = min { f(i, k) +   s(i - 1, k - 1) - s(i - 1, j - 1)(k >= j)
         (1 <= k <= n)      s(i - 1, j) - s(i - 1, k)        (k < j)  }
         + d(i, j)
         (2 <= i <= m)(1 <= j <= n)
f(1, i) = d(1, i)(1 <= i <= n)
*)
program Ural_1029(Input, Output);
const
    MaxM = 100;
    MaxN = 500;
    MaxValue = MaxLongint;
type
    TIndex = Longint;
    TData = Longint;
    TSum = array[0..MaxN] of TData;
    TPath = array[1..MaxM, 1..MaxN] of TIndex;
    TFee = array[1..MaxM, 1..MaxN] of TData;
    TDp = array[1..2] of array[1..MaxN] of TData;
var
    F: TDp;
    S: TSum;
    D: TFee;
    P: TPath;
    M, N: TIndex;

procedure Print(i, j: TIndex);
var
    k: TIndex;
begin
    if i = 1 then
        Exit;
    Print(i - 1, P[i, j]);
    if P[i, j] > j then
    begin
        for k := P[i, j] downto j do
            Writeln(k);
    end
    else
    begin
        for k := P[i, j] to j do
            Writeln(k);
    end;
end;

procedure Main;
var
    i, j, k: TIndex;
    MinIndex: TIndex;
    V, Min: TData;
begin
    FillChar(F, SizeOf(F), 0);
    FillChar(D, SizeOf(D), 0);
    FillChar(P, SizeOf(P), 0);
    Readln(M, N);
    for i := 1 to M do
        for j := 1 to N do
            Read(D[i, j]);
    FillChar(S, SizeOf(S), 0);
    for i := 1 to N do
    begin
        F[1][i] := D[1][i];
        S[i] := S[i - 1] + D[1, i];
    end;
    for i := 2 to M do
    begin
        for j := 1 to N do
        begin
            Min := MaxValue;
            MinIndex := 0;
            for k := 1 to N do
            begin
                V := F[1][k] + Ord(k >= j) * (S[k - 1] - S[j - 1]) + Ord(k < j) * (S[j] - S[k]);
                if Min > V then
                begin
                    Min := V;
                    MinIndex := k;
                end;
            end;
            F[2][j] := Min + D[i, j];
            P[i, j] := MinIndex;
        end;
        F[1] := F[2];
        FillChar(S, SizeOf(S), 0);
        for j := 1 to N do
            S[j] := S[j - 1] + D[i, j];
    end;
    Min := MaxValue;
    MinIndex := 0;
    for i := 1 to N do
        if Min > F[1, i] then
        begin
            Min := F[1, i];
            MinIndex := i;
        end;
    Print(M, MinIndex);
    Writeln(MinIndex);
end;
begin
    {    Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o.txt');
        Rewrite(Output); }
    Main;
    { Close(Input);
     Close(Output);  }
end.

