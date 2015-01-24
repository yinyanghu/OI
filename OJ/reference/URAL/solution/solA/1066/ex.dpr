program Ural_1066(Input, Output);
const
    MaxN = 1000;
type
    TIndex = Longint;
    TData = Real;
    TCoefficient = array[1..MaxN] of TIndex;
var
    N: TIndex;
    A1, A2, AN: TData;
    P, Q, R: TCoefficient;

procedure Main;
var
    i: TIndex;
    Max: TData;
begin
    Readln(N, A1);
    P[1] := 1;
    Q[1] := 0;
    R[1] := 0;
    P[2] := 0;
    Q[2] := 1;
    R[2] := 0;
    for i := 3 to N do
    begin
        P[i] := -P[i - 2] + 2 * P[i - 1];
        Q[i] := -Q[i - 2] + 2 * Q[i - 1];
        R[i] := -R[i - 2] + 2 * R[i - 1] + 2;
    end;
    Max := 0;
    for i := 2 to N - 1 do
    begin
        A2 := (-R[i] - P[i] * A1) / Q[i];
        AN := P[N] * A1 + Q[N] * A2 + R[N];
        if AN > Max then
            Max := AN;
    end;
    Writeln(Max: 0: 2);
end;
begin
    { Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);    }
    Main;
    {   Close(Input);
       Close(Output);   }
end.

