program Ural_1038(Input, Output);
var
    State: Byte; //0:Sentence End,1:In A Word,2:Else
    Error: Integer;
    Ch: Char;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    State := 0;
    Error := 0;
    while not Eof do
    begin
        Read(Ch);
        case State of
            0:
                begin
                    if Ch in ['a'..'z'] then
                        Inc(Error);
                    if Ch in ['A'..'Z', 'a'..'z'] then
                        State := 1;
                end;
            1:
                begin
                    if Ch in ['A'..'Z'] then
                        Inc(Error);
                    if not (Ch in ['A'..'Z', 'a'..'z']) then
                        if Ch in ['.', '!', '?'] then
                            State := 0
                        else
                            State := 2;
                end;
            2:
                begin
                    if Ch in ['A'..'Z', 'a'..'z'] then
                        State := 1;
                    if Ch in ['.', '!', '?'] then
                        State := 0;
                end;
        end;
    end;
    Writeln(Error);
    {Close(Input);
    Close(Output);  }
end.

