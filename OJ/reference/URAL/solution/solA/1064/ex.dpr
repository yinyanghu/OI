program Ural_1064(Input, Output);
const
    MaxN = 10000;
type
    TIndex = Longint;
    TRange = array[1..MaxN] of record
        Left, Right: TIndex;
    end;
var
    F: TRange;

function BinarySearch(l, r, X, H: TIndex): Boolean;
var
    i: TIndex;
begin
    BinarySearch := false;
    i := 0;
    while (i < H) and (l <= r) do
    begin
        Inc(i);
        if X > (l + r) div 2 then
            l := (l + r) div 2 + 1
        else if X < (l + r) div 2 then
            r := (l + r) div 2 - 1
        else
        begin
            if i = H then
                BinarySearch := true;
            Exit;
        end;
    end;
end;

procedure Main;
var
    InRange: Boolean;
    N, H, K, Last: TIndex;
    i: TIndex;
begin
    Readln(N, H);
    Last := -1;
    InRange := false;
    K := 0;
    for i := N + 1 to MaxN do
        if BinarySearch(0, i - 1, N, H) then
        begin
            if not InRange then
            begin
                InRange := true;
                Last := i;
            end;
        end
        else
        begin
            if InRange then
            begin
                InRange := false;
                Inc(K);
                F[K].Left := Last;
                F[K].Right := i - 1;
            end;
        end;
    if InRange then
    begin
        Inc(K);
        F[K].Left := Last;
        F[K].Right := MaxN;
    end;
    Writeln(K);
    for i := 1 to K do
        Writeln(F[i].Left, ' ', F[i].Right);
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Main;
   { Close(Input);
    Close(Output);  }
end.

