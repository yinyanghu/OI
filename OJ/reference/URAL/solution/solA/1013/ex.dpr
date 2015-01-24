program Ural_1013(Input, Output);
const
    MaxN = 1798;
    MaxLen = 2000;
type
    TIndex = Integer;
    TData = record
        Len: TIndex;
        D: array[1..MaxLen] of Byte;
    end;
    TF = array[0..2] of TData;
var
    F: TF;

function Addition(Augend, Addend: TData): TData;
var
    i: TIndex;
    tmp: TData;
begin
    if Augend.Len < Addend.Len then
    begin
        tmp := Augend;
        Augend := Addend;
        Addend := tmp;
    end;
    for i := 1 to Augend.Len do
        Inc(Augend.D[i], Addend.D[i]);
    for i := 1 to Augend.Len do
    begin
        Inc(Augend.D[i + 1], Augend.D[i] div 10);
        Augend.D[i] := Augend.D[i] mod 10;
    end;
    while Augend.D[Augend.Len + 1] > 0 do
        Inc(Augend.Len);
    {Result := Augend;}
    Addition := Augend;
end;

function Multiplication(Multiplicand: TData; const Multiplicator:
    TIndex): TData;
var
    i: TIndex;
begin
    for i := 1 to Multiplicand.Len do
        Multiplicand.D[i] := Multiplicand.D[i] * Multiplicator;
    for i := 1 to Multiplicand.Len do
    begin
        Inc(Multiplicand.D[i + 1], Multiplicand.D[i] div 10);
        Multiplicand.D[i] := Multiplicand.D[i] mod 10;
    end;
    while Multiplicand.D[Multiplicand.Len + 1] > 0 do
        Inc(Multiplicand.Len);
    {Result := Multiplicand;}
    Multiplication := Multiplicand;
end;

procedure Main;
var
    i, N, K: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N, K);
    F[0].D[1] := 1;
    F[0].Len := 1;
    F[1].D[1] := K - 1;
    F[1].Len := 1; {K<=10 so K-1<=9 Len=1}
    for i := 2 to N do
    begin
        F[2] := Multiplication(Addition(F[1], F[0]), K - 1);
        F[0] := F[1];
        F[1] := F[2];
    end;
    for i := F[2].Len downto 1 do
        Write(F[2].D[i]);
    Writeln;
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
    {Close(Input);
    Close(Output);}
end.

