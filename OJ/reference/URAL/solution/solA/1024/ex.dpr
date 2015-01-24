program Ural_1024(Input, Output);
const
    MaxN = 1000;
type
    TIndex = Longint;
    TPermutations = array[1..MaxN] of TIndex;
    TFlag = array[1..MaxN] of Boolean;
var
    P: TPermutations;
    F: TFlag;
    N, LCM: TIndex;

function GCD(a, b: TIndex): TIndex;
var
    r: TIndex;
begin
    while b <> 0 do
    begin
        r := a mod b;
        a := b;
        b := r;
    end;
    GCD := a;
end;

procedure Main;
var
    i, j, k: TIndex;
begin
    Readln(N);
    FillChar(F, SizeOf(F), 0);
    for i := 1 to N do
        Read(P[i]);
    LCM := 1;
    for i := 1 to N do
        if not F[i] then
        begin
            j := P[i];
            F[j] := true;
            k := 1;
            while j <> i do
            begin
                Inc(k);
                F[j] := true;
                j := P[j];
            end;
            LCM := LCM * k div GCD(LCM, k);
        end;
    Writeln(LCM);
end;
begin
    Main;
end.

