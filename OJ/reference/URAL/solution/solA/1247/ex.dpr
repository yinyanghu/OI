program Ural_1247(Input, Output);
const
    Maxn = 30000;
type
    TIndex = Longint;
    TData = array[1..MaxN] of TIndex;
    TSum = array[0..MaxN] of TIndex;
var
    N, M: TIndex;
    D: TData;
    S: TSum;

procedure Main;
var
    i, j, u, v: TIndex;
    Max: TIndex;
begin
    Readln(N, M);
    S[0] := 0;
    D[N + 1] := -1;
    for i := 1 to N do
    begin
        Readln(D[i]);
        Dec(D[i]);
        S[i] := S[i - 1] + D[i];
    end;
    Max := -MaxLongint div 2;
    u := 0;
    j := 0;
    for i := 1 to N + 1 do
        if D[i] = -1 then
        begin
            if u + S[i - 1] - S[j - 1] > S[i - 1] - S[j] then
                v := u + S[i - 1] - S[j - 1]
            else
                v := S[i - 1] - S[j];
            if v > Max then
                Max := v;
            u := v;
            j := i;
        end;
    if Max <= M then
        Writeln('YES')
    else
        Writeln('NO');
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);    }
    Main;
   { Close(Input);
    Close(Output);  }
end.

