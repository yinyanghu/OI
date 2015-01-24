program Ural_1008(Input, Output);
const
    MaxN = 11;
    WayName: array[1..4] of Char = ('R', 'T', 'L', 'B');
    WayGo: array[1..4] of array[1..2] of Integer
    = ((1, 0), (0, 1), (-1, 0), (0, -1));
    MaxValue = 255;
type
    TIndex = Byte;
    TPoint = record
        X, Y: TIndex;
    end;
    TMap = array[0..MaxN, 0..MaxN] of Boolean;
    TOpenList = array[1..MaxN * MaxN] of TPoint;
var
    N: TIndex;
    Map: TMap;
    Open: TOpenList;

procedure ChangeOneToTwo;
var
    i: TIndex;
    CurrentPtr, ExpandPtr: TIndex;
    MinP, TmpP: TPoint;
begin
    FillChar(Map, SizeOf(Map), false);
    FillChar(Open, SizeOf(Open), 0);
    MinP.X := MaxValue;
    MinP.Y := MaxValue;
    for i := 1 to N do
    begin
        Readln(TmpP.X, TmpP.Y);
        Map[TmpP.X, TmpP.Y] := true;
        if (TmpP.X < MinP.X) or ((TmpP.X = MinP.X) and (TmpP.Y < MinP.Y)) then
            MinP := TmpP;
    end;
    Writeln(MinP.X, ' ', MinP.Y);
    CurrentPtr := 0;
    ExpandPtr := 1;
    Open[ExpandPtr] := MinP;
    Map[MinP.X, MinP.Y] := false;
    while CurrentPtr < N do
    begin
        Inc(CurrentPtr);
        for i := 1 to 4 do
        begin
            TmpP.X := Open[CurrentPtr].X + WayGo[i][1];
            TmpP.Y := Open[CurrentPtr].Y + WayGo[i][2];
            if Map[TmpP.X, TmpP.Y] then
            begin
                Map[TmpP.X, TmpP.Y] := false;
                Inc(ExpandPtr);
                Open[ExpandPtr] := TmpP;
                Write(WayName[i]);
            end;
        end;
        if CurrentPtr = N then
            Writeln('.')
        else
            Writeln(',');
    end;
end;

procedure ChangeTwoToOne(StartP: TPoint);
var
    i, j: TIndex;
    CurrentPtr, ExpandPtr, LocalWay: TIndex;
    TmpP: TPoint;
    St: string;
begin
    FillChar(Map, SizeOf(Map), false);
    FillChar(Open, SizeOf(Open), 0);
    CurrentPtr := 0;
    ExpandPtr := 1;
    Open[ExpandPtr] := StartP;
    Map[StartP.X, StartP.Y] := true;
    while true do
    begin
        Readln(St);
        Inc(CurrentPtr);
        for i := 1 to Length(St) - 1 do
        begin
            for j := 1 to 4 do
                if St[i] = WayName[j] then
                begin
                    LocalWay := j;
                    Break;
                end;
            TmpP.X := Open[CurrentPtr].X + WayGo[LocalWay][1];
            TmpP.Y := Open[CurrentPtr].Y + WayGo[LocalWay][2];
            if (TmpP.X > 0) and (TmpP.Y > 0) then
            begin
                Inc(ExpandPtr);
                Open[ExpandPtr] := TmpP;
                Map[TmpP.X, TmpP.Y] := true;
            end;
        end;
        if St[Length(St)] = '.' then
            Break;
    end;
    Writeln(ExpandPtr);
    for i := 1 to MaxN do
        for j := 1 to MaxN do
            if Map[i, j] then
                Writeln(i, ' ', j);
end;

procedure Main;
var
    TmpP: TPoint;
    St: string;
    Code: Integer;
begin
    Readln(St);
    if Pos(' ', St) = 0 then
    begin
        Val(St, N, Code);
        ChangeOneToTwo;
    end
    else
    begin
        Val(Copy(St, 1, Pos(' ', St) - 1), TmpP.X, Code);
        Delete(St, 1, Pos(' ', St));
        Val(Copy(St, 1, Length(St)), TmpP.Y, Code);
        ChangeTwoToOne(TmpP);
    end;
end;

begin
    Main;
end.

