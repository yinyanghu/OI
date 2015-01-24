program Ural_1164(Input, Output);
type
    TIndex = Longint;
    TCapital = array['A'..'Z'] of TIndex;
var
    F: TCapital;
    N, M: TIndex;

procedure Main;
var
    i: TIndex;
    Ch: Char;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N, M); //P is buffer here never used
    i := 0;
    while not Eof do
    begin
        Read(Ch);
        if Ch in ['A'..'Z'] then
        begin
            Inc(i);
            if i <= N * M then //N lines and M rows
                Inc(F[Ch])
            else //P lines
                Dec(F[Ch]);
        end;
    end;
    for Ch := 'A' to 'Z' do
        for i := 1 to F[Ch] do
            Write(Ch);
    Writeln;
end;

begin
    {    Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o.txt');
        Rewrite(Output);        }
    Main;
    {    Close(Input);
        Close(Output); }
end.

