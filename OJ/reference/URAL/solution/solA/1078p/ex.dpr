{notice:
quicksort
midItem is not Index
It is an Item!!!!
}
program Ural_1078(Input, Output);
const
    MaxN = 500;
type
    TIndex = Integer;
    TSegment = record
        L, R: Integer;
        Index: TIndex;
    end;
    TSegments = array[1..MaxN] of TSegment;
    TDP = array[1..MaxN] of TIndex;
    TPath = array[1..MaxN] of TIndex;
    TResult = array[1..MaxN] of TIndex;
var
    N: TIndex;
    S: TSegments;
    F: TDP;
    P: TPath;

procedure QuickSort(l, r: TIndex);
var
    i, j: TIndex;
    Mid, tmp: TSegment;
begin
    i := l;
    j := r;
    Mid := S[(l + r) div 2]; // not  (l + r) div 2!!!! Wa 5 times!!
    repeat
        while (S[i].R < Mid.R) or ((S[i].R = Mid.R) and (S[i].L < Mid.L)) do
            Inc(i);
        while (S[j].R > Mid.R) or ((S[j].R = Mid.R) and (S[j].L > Mid.L)) do
            Dec(j);
        if i <= j then
        begin
            tmp := S[i];
            S[i] := S[j];
            S[j] := tmp;
            Inc(i);
            Dec(j);
        end;
    until i > j;
    if l < j then QuickSort(l, j);
    if i < r then QuickSort(i, r);
end;

procedure FindPath(x: TIndex);
begin
    if x = 0 then Exit;
    FindPath(P[x]);
    Write(S[x].Index, ' ');
end;

procedure Dp;
var
    i, j, MaxIndex: TIndex;
begin
    F[1] := 1;
    P[1] := 0;
    MaxIndex := 1;
    for i := 2 to N do
    begin
        F[i] := 1;
        P[i] := 0;
        for j := 1 to i - 1 do
            if (S[i].L < S[j].L) and (S[j].R < S[i].R) then
                if F[j] + 1 > F[i] then
                begin
                    F[i] := F[j] + 1;
                    P[i] := j;
                end;
        if F[i] > F[MaxIndex] then MaxIndex := i;
    end;
    Writeln(F[MaxIndex]);
    FindPath(MaxIndex);
end;

procedure Init;
var
    i: TIndex;
    tmp: TIndex;
begin
    FillChar(S, SizeOf(S), 0);
    FillChar(F, SizeOf(F), 0);
    FillChar(P, SizeOf(P), 0);
    Readln(N);
    for i := 1 to N do
    begin
        Readln(S[i].L, S[i].R);
        S[i].Index := i;
        if S[i].L > S[i].R then
        begin
            tmp := S[i].L;
            S[i].L := S[i].R;
            S[i].R := tmp;
        end;
    end;
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);  }
    Init;
    QuickSort(1, N);
    Dp;
    {Close(Input);
    Close(Output);   }
end.

