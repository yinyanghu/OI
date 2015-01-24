{
The initial value of MaxDigit must be 1
because (div (1-1)) is not valid.
about "No solution." notice the full stop.
}
program Ural_1104(Input, Output);
type
    TIndex = Longint;
    TValue = array[2..36] of Byte;
var
    D, MaxDigit: TIndex;
    S: TValue;

procedure Main;
var
    i: TIndex;
    Ch: Char;
begin
    FillChar(S, SizeOf(S), 0);
    MaxDigit := 1;
    while not Eof do
    begin
        Read(Ch);
        if Ch in ['A'..'Z', '0'..'9'] then
        begin
            if Ch in ['A'..'Z'] then
                D := Ord(Ch) - Ord('A') + 10;
            if Ch in ['0'..'9'] then
                D := Ord(Ch) - Ord('0');
            if MaxDigit < D then
                MaxDigit := D;
            for i := MaxDigit + 1 to 36 do
                S[i] := (S[i] + D) mod (i - 1);
        end;
    end;
    for i := MaxDigit + 1 to 36 do
        if S[i] = 0 then
        begin
            Writeln(i);
            Exit;
        end;
    Writeln('No solution.');
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
    {Close(Input);
    Close(Output);   }
end.

