program Ural_1222(Input, Output);
const
    MaxLen = 500;
type
    TIndex = Integer;
    TData = record
        D: array[1..MaxLen] of Byte;
        Len: TIndex;
    end;
var
    i, j, K, N: TIndex;
    F: TData;
begin
    Readln(N);
    if (N >= 0) and (N <= 3) then
    begin
        Writeln(N);
        Exit;
    end;
    F.Len := 1;
    case n mod 3 of
        0: F.D[1] := 3;
        1: F.D[1] := 4;
        2: F.D[1] := 2;
    end;
    K := (N - F.D[1]) div 3;
    for i := 1 to K do
    begin
        for j := 1 to F.Len do
            F.D[j] := F.D[j] * 3;
        for j := 1 to F.Len do
        begin
            Inc(F.D[j + 1], F.D[j] div 10);
            F.D[j] := F.D[j] mod 10;
        end;
        while F.D[F.Len + 1] > 0 do
            Inc(F.Len);
    end;
    for i := F.Len downto 1 do
        Write(F.D[i]);
    Writeln;
end.

