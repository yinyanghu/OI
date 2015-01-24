program Ural_1047(Input, Output);
const
    MaxN = 3000;
type
    TIndex = Longint;
    TData = Real;
    TCoefficient = array[0..MaxN + 1] of TData;
var
    N: TIndex;
    A0, A1, AN_: TData; //AN_ i.e. A(N+1)
    P, Q, R, C: TCoefficient;

procedure Main;
var
    i: TIndex;
begin
    Readln(N);
    Readln(A0);
    Readln(AN_);
    for i := 1 to N do
        Readln(C[i]);
    P[0] := 1;
    Q[0] := 0;
    R[0] := 0;
    P[1] := 0;
    Q[1] := 1;
    R[1] := 0;
    for i := 2 to N + 1 do
    begin
        P[i] := -P[i - 2] + 2 * P[i - 1];
        Q[i] := -Q[i - 2] + 2 * Q[i - 1];
        R[i] := -R[i - 2] + 2 * R[i - 1] + 2 * C[i - 1];
    end;
    A1 := (AN_ - R[N + 1] - P[N + 1] * A0) / Q[N + 1];
    Writeln(A1: 0: 2);
end;
begin
{    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
{        Close(Input);
        Close(Output); }
end.

