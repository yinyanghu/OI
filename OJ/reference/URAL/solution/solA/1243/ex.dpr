program Ural_1243(Input, Output);
const
    MaxLen = 50;
type
    TIndex = Byte;

procedure HighModSeven;
var
    St: string;
    i, Remnant: TIndex;
begin
    Readln(St);
    Remnant := 0;
    for i := 1 to Length(St) do
        Remnant := (Remnant * 10 + Ord(St[i]) - Ord('0')) mod 7;
    Writeln(Remnant);
end;

begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    HighModSeven;
    {Close(Input);
    Close(Output);}
end.

