program Ural_1026(Input, output);
const
    MaxN = 100000;
type
    TIndex = Longint;
    TData = Integer;
    TData_Arr = array[1..MaxN] of TData;
var
    N, K: TIndex;
    D: TData_Arr;

procedure Swap(A, B: TIndex);
var
    tmp: TData;
begin
    tmp := D[A];
    D[A] := D[B];
    D[B] := tmp;
end;

procedure Sift(k, m: TIndex);
var
    i, j: TIndex;
    x: TData;
begin
    i := k;
    j := 2 * k;
    x := D[i];
    if (j < m) and (D[j + 1] > D[j]) then
        Inc(j);
    while (j <= m) and (D[j] > x) do
    begin
        D[i] := D[j];
        i := j;
        j := j * 2;
        if (j < m) and (D[j + 1] > D[j]) then
            Inc(j);
    end;
    D[i] := x;
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
    i, tmp: TIndex;
    St: string;
begin
    Readln(N);
    for i := 1 to N do
        Readln(D[i]);
    HeapSort;
    Readln(St);
    Readln(K);
    for i := 1 to K do
    begin
        Readln(tmp);
        Writeln(D[tmp]);
    end;
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
 {   Close(Input);
    Close(Output);  }
end.

