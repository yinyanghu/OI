program Ural_1119(Input, Output);
const
    MaxK = 100;
type
    TIndex = Longint;
    TData = Real;
    TStop = record
        X, Y: TIndex;
        Len: TData;
    end;
    TDp = array[1..MaxK] of TStop;
var
    N, M, K: TIndex;
    F: TDp;

procedure Main;
var
    i, j: TIndex;
    T, Min: TData;
    tmp: TStop;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N, M);
    Readln(K);
    for i := 1 to K do
        Readln(F[i].X, F[i].Y);
    for i := 1 to K - 1 do
        for j := i + 1 to K do
            if F[i].X > F[j].X then
            begin
                tmp := F[i];
                F[i] := F[j];
                F[j] := tmp;
            end;
    for i := 1 to K - 1 do
        for j := i + 1 to K do
            if (F[i].X = F[j].X) and (F[i].Y > F[j].Y) then
            begin
                tmp := F[i];
                F[i] := F[j];
                F[j] := tmp;
            end;
    for i := 1 to K do
    begin
        Min := F[i].X - 1 + F[i].Y - 1;
        for j := 1 to i - 1 do
            if (F[j].X <= F[i].X - 1) and (F[j].Y <= F[i].Y - 1) then
            begin
                T := F[j].Len + F[i].X - 1 - F[j].X + F[i].Y - 1 - F[j].Y;
                if T < Min then
                    Min := T;
            end;
        F[i].Len := Min + Sqrt(2);
    end;
    Min := N + M;
    for i := 1 to K do
    begin
        T := F[i].Len + N - F[i].X + M - F[i].Y;
        if T < Min then
            Min := T;
    end;
    Writeln(Min * 100: 0: 0);
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Main;
    {Close(Input);
    Close(Output);  }
end.

