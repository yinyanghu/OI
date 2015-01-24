program Ural_1094(Input, Output);
const
    MaxLineLen = 80;
    ChSet = ['A'..'Z', 'a'..'z', '0'..'9', ':', ';', '-', '!', '?', '.', ',',
        '<', '>', ' '];
type
    TIndex = Integer;
    Strings = array[1..MaxLineLen + 1] of Char;
var
    i: TIndex;
    St: Strings;
    Ch: Char;
begin
    for i := 1 to MaxLineLen do
        St[i] := ' ';
    // note: "a>>" ="a  "!!
    i := 1;
    while not Eof do
    begin
        Read(Ch);
        if Ch in ChSet then
            if Ch = '<' then
            begin
                Dec(i);
                if i = 0 then i := 1;
            end
            else
            begin
                if Ch <> '>' then St[i] := Ch;
                Inc(i);
                if i = MaxLineLen + 1 then i := 1;
            end;
    end;
    for i := 1 to MaxLineLen do
        Write(St[i]);
end.

