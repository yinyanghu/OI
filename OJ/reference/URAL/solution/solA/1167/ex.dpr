program Ural_1167(Input, Output);
const
    MaxN = 500;
    MaxM = 500;
type
    TIndex = Longint;
    TSum = array[0..MaxN] of TIndex;
    TDp = array[1..MaxN] of TIndex;
var
    SW, SB: TSum;
    F1, F2: TDp;
    N, M: TIndex;

procedure Main;
var
    i, j, k: TIndex;
    X: TIndex;
begin
    FillChar(F1, SizeOf(F1), 127);
    FillChar(F2, SizeOf(F2), 127);
    FillChar(SW, SizeOf(SW), 0);
    FillChar(SB, SizeOf(SB), 0);
    Readln(N, M);
    for i := 1 to N do
    begin
        Read(X);
        SW[i] := SW[i - 1] + Ord(X = 0);
        SB[i] := SB[i - 1] + Ord(X = 1);
    end;
    for j := 1 to N do
        F1[j] := SW[j] * SB[j];
    for i := 2 to M do
    begin
        for j := i to N do
            for k := 1 to j - i + 1 do
                if F1[j - k] + (SW[j] - SW[j - k]) * (SB[j] - SB[j - k]) < F2[j] then
                    F2[j] := F1[j - k] + (SW[j] - SW[j - k]) * (SB[j] - SB[j - k]);
        F1 := F2;
    end;
    Writeln(F1[N]); // it's not F2, because when n=1!
end;
begin
    {Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output); }
    Main;
    {Close(Input);
    Close(Output); }
end.

