program Ural_1052(Input, Output);
const
    MaxN = 200;
type
    TIndex = Byte;
    TCoordinate = Integer;
    TPoint = record
        x, y: TCoordinate;
    end;
    TPoint_Arr = array[1..MaxN] of TPoint;
var
    i, j, k, N, Max, Count: TIndex;
    P: TPoint_Arr;

function SameLine(const A, B, C: TPoint): Boolean;
begin
    SameLine := ((B.x - A.x) * (C.y - A.y) - (C.x - A.x) * (B.y - A.y) = 0);
end;

begin
    {    Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o.txt');
        Rewrite(Output); }
    Readln(N);
    Max := 0;
    for i := 1 to N do
        Readln(P[i].x, P[i].y);
    for i := 1 to N - 1 do
        for j := i + 1 to N do
        begin
            Count := 0;
            for k := 1 to N do
                if SameLine(P[i], P[j], P[k]) then
                    Inc(Count);
            if Count > Max then
                Max := Count;
        end;
    Writeln(Max);
    {   Close(Input);
       Close(Output);}
end.

