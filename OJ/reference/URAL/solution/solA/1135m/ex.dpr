program Ural_1135(Input, Output);
type
    TIndex = Longint;
var
    S, R: TIndex;
    Ch: Char;
begin
    S := 0;
    R := 0;
    while not Eof do
    begin
        Read(Ch);
        if Ch = '<' then
            Inc(S, R)
        else if Ch = '>' then
            Inc(R);
    end;
    Writeln(S);
end.

