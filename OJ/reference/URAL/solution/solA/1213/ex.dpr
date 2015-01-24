program Ural_1213(Input, Output);
const
    MaxN = 30;
type
    TIndex = Longint;
    TRoomName = array[1..MaxN] of string;
var
    N: TIndex;
    RoomName: TRoomName;

function IsExist(St: string): Boolean;
var
    i: TIndex;
begin
    IsExist := false;
    for i := 1 to N do
        if St = RoomName[i] then
        begin
            IsExist := true;
            Break;
        end;
end;

procedure AddName(St: string);
begin
    Inc(N);
    RoomName[N] := St;
end;

procedure Main;
var
    St, Name: string;
begin
    N := 0;
    Readln(St);
    AddName(St);
    repeat
        Readln(St);
        if St = '#' then
            Break;
        Name := Copy(St, 1, Pos('-', St) - 1);
        if not IsExist(Name) then
            AddName(Name);
        Delete(St, 1, Pos('-', St));
        Name := St;
        if not IsExist(Name) then
            AddName(Name);
    until false;
    Writeln(N - 1);
end;
begin
    Main;
end.

