{
	Memory: O(N)
}
program Ural_1027(Input, Output);
const
    ValidCharSet = ['0'..'9', '=', '+', '-', '*', '/', '(', ')', #13, #10];
    MaxLen = 10000;
type
    TIndex = Longint;
    TChar = array[1..MaxLen + 1] of Char;

procedure Main;
var
    D: TChar;
    i, Len: TIndex;
    Bracket: TIndex;
    Comment: Boolean;
begin
    Len := 0;
    while not Eof do
    begin
        Inc(Len);
        Read(D[Len]);
    end;
    Bracket := 0;
    Comment := false;
    i := 0;
    D[Len + 1] := #0;//Buffer
    while i < Len do
    begin
        Inc(i);
        if (D[i] = '(') and (D[i + 1] = '*') and (not Comment) then
        begin
            Comment := true;
            Inc(i);
            Continue;
        end;
        if (D[i] = '*') and (D[i + 1] = ')') and (Comment) then
        begin
            Comment := false;
            Inc(i);
            Continue;
        end;
        if not Comment then
        begin
            if Bracket > 0 then
                if not (D[i] in ValidCharSet) then
                begin
                    Writeln('NO');
                    Exit;
                end;
            if D[i] = '(' then
                Inc(Bracket);
            if D[i] = ')' then
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
     Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o2.txt');
     Rewrite(Output);    
    Main;
     Close(Input);
     Close(Output); 
end.

