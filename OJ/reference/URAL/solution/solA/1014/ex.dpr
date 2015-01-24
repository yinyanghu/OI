program Ural_1014(Input, Output);
type
    TIndex = Longint;
var
    i, j, N, K: TIndex;
    St: string;
begin
    Readln(N);
    if N = 0 then
        Writeln(10)
    else if N = 1 then
        Writeln(1)
    else
    begin
        St := '';
        for i := 9 downto 2 do
        begin
            while N mod i = 0 do
            begin
                St := Chr(i + Ord('0')) + St;
                N := N div i;
            end;
        end;
        if N = 1 then
            Writeln(St)
        else
            Writeln(-1);
    end;
end.

