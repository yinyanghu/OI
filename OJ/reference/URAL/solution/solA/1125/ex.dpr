program Ural_1125(Input, Output);
const
    MaxM = 50;
    MaxN = 50;
type
    TIndex = Longint;
    TMap = array[1..MaxM, 1..MaxN] of Boolean;
    TPythagorean = array[1..MaxM * MaxN] of record
        x, y: TIndex;
    end;
var
    G: TMap;
    P: TPythagorean;
    K, M, N: TIndex;

procedure Reverse(x, y: TIndex);
begin
    if (x in [1..M]) and (y in [1..N]) then
        G[x, y] := not G[x, y];
end;

procedure Main;
var
    i, j, x, y, t, Max: TIndex;
    Ch: Char;
begin
    Readln(M, N);
    K := 0;
    Max := M;
    if Max < N then Max := N;      {Notice!}
    for i := 1 to Max do
        for j := i + 1 to Max do
            if Frac(Sqrt(Sqr(i) + Sqr(j))) = 0 then
            begin
                Inc(K);
                P[K].x := i;
                P[K].y := j;
            end;
    for x := 1 to M do
    begin
        for y := 1 to N do
        begin
            Read(Ch);
            if Ch = 'W' then
                G[x, y] := true
            else if Ch = 'B' then
                G[x, y] := false;
        end;
        Readln;
    end;
    for x := 1 to M do
    begin
        for y := 1 to N do
        begin
            Read(t);
            if Odd(t) then
            begin
                for i := 1 to K do
                begin
                    Reverse(x + P[i].x, y + P[i].y);
                    Reverse(x - P[i].x, y + P[i].y);
                    Reverse(x + P[i].x, y - P[i].y);
                    Reverse(x - P[i].x, y - P[i].y);
                    Reverse(x + P[i].y, y + P[i].x);
                    Reverse(x - P[i].y, y + P[i].x);
                    Reverse(x + P[i].y, y - P[i].x);
                    Reverse(x - P[i].y, y - P[i].x);
                end;
                for i := 1 to M do
                    Reverse(i, y);
                for i := 1 to N do
                    Reverse(x, i);
                Reverse(x, y);      {Notice!}
            end;
        end;
        Readln;
    end;
    for x := 1 to M do
    begin
        for y := 1 to N do
            if G[x, y] then
                Write('W')
            else if not G[x, y] then
                Write('B');
        Writeln;
    end;
end;
begin
 {   Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Main;
   { Close(Input);
    Close(Output);   }
end.

