program Ural_1005(Input, Output);
const
    MaxN = 20;
type
    TIndex = Byte;
    TData = Longint;
    TSet = set of 1..MaxN;
    TDataArr = array[1..MaxN] of TData;
var
    N: TIndex;
    S: TSet;
    Min: TData;
    D: TDataArr;

procedure Search(Depth: TIndex);
var
    i: TIndex;
    Sum: TData;
begin
    if Depth = N + 1 then
    begin
        Sum := 0;
        for i := 1 to N do
            if i in S then
                Inc(Sum, D[i])
            else
                Dec(Sum, D[i]);
        if Abs(Sum) < Min then
            Min := Abs(Sum);
        Exit;
    end;
    Search(Depth + 1);
    S := S + [Depth];
    Search(Depth + 1);
    S := S - [Depth];
end;

procedure Init;
var
    i: TIndex;
begin
    S := [];
    Min := MaxLongint;
    Read(N);
    for i := 1 to N do
        Read(D[i]);
end;
begin
    Init;
    Search(1);
    Writeln(Min);
end.

