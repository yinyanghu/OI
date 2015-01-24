{
dynamic BFS+ heap sort : TLE at 9
static BFS + quick sort (binary): TLE at 16
static BFS + quick sort (random): AC 0.078s
static BFS + heap sort: AC 0.093s  
}
program Ural_1028(Input, Output);
const
    MaxN = 15000;
type
    TIndex = Longint;
    TStar = record
        X, Y: TIndex;
    end;
    TNode = record
        Value: TStar;
        Count: TIndex; //amount of left children and itself
    end;
    TTree = array[1..MaxN] of TNode; //By x
    TStars = array[1..MaxN] of TStar; //By y
    TLevel = array[0..MaxN - 1] of TIndex;
var
    P: TStars;
    T: TTree;
    Level: TLevel;
    N: TIndex;

function Compare(A, B: TStar): TIndex;
begin
    if (A.X > B.X) or ((A.X = B.X) and (A.Y > B.Y)) then
        Compare := 1
    else if (A.X = B.X) and (A.Y = B.Y) then
        Compare := 0
    else
        Compare := -1;
end;

procedure Swap(var A, B: TNode);
var
    tmp: TNode;
begin
    tmp := A;
    A := B;
    B := tmp;
end;

procedure Sift(l, r: TIndex);
var
    i, j: TIndex;
    tmp: TNode;
begin
    i := l;
    j := i * 2;
    tmp := T[l];
    while j <= r do
    begin
        if (j < r) and (Compare(T[j].Value, T[j + 1].Value) < 0) then
            Inc(j);
        if Compare(tmp.Value, T[j].Value) >= 0 then
            Break
        else
        begin
            T[i] := T[j];
            i := j;
            j := i * 2;
        end;
    end;
    T[i] := tmp;
end;

procedure HeapSort;
var
    i: TIndex;
begin
    for i := N div 2 downto 1 do
        Sift(i, N);
    for i := N downto 1 do
    begin
        Swap(T[1], T[i]);
        Sift(1, i - 1);
    end;
end;

procedure Main;
var
    i, Cur: TIndex;
    l, r, m: TIndex;
begin
    Readln(N);
    for i := 1 to N do
    begin
        Readln(P[i].X, P[i].Y);
        T[i].Value := P[i];
    end;
    HeapSort;
    for i := 1 to N do
    begin
        l := 1;
        r := N;
        Cur := 0;
        while l <= r do
        begin
            m := (l + r) div 2;
            if Compare(P[i], T[m].Value) > 0 then
            begin
                Inc(Cur, T[m].Count);
                l := m + 1;
            end
            else
            begin
                Inc(T[m].Count);
                r := m - 1;
            end;
        end;
        Inc(Level[Cur]);
    end;
    for i := 0 to N - 1 do
        Writeln(Level[i]);
end;
begin
   {  Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);       }
    Main;
     {  Close(Input);
        Close(Output); }
end.

