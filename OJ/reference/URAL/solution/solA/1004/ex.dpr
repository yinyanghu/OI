//        18:41  19:08
program Ural_1004(Input, Output);
const
    MaxN = 100;
    MaxValue = MaxLongint div 4;
type
    TIndex = Longint;
    TData = Longint;
    TGraph = array[1..MaxN, 1..MaxN] of TData;
    TPath = array[1..MaxN] of record
        Dist: TData; // Distance
        Pred: TIndex; // Predecessor
        Len: TIndex; //Number of Vextex for S to current
        Checked: Boolean;
    end;
var
    G: TGraph;
    D, P: TPath;
    N, M: TIndex;
    MinL: TData;
    MinLTInd: TIndex;

procedure PrintPath(i: TIndex);
begin
    if P[i].Pred = 0 then
        Write(i)
    else
    begin
        PrintPath(P[i].Pred);
        Write(' ', i);
    end;
end;

function Dijkstra(S, T: TIndex): Boolean;
var
    i: TIndex;
    Min: TData;
    MinInd: TIndex;
begin
    Dijkstra := false;
    for i := 1 to N do
    begin
        D[i].Dist := G[S, i];
        D[i].Pred := S;
        D[i].Len := 2;
        D[i].Checked := false;
    end;
    D[S].Dist := 0;
    D[S].Pred := 0;
    D[S].Len := 1;
    D[S].Checked := true;
    while not D[T].Checked do
    begin
        Min := MaxValue;
        MinInd := 0;
        for i := 1 to N do
            if (not D[i].Checked) and (D[i].Dist < Min) then
            begin
                Min := D[i].Dist;
                MinInd := i;
            end;
        if MinInd = 0 then Break;
        if D[MinInd].Dist > MinL then Exit;  //Important Cutting!! Or TLE!
        D[MinInd].Checked := true;
        for i := 1 to N do
            if (not D[i].Checked) and (G[MinInd, i] < MaxValue)
                and (D[i].Dist > D[MinInd].Dist + G[MinInd, i]) then
            begin
                D[i].Dist := D[MinInd].Dist + G[MinInd, i];
                D[i].Pred := MinInd;
                D[i].Len := D[MinInd].Len + 1;
            end;
    end;
    Dijkstra := ((D[T].Len > 2) and (D[T].Dist < MaxValue));
end;

procedure Main;
var
    i, j: TIndex;
    L: TData;
begin
    while true do
    begin
        Read(N);
        if N = -1 then Break;
        for i := 1 to N do
            for j := 1 to N do
                G[i, j] := MaxValue;
        Readln(M);
        while M > 0 do
        begin
            Dec(M);
            Readln(i, j, L);
            if L < G[i, j] then
            begin
                G[i, j] := L;
                G[j, i] := G[i, j];
            end;
        end;
        MinL := MaxValue;
        MinLTInd := 0;
        for i := 1 to N - 1 do
            for j := i + 1 to N do
                if G[i, j] < MaxValue then
                begin
                    L := G[i, j];
                    G[i, j] := MaxValue;
                    G[j, i] := MaxValue;
                    if Dijkstra(i, j) then
                        if D[j].Dist + L < MinL then
                        begin
                            MinL := D[j].Dist + L;
                            MinLTInd := j;
                            P := D;
                        end;
                    G[i, j] := L;
                    G[j, i] := L;
                end;
        if MinLTInd = 0 then
            Writeln('No solution.')
        else
        begin
            PrintPath(MinLTInd);
            Writeln;
        end;
    end;
end;
begin
    {  Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o.txt');
        Rewrite(Output);        }
    Main;
    {   Close(Input);
        Close(Output);}
end.

