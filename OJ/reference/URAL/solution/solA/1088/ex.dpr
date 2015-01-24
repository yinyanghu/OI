program Ural_1088(Input, Output);
//round(0.5)=0 in delphi!!!
type
    TIndex = Longint;
var
    Step, Limit, LD, LE, ND, NE: TIndex;

procedure Main;
var
    i: TIndex;
begin
    Readln(LD, LE, i, ND, NE, Limit);
    for i := 1 to LD do
        ND := (ND - 1) div 2 + 1;
    for i := 1 to LE do
        NE := (NE - 1) div 2 + 1;
    Step := Abs(LD - LE);
    if LD < LE then
        for i := LD + 1 to LE do
            ND := (ND - 1) div 2 + 1
    else
        for i := LE + 1 to LD do
            NE := (NE - 1) div 2 + 1;
    while ND <> NE do
    begin
        Inc(Step, 2);
        ND := (ND - 1) div 2 + 1;
        NE := (NE - 1) div 2 + 1;
    end;
    if Step <= Limit then
        Writeln('YES')
    else
        Writeln('NO');
end;
begin
    Main;
end.

