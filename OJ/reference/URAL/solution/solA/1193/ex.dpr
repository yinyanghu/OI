program Ural_1193(Input, Output);
const
    MaxN = 100;
type
    TIndex = Longint;
    TItem = record
        T1, T2, T3: TIndex;
    end;
    TData = array[1..MaxN] of TItem;
var
    D: TData;
    N: TIndex;

procedure Main;
var
    i, j: TIndex;
    T, Max: TIndex;
    tmp: TItem;
begin
    Readln(N);
    for i := 1 to N do
        Readln(D[i].T1, D[i].T2, D[i].T3);
    for i := 1 to N - 1 do
        for j := i + 1 to N do
            if D[i].T1 > D[j].T1 then
            begin
                tmp := D[i];
                D[i] := D[j];
                D[j] := tmp;
            end;
    T := 0;
    Max := 0;
    for i := 1 to N do
    begin
        if T <= D[i].T1 then
            T := D[i].T1;
        T := T + D[i].T2;
        if T - D[i].T3 > Max then
            Max := T - D[i].T3
    end;
    Writeln(Max);
end;
begin
    {    Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o.txt');
        Rewrite(Output);     }
    Main;
    { Close(Input);
     Close(Output);   }
end.

