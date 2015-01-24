program Ural_1016(Input, Output);
const
    //chessboard at first quadrant
    //Up,Down,Left,Right
    Direct: array[1..4] of array[1..6] of Shortint = (
        (6, 5, 3, 4, 1, 2),
        (5, 6, 3, 4, 2, 1),
        (1, 2, 5, 6, 4, 3),
        (1, 2, 6, 5, 3, 4));
    DirectX: array[1..4] of Shortint = (0, 0, -1, 1);
    DirectY: array[1..4] of Shortint = (1, -1, 0, 0);
    CubeTypeNum = 24;
    //forward, backward, left, right, top, bottom
    CubeType: array[1..CubeTypeNum] of array[1..6] of Shortint = (
        (1, 2, 3, 4, 5, 6),
        (1, 2, 5, 6, 4, 3),
        (1, 2, 4, 3, 6, 5),
        (1, 2, 6, 5, 3, 4),

        (2, 1, 4, 3, 5, 6),
        (2, 1, 5, 6, 3, 4),
        (2, 1, 3, 4, 6, 5),
        (2, 1, 6, 5, 4, 3),

        (3, 4, 2, 1, 5, 6),
        (3, 4, 5, 6, 1, 2),
        (3, 4, 1, 2, 6, 5),
        (3, 4, 6, 5, 2, 1),

        (4, 3, 1, 2, 5, 6),
        (4, 3, 5, 6, 2, 1),
        (4, 3, 2, 1, 6, 5),
        (4, 3, 6, 5, 1, 2),

        (5, 6, 1, 2, 3, 4),
        (5, 6, 3, 4, 2, 1),
        (5, 6, 2, 1, 4, 3),
        (5, 6, 4, 3, 1, 2),

        (6, 5, 2, 1, 3, 4),
        (6, 5, 3, 4, 1, 2),
        (6, 5, 1, 2, 4, 3),
        (6, 5, 4, 3, 2, 1)
        );
    MaxN = 8;
    MaxValue = MaxLongint div 1024;
type
    TIndex = Longint;
    TPoint = record
        X, Y, T: TIndex;
    end;
    TNode = array[1..MaxN, 1..MaxN, 1..CubeTypeNum] of record
        Distance: TIndex;
        Checked: Boolean;
        Last: TPoint;
    end;
    TCube = array[1..6] of TIndex;
var
    D: TNode;
    S, T: TPoint;
    Cube: TCube;

function Change(i: TIndex; tmp: TPoint; var res: TPoint): Boolean;
var
    NewC: TCube;       //CE 1 times, "New" in FreePascal is a reserved word
    j, k: TIndex;
    Valid: Boolean;
begin
    Change := false;
    if (tmp.X + DirectX[i] < 1) or (tmp.X + DirectX[i] > MaxN)
        or (tmp.Y + DirectY[i] < 1) or (tmp.Y + DirectY[i] > MaxN) then
        Exit;
    Change := true;
    res.X := tmp.X + DirectX[i];
    res.Y := tmp.Y + DirectY[i];
    for j := 1 to 6 do
        NewC[j] := CubeType[tmp.T][Direct[i][j]];
    for j := 1 to CubeTypeNum do
    begin
        Valid := true;
        for k := 1 to 6 do
            Valid := Valid and (CubeType[j][k] = NewC[k]);
        if Valid then
        begin
            res.T := j;
            Exit;
        end;
    end;
end;

function GetBottomValue(tmp: TPoint): TIndex;
begin
    GetBottomValue := Cube[CubeType[tmp.T][6]];
end;

function AllFinished: Boolean;
var
    i: TIndex;
begin
    AllFinished := false;
    for i := 1 to CubeTypeNum do
        if not D[T.X, T.Y, i].Checked then Exit;
    AllFinished := true;
end;

procedure Dijkstra;
var
    MinIndex, F, tmp: TPoint;
    i, j, k: TIndex;
    Min: TIndex;
begin
    for i := 1 to MaxN do
        for j := 1 to MaxN do
            for k := 1 to CubeTypeNum do
            begin
                D[i, j, k].Checked := false;
                D[i, j, k].Distance := MaxValue;
                FillChar(D[i, j, k].Last, SizeOf(D[i, j, k].Last), 0);
            end;
    D[S.X, S.Y, S.T].Checked := true;
    D[S.X, S.Y, S.T].Distance := GetBottomValue(S);
    F := S;
    while not AllFinished do
    begin
        for i := 1 to 4 do
            if Change(i, F, tmp) then
                if not D[tmp.X, tmp.Y, tmp.T].Checked then
                    if D[F.X, F.Y, F.T].Distance + GetBottomValue(tmp) < D[tmp.X, tmp.Y, tmp.T].Distance then
                    begin
                        D[tmp.X, tmp.Y, tmp.T].Distance := D[F.X, F.Y, F.T].Distance + GetBottomValue(tmp);
                        D[tmp.X, tmp.Y, tmp.T].Last := F;
                    end;
        FillChar(MinIndex, SizeOf(MinIndex), 0);
        Min := MaxValue;
        for i := 1 to MaxN do
            for j := 1 to MaxN do
                for k := 1 to CubeTypeNum do
                    if not D[i, j, k].Checked then
                        if D[i, j, k].Distance < Min then
                        begin
                            Min := D[i, j, k].Distance;
                            MinIndex.X := i;
                            MinIndex.Y := j;
                            MinIndex.T := k;
                        end;
        if (MinIndex.X = 0) or (MinIndex.Y = 0) or (MinIndex.T = 0) then Break;
        F := MinIndex;
        D[MinIndex.X, MinIndex.Y, MinIndex.T].Checked := true;
    end;
    Min := MaxValue;
    for i := 1 to CubeTypeNum do
        if D[T.X, T.Y, i].Checked then
            if D[T.X, T.Y, i].Distance < Min then
            begin
                T.T := i;
                Min := D[T.X, T.Y, i].Distance;
            end;
end;

procedure Print(P: TPoint);
begin
    if (P.X = 0) or (P.Y = 0) or (P.T = 0) then Exit;
    Print(D[P.X, P.Y, P.T].Last);
    Write(' ', Chr(P.X + Ord('a') - 1), Chr(P.Y + Ord('0')));
end;

procedure Init;
var
    Ch: Char;
begin
    repeat
        Read(Ch);
    until Ch in ['a'..'h'];
    S.X := Ord(Ch) - Ord('a') + 1;
    repeat
        Read(Ch);
    until Ch in ['1'..'8'];
    S.Y := Ord(Ch) - Ord('0');
    S.T := 1; //standard

    repeat
        Read(Ch);
    until Ch in ['a'..'h'];
    T.X := Ord(Ch) - Ord('a') + 1;
    repeat
        Read(Ch);
    until Ch in ['1'..'8'];
    T.Y := Ord(Ch) - Ord('0');
    //T.T is result

    Readln(Cube[1], Cube[2], Cube[5], Cube[4], Cube[6], Cube[3]);
end;

procedure Main;
begin
    Init;
    Dijkstra;
    Write(D[T.X, T.Y, T.T].Distance);
    Print(T);
    Writeln;
end;
begin
    {    Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o.txt');
        Rewrite(Output);    }
    Main;
    { Close(Input);
     Close(Output); }
end.

