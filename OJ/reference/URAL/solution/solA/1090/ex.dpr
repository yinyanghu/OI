program Ural_1090(Input, Output);
const
    MaxN = 10000;
type
    TIndex = Longint;
    TData = array[1..MaxN] of TIndex;
var
    N, K: TIndex;
    Max, MaxIndex: TIndex;
    Count: TIndex;
    D, tmp: TData;

procedure Merge(l, r: TIndex);
var
    lp, rp, tp: TIndex;
begin
    if (l + r) div 2 - l > 0 then Merge(l, (l + r) div 2);
    if r - (l + r) div 2 - 1 > 0 then Merge((l + r) div 2 + 1, r);
    lp := l;
    rp := (l + r) div 2 + 1;
    tp := 0;
    while (lp <= (l + r) div 2) and (rp <= r) do
    begin
        if D[lp] < D[rp] then
        begin
            Inc(tp);
            tmp[tp] := D[lp];
            Inc(lp);
        end
        else if D[lp] > D[rp] then
        begin
            Inc(tp);
            Inc(Count, (l + r) div 2 - lp + 1); // D[lp -> (l + r) div 2] All More than D[rp]
            tmp[tp] := D[rp];
            Inc(rp);
        end;
        { //This state is impossble  for this problem
        else if D[lp] = D[rp] then
         begin
             Inc(tp);
             tmp[tp] := D[lp];
             Inc(lp);
             Inc(tp);
             tmp[tp] := D[rp];
             Inc(rp);
         end;              }
    end;
    while lp <= (l + r) div 2 do
    begin
        Inc(tp);
        tmp[tp] := D[lp];
        Inc(lp);
    end;
    while rp <= r do
    begin
        Inc(tp);
        tmp[tp] := D[rp];
        Inc(rp);
    end;
    Move(tmp[1], D[l], SizeOf(tmp[1]) * tp);
end;

procedure Main;
var
    i, j: TIndex;
begin
    Readln(N, K);
    Max := -1;
    MaxIndex := 0;
    for i := 1 to K do
    begin
        for j := 1 to N do
            Read(D[j]);
        Readln;
        Count := 0;
        Merge(1, N);
        if Count > Max then
        begin
            Max := Count;
            MaxIndex := i;
        end;
    end;
    Writeln(MaxIndex);
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);     }
    Main;
    {    Close(Input);
        Close(Output);      }
end.

