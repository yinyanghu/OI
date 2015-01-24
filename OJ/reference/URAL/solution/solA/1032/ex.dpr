program Ural_1032(Input, Output);
const
    MaxN = 15000;
type
    TIndex = Longint;
    TData = array[1..MaxN] of TIndex;
    TSum = array[1..MaxN] of TIndex;
var
    N: TIndex;
    D: TData;
    S: TSum;

function Print(l, r: TIndex): Boolean;
var
    i: TIndex;
begin
    Writeln(r - l + 1);
    for i := l to r do
        Writeln(D[i]);
    Print := true;
end;

procedure Main;
var
    i, j: TIndex;
    found: Boolean;
begin
    Readln(N);
    found := false;
    for i := 1 to N do
    begin
        Readln(D[i]);
        S[i] := (S[i - 1] + D[i]) mod N;
        if S[i] = 0 then
            found := Print(1, i);
        if found then
            Break;
        for j := 1 to i - 1 do
            if S[j] = S[i] then
                found := Print(j + 1, i);
        if found then
            Break;
    end;
    if not found then
        Writeln(0);
end;
begin
    Main;
end.

