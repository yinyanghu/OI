{
	Memory: O(1)
}
program Ural_1027(Input, Output);
const
    ValidCharSet = ['0'..'9', '=', '+', '-', '*', '/', '(', ')', #13, #10];
type
    TIndex = Longint;
    TBuffer = record
        Ch: array[1..2] of Char;
        LowInd: TIndex;
    end;
var
    Buffer: TBuffer;

function GetChar(Index: TIndex): Char;
begin
    with Buffer do
        if Index = LowInd then
            Result := Ch[1]
        else if Index = LowInd + 1 then
            Result := Ch[2]
        else if Eof then
            Result := #0
        else
        begin
            Ch[1] := Ch[2];
            Read(Ch[2]);
            Inc(LowInd);
            Result := Ch[2];
        end;
end;

procedure Main;
var
    i: TIndex;
    Bracket: TIndex;
    Comment: Boolean;
begin
    Buffer.LowInd := -1;
    Bracket := 0;
    Comment := false;
    i := 0;
    GetChar(1);
    while GetChar(i + 1) <> #0 do
    begin
        Inc(i);
        if (GetChar(i) = '(') and (GetChar(i + 1) = '*') and (not Comment) then
        begin
            Comment := true;
            Inc(i);
            Continue;
        end;
        if (GetChar(i) = '*') and (GetChar(i + 1) = ')') and (Comment) then
        begin
            Comment := false;
            Inc(i);
            Continue;
        end;
        if not Comment then
        begin
            if Bracket > 0 then
                if not (GetChar(i) in ValidCharSet) then
                begin
                    Writeln('NO');
                    Exit;
                end;
            if GetChar(i) = '(' then
                Inc(Bracket);
            if GetChar(i) = ')' then
                Dec(Bracket);
            if Bracket < 0 then
            begin
                Writeln('NO');
                Exit;
            end;
        end;
    end;
    if Comment or (Bracket <> 0) then
    begin
        Writeln('NO');
        Exit;
    end;
    Writeln('YES');
end;

begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
    {Close(Input);
    Close(Output);}
end.

