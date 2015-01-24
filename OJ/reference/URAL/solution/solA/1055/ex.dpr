program Ural_1055(Input, Output);
const
    MaxN = 50000;
type
    TIndex = Longint;
    TFilter = record
        IsPrime: Boolean;
        PrimeRoot: TIndex;
        RepeatTimes: TIndex;
    end;
    TNumbers = array[1..MaxN] of TFilter;
var
    Num: TNumbers;
    N, M, Count: TIndex;

procedure Filter;
var
    i, j: TIndex;
begin
    for i := 1 to N do
    begin
        Num[i].IsPrime := true;
        Num[i].PrimeRoot := i;
        Num[i].RepeatTimes := 0;
    end;
    Num[1].IsPrime := false;
    Num[1].PrimeRoot := 0;
    for i := 1 to N do
        if Num[i].IsPrime then
            for j := 2 to N div i do
            begin
                Num[i * j].IsPrime := false;
                Num[i * j].PrimeRoot := i;
            end;
end;

procedure ReduceAndAddOrMinus(T: TIndex; IsAdd: Boolean);
var
    j: TIndex;
begin
    while T > 1 do
    begin
        j := Num[T].PrimeRoot;
        if IsAdd then
            Inc(Num[j].RepeatTimes)
        else
            Dec(Num[j].RepeatTimes);
        if j = T then
            Break;
        T := T div j;
    end;
end;

procedure Main;
var
    i: TIndex;
begin
    Readln(N, M);
    Filter;
    for i := 1 to N do
        ReduceAndAddOrMinus(i, true);
    for i := 1 to N - M do
        ReduceAndAddOrMinus(i, false);
    for i := 1 to M do
        ReduceAndAddOrMinus(i, false);
    Count := 0;
    for i := 1 to N do
        if (Num[i].IsPrime) and (Num[i].RepeatTimes > 0) then
            Inc(Count);
    Writeln(Count);
end;
begin
    Main;
end.

