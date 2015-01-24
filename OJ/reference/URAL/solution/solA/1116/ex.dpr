program Ural_1116(Input, Output);
const
    MaxRange = 32000;
    MaxN = 15000;
    Undefined = 127;
type
    TIndex = Longint;
    FFunctionValue = array[-MaxRange - 1..MaxRange + 1] of Shortint;
    FFunctionRange = array[1..MaxN] of record
        Left, Right, Value: TIndex;
    end;
var
    F1, F2: FFunctionValue;
    F: FFunctionRange;
    LowerRange, UpperRange: TIndex;

procedure Main;
var
    i, j, l, r, v: TIndex;
    N, K: TIndex;
    InRange: Boolean;
begin
    FillChar(F1, SizeOf(F1), Undefined);
    FillChar(F2, SizeOf(F2), Undefined);
    Read(N);
    for i := 1 to N do
    begin
        Read(l, r, v);
        if l < LowerRange then LowerRange := l;
        if r > UpperRange then UpperRange := r;
        for j := l to r - 1 do
            F1[j] := v;
    end;
    Read(N);
    for i := 1 to N do
    begin
        Read(l, r, v);
        if l < LowerRange then LowerRange := l;
        if r > UpperRange then UpperRange := r;
        for j := l to r - 1 do
            F2[j] := v;
    end;
    K := 0;
    InRange := false;
    for i := LowerRange to UpperRange + 1 do  {+1!!check right-end }
        if (F1[i] <> Undefined) and (F2[i] = Undefined) then
        begin
            if not InRange then
            begin
                Inc(K);
                F[K].Left := i;
                F[K].Value := F1[i];
                InRange := true;
            end
            else if F1[i] <> F[K].Value then       {when x is both rightend and leftend}
            begin
                F[K].Right := i;
                Inc(K);
                F[K].Left := i;
                F[K].Value := F1[i];
            end;
        end
        else if InRange then
        begin
            F[K].Right := i;
            InRange := false;
        end;
    Write(K);
    for i := 1 to K do
        Write(' ', F[i].Left, ' ', F[i].Right, ' ', F[i].Value);
end;
begin
    {   Assign(Input, 'i1.txt');
       Reset(Input);
       Assign(Output, 'o.txt');
       Rewrite(Output);  }
    Main;
    {Close(Input);
    Close(Output); }
end.

