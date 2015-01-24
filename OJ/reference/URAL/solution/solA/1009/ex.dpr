program Ural_1009(Input, Output);
const
    MaxN = 16;
type
    TIndex = Integer;
    TData = Longint;
    TF = array[0..MaxN] of TData;
var
    i, N, K: TIndex;
    F: TF;
begin
    FillChar(F, SizeOf(F), 0);
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Readln(N, K);
    F[0] := 1;
    F[1] := K - 1;
    for i := 2 to N do
        F[i] := (K - 1) * (F[i - 2] + F[i - 1]);
    Writeln(F[N]);
    {Close(Input);
    Close(Output); }
end.

