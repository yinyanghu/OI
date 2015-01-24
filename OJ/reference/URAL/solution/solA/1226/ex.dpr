program Ural_1226(Input, Output);
type
    TIndex = Byte;
var
    i: TIndex;
    St, R: string;
begin
    while not eof do
    begin
        Readln(St);
        R := '';
        for i := 1 to Length(St) do
            if St[i] in ['A'..'Z', 'a'..'z'] then
                R := St[i] + R
            else
            begin
                Write(R, St[i]);
                R := '';
            end;
        Writeln(R);
    end;
end.

