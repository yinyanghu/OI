program Ural_1180(Input, Output);
type
    TIndex = Byte;
var
    St: string;
    i, Remnant: TIndex;
begin
    Readln(St);
    Remnant := 0;
    for i := 1 to Length(St) do
        Remnant := (Remnant * 10 + Ord(St[i]) - Ord('0')) mod 3;
    if Remnant > 0 then
    begin
        Writeln(1);
        Writeln(Remnant);
    end
    else
        Writeln(2);
end.


