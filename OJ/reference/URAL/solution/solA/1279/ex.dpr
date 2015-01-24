program Ural_1279(Input, Output);
{
Notice:  Sort the height
 * is the old height ,the number is max new boxes of the level.
about every level:  delta(H)=H(i+1)-H(i)
the number of the new boxes of every level is delta(H)*i.
e.g 1..5 is the boxes filled.
6 and 7 is the overflow.
777777
666666
55555*
4444**
333***
22****
22****
1*****
******
Notice : set new boxes by min height rules i.e. needn't search!!!
and output the MIN height after set!!!!
use heapsort but not quicksort because the repeat height is usual!
}
const
    MaxN = 100;
type
    TIndex = Longint;
    THigh = array[1..MaxN * MaxN] of TIndex;
var
    N, M: TIndex;
    K: TIndex;
    H: THigh;

procedure Sift(l, r: TIndex);
var
    i, j: TIndex;
    tmp: TIndex;
    finished: Boolean;
begin
    i := l;
    j := i * 2;
    tmp := H[l];
    finished := false;
    while (not finished) and (j <= r) do
    begin
        if (j < r) and (H[j] < H[j + 1]) then
            Inc(j);
        if tmp >= H[j] then
            finished := true
        else
        begin
            H[i] := H[j];
            i := j;
            j := i * 2;
        end;
    end;
    H[i] := tmp;
end;

procedure HeapSort;
var
    i: TIndex;
    tmp: TIndex;
begin
    for i := N * M div 2 downto 1 do
        Sift(i, N * M);
    for i := N * M downto 1 do
    begin
        tmp := H[1];
        H[1] := H[i];
        H[i] := tmp;
        Sift(1, i - 1);
    end;
end;

procedure Main;
var
    i, j: TIndex;
    S: TIndex;
begin
    Readln(N, M, K);
    for i := 1 to N do
        for j := 1 to M do
            Read(H[(i - 1) * M + j]);
    HeapSort;
    S := 0;
    for i := 1 to N * M - 1 do
    begin
        Inc(S, (H[i + 1] - H[i]) * i);
        if S >= K then
        begin
            Writeln(H[i] + ((H[i + 1] - H[i]) * i - (S - K)) div i);
            Break;
        end;
    end;
    if S < K then
        Writeln((K - S) div (N * M) + H[N * M]);
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);   }
    Main;
    {    Close(Input);
        Close(Output); }
end.

