program Ural_1106(Input, Output);
const
    MaxN = 100;
type
    TIndex = Byte;
    TTeamFlag = array[1..MaxN] of TIndex;
var
    F: TTeamFlag;
    N: TIndex;

procedure Main;
var
    i, T, Count: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N);
    Count := 0;
    for i := 1 to N do
    begin
        if F[i] = 0 then
            F[i] := 1;
        while true do
        begin
            Read(T);
            if T = 0 then
                Break;
            if F[T] = 0 then
                F[T] := 1 + Ord(F[i] = 1);
        end;
        Readln;
        if F[i] = 1 then
            Inc(Count);
    end;
    Writeln(Count);
    for i := 1 to N do
        if F[i] = 1 then
            Write(i, ' ');
end;
begin
    Main;
end.

