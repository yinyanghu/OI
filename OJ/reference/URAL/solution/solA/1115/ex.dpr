program Ural_1115(Input, Output);
const
    MaxN = 100;
    MaxM = 10;
type
    TIndex = Longint;
    TChoose = array[1..MaxN] of TIndex;
    TLength = array[1..MaxN] of TIndex;
    TWide = array[1..MaxM] of TIndex;
    TSet = set of 1..MaxN;
var
    F: TChoose;
    S: TSet;
    N, M: TIndex;
    Len: TLength;
    Wide: TWide;
    Over: Boolean;

procedure Search(k, p: TIndex);
var
    i, j, L: TIndex;
begin
    if Over then Exit;
    if S = [1..N] then
    begin
        for i := 1 to M do
        begin
            L := 0;
            for j := 1 to N do
                if F[j] = i then
                    Inc(L);
            Writeln(L);
            for j := 1 to N do
                if F[j] = i then
                    Write(Len[j], ' ');
            Writeln;
        end;
        Over := true;
        Exit;
    end;
    for i := 1 to N do
        if not (i in S) then
            if Wide[p] >= Len[i] + k - 1 then
            begin
                F[i] := p;
                S := S + [i];
                Search(Len[i] + k, p + Ord(Wide[p] = Len[i] + k - 1));
                S := S - [i];
                if Over then Exit;
            end;
end;

procedure Main;
var
    i, j, k, tmp: TIndex;
begin
    Readln(N, M);
    for i := 1 to N do
        Readln(Len[i]);
    for i := 1 to M do
        Readln(Wide[i]);
    //Sort Length form large to small,it's a cutting
    for i := 1 to N - 1 do
    begin
        k := i;
        for j := i + 1 to N do
            if Len[k] < Len[j] then
                k := j;
        tmp := Len[i];
        Len[i] := Len[k];
        Len[k] := tmp;
    end;
    //here should sort Wide form small to large,it's a cutting
    //but order of M row should be same as order in rows given input
    //and M=10 cutting is small ,so not to sort Wide
    for i := 2 to M do
        Inc(Wide[i], Wide[i - 1]);
    S := [];
    Over := false;
    FillChar(F, SizeOf(F), 0);
    Search(1, 1);
end;

begin
    { Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);  }
    Main;
    {  Close(Input);
      Close(Output); }
end.

