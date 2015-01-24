program Ural_1123(Input, Output);
const
    MaxLen = 2001;
type
    TIndex = Longint;
    TData = array[1..MaxLen] of Shortint;
var
    N: TIndex;
    D: TData;

function Compare(l1, l2, Len: TIndex): TIndex;
var
    i: TIndex;
begin
    i := l1;
    while (D[i] = D[l2 + Len - i]) and (i > l1 - Len + 1) do
        Dec(i);
    if D[i] < D[l2 + Len - i] then
        Compare := -1
    else if D[i] > D[l2 + Len - i] then
        Compare := 1
    else
        Compare := 0;
end;

procedure PlusOne(l, r: TIndex);
var
    i: TIndex;
begin
    i := r;
    Inc(D[i]);
    while (D[i] >= 10) and (i > l) do
    begin
        Inc(D[i - 1], D[i] div 10);
        D[i] := D[i] mod 10;
        Dec(i);
    end;
end;

procedure Main;
var
    Ch: Char;
    i, j: TIndex;
begin
    N := 0;
    while not Eof do
    begin
        Read(Ch);
        if Ch in ['0'..'9'] then
        begin
            Inc(N);
            D[N] := Ord(Ch) - Ord('0');
        end;
    end;
    if Compare(N div 2, N div 2 + Ord(Odd(N)) + 1, N div 2) = -1 then
        PlusOne(1, N div 2 + Ord(Odd(N)));
    j := N div 2 + Ord(Odd(N));
    for i := 1 to j do
        Write(D[i]);
    for i := N div 2 downto 1 do
        Write(D[i]);
    Writeln;
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);    }
    Main;
  {  Close(Input);
    Close(Output);   }
end.

