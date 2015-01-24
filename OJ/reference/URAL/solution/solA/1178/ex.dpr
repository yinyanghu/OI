(*
create n/2 not-intersect lines
convexity hull?
no
A(1,0) B(4,0) C(-2,1) D(5,1)
if CB AD then crash . why? A and D are in both sizes of CB.
so we sort the points by low (first key)and left (second key)
then P[i] -> P[i+1] . it's impossible to exist P[j]->P[j+1] are in both sizes of P[i] -> P[i+1]
*)
program Ural_1178(Input, Output);
//21:38   21:55
const
    MaxN = 10000;
type
    TIndex = Longint;
    TPoint = record
        X, Y: TIndex;
        Ind: TIndex;
    end;
    TPoints = array[1..MaxN] of TPoint;
var
    N: TIndex;
    D: TPoints;

function Compare(P1, P2: TPoint): TIndex;
begin
    if (P1.Y < P2.Y) or ((P1.Y = P2.Y) and (P1.X < P2.X)) then
        Compare := -1
    else
        Compare := 1;
end;

procedure Sift(l, r: TIndex);
var
    i, j: TIndex;
    tmp: TPoint;
begin
    i := l;
    j := i * 2;
    tmp := D[i];
    while j <= r do
    begin
        if (j + 1 <= r) and (Compare(D[j], D[j + 1]) < 0) then Inc(j);
        if Compare(tmp, D[j]) > 0 then
            Break
        else
        begin
            D[i] := D[j];
            i := j;
            j := i * 2;
        end;
    end;
    D[i] := tmp;
end;

procedure HeapSort;
var
    i: TIndex;
    tmp: TPoint;
begin
    for i := N div 2 downto 1 do
        Sift(i, N);
    for i := N downto 1 do
    begin
        tmp := D[1];
        D[1] := D[i];
        D[i] := tmp;
        Sift(1, i - 1);
    end;
end;

procedure Main;
var
    i: TIndex;
begin
    Readln(N);
    for i := 1 to N do
    begin
        Readln(D[i].X, D[i].Y);
        D[i].Ind := i;
    end;
    HeapSort;
    for i := 1 to N div 2 do
        Writeln(D[i * 2 - 1].Ind, ' ', D[i * 2].Ind);
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
    {Close(Input);
    Close(Output);  }
end.

