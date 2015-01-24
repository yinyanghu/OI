program Ural_1184(Input, Output);
//21:27
const
    TenPower: array[0..2] of Longint = (1, 10, 100);
    MaxN = 10000;
type
    TIndex = Longint;
    TData = Int64;
    TLength = array[1..MaxN] of TData;
var
    N, K: TIndex;
    D: TLength;

procedure Main;
var
    AfterPoint: TIndex;
    i: TIndex;
    l, r, m, f, S, Max: TData;
    Ch: Char;
    Found: Boolean;
    St: string;
begin
    FillChar(D, SizeOf(D), 0);
    Readln(N, K);
    Max := 0;
    for i := 1 to N do
    begin
        D[i] := 0;
        AfterPoint := -1;
        while not Eoln do
        begin
            Read(Ch);
            if Ch in ['0'..'9'] then
            begin
                D[i] := D[i] * 10 + Ord(Ch) - Ord('0');
                if AfterPoint >= 0 then Inc(AfterPoint);
            end;
            if Ch = '.' then AfterPoint := 0;
        end;
        Readln;
        D[i] := D[i] * TenPower[2 - AfterPoint];
        if Max < D[i] then Max := D[i];
    end;
    l := 1;
    r := Max;
    f := 0;
    Found := false;
    while l <= r do
    begin
        m := (l + r) div 2;
        S := 0;
        for i := 1 to N do
            Inc(S, D[i] div m);
        if S < K then r := m - 1;
        if S >= K then   //Wa N times ,always record last valid value, instead of S being just equal to K , jakeass!
        begin
            Found := true;
            f := m;
            l := m + 1;
        end;
    end;
    if not Found then
        Writeln('0.00')
    else
    begin
        Str(f mod 100, St);
        if Length(St) = 1 then St := '0' + St;
        Writeln(f div 100, '.', St);
    end;
end;
begin
 {   Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);           }
    Main;
   { Close(Input);
    Close(Output); }
end.

