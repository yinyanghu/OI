{
Notice:
Output : Exactly N digits
}
program Ural_1048(Input, Output);
const
    MaxN = 1000000;
    MaxBit = 9;
    MaxLen = MaxN div MaxBit + 1;
    Txp: array[0..MaxBit] of Longint = (1, 10, 100, 1000, 10000, 100000,
        1000000, 10000000, 100000000, 1000000000);
type
    TIndex = Longint;
    TData = Longint;
    TNum = array[1..MaxLen] of TData;
var
    D: TNum;
    N: TIndex;

procedure Main;
var
    i: TIndex;
    T1, T2: TData;
begin
    Readln(N);
    for i := 1 to N do
    begin
        Readln(T1, T2);
        Inc(D[(N - i + 1 - 1) div MaxBit + 1], (T1 + T2) * Txp[(N - i + 1 - 1) mod 9]);
    end;
    for i := 1 to (N - 1) div MaxBit + 1 do
    begin
        Inc(D[i + 1], D[i] div Txp[MaxBit]);
        D[i] := D[i] mod Txp[MaxBit];
    end;
    for i := N downto 1 do
    begin
        Write(D[(i - 1) div MaxBit + 1] div Txp[(i - 1) mod 9]);
        D[(i - 1) div MaxBit + 1] := D[(i - 1) div MaxBit + 1] mod Txp[(i - 1) mod 9];
    end;
    Writeln;
end;
begin
    Main;
end.

