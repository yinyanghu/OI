program Ural_1134(Input, Output);
const
    MaxN = 1000;
type
    TIndex = Longint;
    TAmount = array[0..MaxN+1] of TIndex;
    TUsed = array[0..MaxN+1] of Boolean;//Buffer + 1
var
    F: TAmount;
    U: TUsed;
    N: TIndex;

procedure Main;
var
    i, M: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    FillChar(U, SizeOf(U), 0);
    Readln(N, M);
    while M > 0 do
    begin
        Dec(M);
        Read(i);
        Inc(F[i]);
    end;
    for i := 0 to N do
    begin
        if (not U[i]) and (F[i] > 0) and (i <> 0) then
        begin
            U[i] := true;
            Dec(F[i]);
        end;
        if (not U[i + 1]) and (F[i] > 0) and (i <> N) then
        begin
            U[i + 1] := true;
            Dec(F[i]);
        end;
        if F[i] > 0 then
        begin
            Writeln('NO');
            Exit;
        end;
    end;
    Writeln('YES');
end;

begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
{    Close(Input);
    Close(Output); }
end.

