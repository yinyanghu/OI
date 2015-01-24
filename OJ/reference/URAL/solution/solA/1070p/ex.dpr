{$N+}
program Ural_1070(Input, Output);
type
    TIndex = Longint;

function GetNum: TIndex;
var
    Res: TIndex;
    Ch: Char;
    HasNum: Boolean;
begin
    HasNum := false;
    Res := 0;
    while not Eof do
    begin
        Read(Ch);
        if Ch in ['0'..'9'] then
        begin
            Res := Res * 10 + Ord(Ch) - Ord('0');
            HasNum := true;
        end
        else if HasNum then
            Break;
    end;
    GetNum := Res;
end;

procedure Main;
var
    T, Ts, Tt, Dl, Dh, Differ: TIndex;
begin
    Ts := GetNum * 60 + GetNum;
    Tt := GetNum * 60 + GetNum;
    if Ts > Tt then Tt := Tt + 24 * 60;
    Dl := Tt - Ts;
    Ts := GetNum * 60 + GetNum;
    Tt := GetNum * 60 + GetNum;
    if Ts > Tt then Tt := Tt + 24 * 60;
    Dh := Tt - Ts;
    if Dl > Dh then
    begin
        T := Dl;
        Dl := Dh;
        Dh := T;
    end;
    for Differ := 0 to 23 do
        if Dh - Differ * 60 > 0 then
            if Abs((Dl + Differ * 60) - (Dh - Differ * 60)) <= 10 then
            begin
                if Differ > 5 then
                    Writeln(12 - Differ)      //
                else
                    Writeln(Differ);
                Break;
            end;
end;
begin
    {  Assign(Input, 'i.txt');
         Reset(Input);
         Assign(Output, 'o.txt');
         Rewrite(Output);      }
    Main;
    {  Close(Input);
       Close(Output);     }
end.

