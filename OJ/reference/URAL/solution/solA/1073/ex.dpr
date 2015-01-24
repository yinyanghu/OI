program Ural_1073(Input, Output);
const
    MaxN = 60000;
type
    TIndex = Longint;
    TDp = array[0..MaxN] of TIndex;
var
    i, j, T, N: TIndex;
    F: TDp;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);             }
    FillChar(F, SizeOf(F), 0);
    Readln(N);
    F[0] := 0;
    for i := 1 to N do
    begin
        if Trunc(Sqrt(i)) = Sqrt(i) then
            F[i] := 1
        else
            F[i] := MaxLongint;
        for j := 1 to Trunc(Sqrt(i)) do
            if F[i - j * j] + 1 < F[i] then
                F[i] := F[i - j * j] + 1;
    end;
    Writeln(F[N]);
 {   Close(Input);
    Close(Output);      }
end.

