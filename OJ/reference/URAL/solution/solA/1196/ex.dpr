program Ural_1196(Input, Output);
const
    MaxN = 15000;
type
    TIndex = Longint;
    TData = Longint;
    TList = array[1..MaxN] of TData;
var
    N, M, Count: TIndex;
    A: TList;

function BinarySearch(X: TData): TIndex;
var
    l, r, mid: TIndex;
begin
    l := 1;
    r := N;
    while l <= r do
    begin
        mid := (l + r) div 2;
        if A[mid] < X then
            l := mid + 1
        else if A[mid] > X then
            r := mid - 1
        else if A[mid] = X then
        begin
            BinarySearch := mid;
            Exit;
        end;
    end;
    BinarySearch := 0;
end;

procedure Main;
var
    i: TIndex;
    T: TData;
begin
    FillChar(A, SizeOf(A), 0);
    Readln(N);
    for i := 1 to N do
        Readln(A[i]);
    Readln(M);
    Count := 0;
    for i := 1 to M do
    begin
        Readln(T);
        if BinarySearch(T) > 0 then
            Inc(Count);
    end;
    Writeln(Count);
end;
begin
    Main;
end.

