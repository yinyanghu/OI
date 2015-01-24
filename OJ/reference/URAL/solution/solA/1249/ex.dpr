program Ural_1249(Input, Output);
const
    MaxN = 3000;
type
    TIndex = Integer;
    TLine = array[1..MaxN] of TIndex;
var
    N, M: TIndex;
    Judge, Old, Cur: TLine;

procedure Main;
var
    i, j: TIndex;
    Ch: Char;
begin
    Readln(N, M);
    FillChar(Old, SizeOf(Old), 0);
    for i := 1 to N do
    begin
        for j := 1 to M do
        begin
            Read(Ch);
            while not (Ch in ['0'..'1']) do
                Read(Ch);
            Cur[j] := Ord(Ch) - Ord('0');
            Judge[j] := Old[j] + Cur[j];
        end;
        for j := 1 to M - 1 do
            if ((Judge[j] = 2) and (Judge[j + 1] = 1))
                or ((Judge[j] = 1) and (Judge[j + 1] = 2)) then
            begin
                Writeln('No');
                Exit;
            end;
        Old := Cur;
        Readln;
    end;
    Writeln('Yes');
end;
begin
    Main;
end.