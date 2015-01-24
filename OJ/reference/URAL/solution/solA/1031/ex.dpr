{$N+}
program Ural_1031(Input, Output);
const
    MaxValue = 1E13;
    MaxN = 10000;
type
    TIndex = Longint;
    TData = Extended;
    TDp = array[1..MaxN] of TData;
    TStops = array[1..MaxN] of record
        Length: TIndex;
        FarthestStop: array[1..3] of TIndex;
    end;
    TTickets = array[1..3] of record
        Length: TIndex;
        Price: TData;
    end;
var
    N, S, E: TIndex;
    i, j, k: TIndex;
    F: TDp;
    St: TStops;
    T: TTickets;

begin
    for i := 1 to 3 do
        Read(T[i].Length);
    for i := 1 to 3 do
        Read(T[i].Price);
    Read(N);
    Read(S, E);
    if S > E then
    begin
        i := S;
        S := E;
        E := i;
    end;
    FillChar(St, SizeOf(St), 0);
    for i := 2 to N do
        Read(St[i].Length);
    for i := 1 to 3 do
    begin
        k := E;
        for j := E downto S do
        begin
            while (k > S) and (Abs(St[j].Length - St[k - 1].Length)
                <= T[i].Length) do
                Dec(k);
            St[j].FarthestStop[i] := k;
        end;
    end;
    F[S] := 0;
    for i := S + 1 to E do
    begin
        F[i] := MaxValue;
        for j := 1 to 3 do
        begin
            k := St[i].FarthestStop[j];
            if F[k] + T[j].Price < F[i] then
                F[i] := F[k] + T[j].Price;
        end;
    end;
    Writeln(F[E]: 0: 0);
end.

