program Ural_1203(Input, Output);
const
    MaxN = 100000;
type
    TIndex = Longint;
    TTime = Word;
    TConference = record
        StartTime, EndTime: TTime;
    end;
    TConference_Arr = array[1..MaxN] of TConference;
var
    Conference: TConference_Arr;
    N, Count: TIndex;
    tmp: TConference;

procedure Swap(A, B: TIndex);
var
    tmp: TConference;
begin
    tmp := Conference[A];
    Conference[A] := Conference[B];
    Conference[B] := tmp;
end;

procedure Sift(k, m: TIndex);
var
    i, j: TIndex;
    x: TConference;
begin
    i := k;
    j := 2 * k;
    x := Conference[i];
    if (j < m) and (Conference[j + 1].EndTime > Conference[j].EndTime) then
        Inc(j);
    while (j <= m) and (Conference[j].EndTime > x.EndTime) do
    begin
        Conference[i] := Conference[j];
        i := j;
        j := j * 2;
        if (j < m) and (Conference[j + 1].EndTime > Conference[j].EndTime) then
            Inc(j);
    end;
    Conference[i] := x;
end;

procedure HeapSort;
var
    i, k, m: TIndex;
begin
    k := N div 2 + 1;
    m := N;
    while k > 1 do
    begin
        Dec(k);
        Sift(k, m);
    end;
    for i := m downto 1 do
    begin
        Swap(1, i);
        Sift(1, i - 1);
    end;
end;

procedure Main;
var
    i, j: TIndex;
begin
    Readln(N);
    for i := 1 to N do
        Readln(Conference[i].StartTime, Conference[i].EndTime);
    HeapSort;
    Count := 1;
    j := 1;
    for i := 2 to N do
        if Conference[i].StartTime > Conference[j].EndTime then
        begin
            Inc(Count);
            j := i;
        end;
    Writeln(Count);
end;
begin
    Main;
end.

