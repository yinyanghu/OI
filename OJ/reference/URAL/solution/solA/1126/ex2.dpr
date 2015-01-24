(*
Use Hash Table (Value Orderly)
check every time
Number of values stay in hash tabel is |M| exactly. M is set of them.
Let Max be maximum in old M (before check)
  M'= M-[oldest element]+[new element]
  delete oldest element in M 
  perhaps Max is removed after this deletion
  so must find new Max for M'
  if New Value > Max then Max must be New Value
  else from high to low find first element that appear in hash (orderly)
*)
program Ural_1126(Input, Output);
//0.046 669kb
const
    MaxLimit = 100000;
    MaxN = 25000 + 1; //MaxN=25001 in fact  Crash 3 times
type
    TIndex = Longint;
    TData = array[1..MaxN] of Longint;
    THash = array[0..MaxLimit] of Word;
var
    H: THash;
    D: TData;
    N, M: TIndex;

procedure Main;
var
    i: TIndex;
    T, Max: TIndex;
begin
    FillChar(H, SizeOf(H), 0);
    FillChar(D, SizeOf(D), 0);
    Readln(M);
    N := 0;
    repeat
        Readln(T);
        if T = -1 then Break;
        Inc(N);
        D[N] := T;
    until false;
    if N < M then Exit;
    Max := 0;
    for i := 1 to M do
    begin
        Inc(H[D[i]]);
        if D[i] > Max then Max := D[i];
    end;
    Writeln(Max);
    for i := M + 1 to N do
    begin
        Inc(H[D[i]]);
        Dec(H[D[i - M]]);
        if D[i] >= Max then
            Max := D[i]
        else
        begin
            while (H[Max] = 0) and (Max > 0) do
                Dec(Max);
        end;
        Writeln(Max);
    end;
end;
begin
    {    Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o3.txt');
        Rewrite(Output);   }
    Main;
    {    Close(Input);
        Close(Output); }
end.

