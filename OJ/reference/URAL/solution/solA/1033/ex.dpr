program Ural_1033(Input, Output);
const
    MaxN = 33;
    Way: array[1..4] of array[1..2] of Integer =
    ((1, 0), (0, 1), (-1, 0), (0, -1));
type
    TIndex = Byte;
    TCount = Integer;
    TMap = array[0..MaxN + 1, 0..MaxN + 1] of Byte;
    //0:wall,1:empty,2:visited
var
    N: TIndex;
    WallNum: TCount;
    G: TMap;

procedure DFS(X, Y: TIndex);
var
    i: TIndex;
begin
    G[X, Y] := 2;
    for i := 1 to 4 do
        if G[X + Way[i][1], Y + Way[i][2]] = 1 then
            DFS(X + Way[i][1], Y + Way[i][2])
        else if G[X + Way[i][1], Y + Way[i][2]] = 0 then
            Inc(WallNum);
end;

procedure Main;
var
    i, j: TIndex;
    St: string;
begin
    FillChar(G, SizeOf(G), 0);
    Readln(N);
    for i := 1 to N do
    begin
        Readln(St);
        for j := 1 to N do
            G[i, j] := Ord(St[j] = '.');
    end;
    WallNum := 0;
    if G[1, 1] = 1 then
        DFS(1, 1);
    if G[N, N] = 1 then
        DFS(N, N);
    WallNum := WallNum - 2 * Ord(G[1, 1] = 2) - 2 * Ord(G[N, N] = 2);
    Writeln(WallNum * 9);
end;
begin
    Main;
end.

