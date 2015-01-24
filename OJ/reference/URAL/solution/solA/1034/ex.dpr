program Ural_1034(Input, Output);
const
    MaxN = 50;
type
    TIndex = Integer;
    TPoint = record
        X, Y: TIndex;
    end;
    TPoints = array[1..MaxN] of TPoint;
    TCheck = array[-2 * MaxN - 1..2 * MaxN + 1] of Byte;
var
    Count: Longint;
    P: TPoints;
    N: TIndex;

function Passed(T: TCheck): Boolean;
var
    i: TIndex;
begin
    Passed := true;
    for i := -2 * N - 1 to 2 * N + 1 do
        if T[i] > 1 then
        begin
            Passed := false;
            Exit;
        end;
end;

procedure Main;
var
    i, j, k, yi, yj, yk: TIndex;
    HX, HY, HH, HV: TCheck;
    THX, THY, THH, THV: TCheck;
begin
    FillChar(HX, SizeOf(HX), 0);
    FillChar(HY, SizeOf(HY), 0);
    FillChar(HH, SizeOf(HH), 0);
    FillChar(HV, SizeOf(HV), 0);
    Count := 0;
    Readln(N);
    for i := 1 to N do
    begin
        Readln(P[i].X, P[i].Y);
        Inc(HX[P[i].X]);
        Inc(HY[P[i].Y]);
        Inc(HH[P[i].X - P[i].Y]);
        Inc(HV[P[i].X + P[i].Y]);
    end;
    if Passed(HX) then
        for i := 1 to N - 2 do
            for j := i + 1 to N - 1 do
                for k := j + 1 to N do
                begin
                    THY := HY;
                    Dec(THY[P[i].Y]);
                    Dec(THY[P[j].Y]);
                    Dec(THY[P[k].Y]);
                    if not Passed(THY) then Continue;
                    THH := HH;
                    Dec(THH[P[i].X - P[i].Y]);
                    Dec(THH[P[j].X - P[j].Y]);
                    Dec(THH[P[k].X - P[k].Y]);
                    if not Passed(THH) then Continue;
                    THV := HV;
                    Dec(THV[P[i].X + P[i].Y]);
                    Dec(THV[P[j].X + P[j].Y]);
                    Dec(THV[P[k].X + P[k].Y]);
                    if not Passed(THV) then Continue;
                    for yi := 1 to N do
                        if (yi <> P[i].Y) and (THY[yi] = 0) and (THH[P[i].X - yi] = 0)
                            and (THV[P[i].X + yi] = 0) then
                        begin
                            Inc(THY[yi]);
                            Inc(THH[P[i].X - yi]);
                            Inc(THV[P[i].X + yi]);
                            for yj := 1 to N do
                                if (yj <> P[j].Y) and (THY[yj] = 0) and (THH[P[j].X - yj] = 0)
                                    and (THV[P[j].X + yj] = 0) then
                                begin
                                    Inc(THY[yj]);
                                    Inc(THH[P[j].X - yj]);
                                    Inc(THV[P[j].X + yj]);
                                    for yk := 1 to N do
                                        if (yk <> P[k].Y) and (THY[yk] = 0) and (THH[P[k].X - yk] = 0)
                                            and (THV[P[k].X + yk] = 0) then
                                        begin
                                            Inc(THY[yk]);
                                            Inc(THH[P[k].X - yk]);
                                            Inc(THV[P[k].X + yk]);
                                            if Passed(THY) and Passed(THH) and Passed(THV) then
                                                Inc(Count);
                                            Dec(THY[yk]);
                                            Dec(THH[P[k].X - yk]);
                                            Dec(THV[P[k].X + yk]);
                                        end;
                                    Dec(THY[yj]);
                                    Dec(THH[P[j].X - yj]);
                                    Dec(THV[P[j].X + yj]);
                                end;
                            Dec(THY[yi]);
                            Dec(THH[P[i].X - yi]);
                            Dec(THV[P[i].X + yi]);
                        end;
                end;
    Writeln(Count);
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);       }
    Main;
    {   Close(Input);
       Close(Output);  }
end.

