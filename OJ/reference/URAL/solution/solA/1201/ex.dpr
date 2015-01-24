program Ural_1201(Input, Output);
const
    MonthDays: array[1..12] of Byte = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    WeekName: array[1..7] of string[3] = ('mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun');
type
    TIndex = Longint;
    TWeeks = array[1..7] of string;
var
    St: TWeeks;

function IsLeap(X: TIndex): Boolean;
begin
    if X mod 100 = 0 then
        IsLeap := (X mod 400 = 0)
    else
        IsLeap := (X mod 4 = 0);
end;

function GetWeek(X: TIndex): TIndex;
begin
    X := X mod 7;
    if X = 0 then X := 7;
    GetWeek := X;
end;

procedure Main;
var
    i, j: TIndex;
    Sum: TIndex;
    DYear, DMonth, DDay: TIndex;
    tmp: string;
begin
    Readln(DDay, DMonth, DYear);
    Sum := 0;
    for i := 1 to DYear - 1 do
        Inc(Sum, 365 + Ord(IsLeap(i)));
    for i := 1 to DMonth - 1 do
        Inc(Sum, MonthDays[i] + Ord((i = 2) and IsLeap(DYear)));
    Inc(Sum); {1st}
    Sum := GetWeek(Sum);
    tmp := '     ';
    for i := 1 to Sum - 1 do
        St[i] := St[i] + tmp;
    for i := 1 to MonthDays[DMonth] + Ord((DMonth = 2) and IsLeap(DYear)) do
    begin
        j := GetWeek(Sum + i - 1);
        if i = DDay then
        begin
            Str(i: 2, tmp);
            St[j] := St[j] + '  [' + tmp + ']';
        end
        else
        begin
            Str(i: 5, tmp);
            St[j] := St[j] + tmp;
        end;
    end;
    for i := 1 to 7 do
    begin
        Delete(St[i], 1, 1);
        Insert(WeekName[i], St[i], 1);
        if Pos(']', St[i]) > 0 then
            if Pos(']', St[i]) <> Length(St[i]) then
                Delete(St[i], Pos(']', St[i]) + 1, 1);
        Writeln(St[i]);
    end;
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
  {  Close(Input);
    Close(Output);   }
end.

