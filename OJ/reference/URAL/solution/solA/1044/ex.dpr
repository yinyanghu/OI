program Ural_1044(Input, Output);
const
    MaxN = 8;
type
    TIndex = Longint;
    TDP = array[0..MaxN, 0..MaxN * 9] of TIndex;
var
    F: TDP;
    N: TIndex;

procedure Main;
var
    Sum: TIndex;
    i, j, k: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N);
    if Odd(N) then
    begin
        Writeln(0);
        Exit;
    end;
    N := N div 2;
    F[0][0] := 1;
    for i := 1 to N do
        for j := 0 to i * 9 do
            for k := 0 to 9 do
                if j - k >= 0 then
                    Inc(F[i][j], F[i - 1][j - k]);
    Sum := 0;
    for i := 0 to N * 9 do
        Inc(Sum, Sqr(F[N][i]));
    Writeln(Sum);
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);      }
    Main;
    {Close(Input);
    Close(Output);}
end.

