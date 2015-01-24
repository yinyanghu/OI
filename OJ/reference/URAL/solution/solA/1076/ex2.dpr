program Ural_1076(Input, Output);
const
    MaxN = 150+1;
    MaxNode = MaxN * 2 + 2;
    MaxEdge = (MaxN * MaxN +2 * MaxN) * 2;
    MaxValue = 32000;
type
    TIndex = Longint;
    TEdge = record
        Head, Tail, Cost:SmallInt;
	Capa, Flow:ShortInt;
	Index,Reverse:Word;
        Dirc: Boolean;
    end;
    TEdgeSet = array[1..MaxEdge] of TEdge;
    TEdgeFlag = array[0..MaxNode] of TIndex;
    TDistance = array[1..MaxNode] of TIndex;
    TThrough = array[1..MaxNode] of TIndex;
var
    NodeNum, EdgeNum: TIndex;
    Start, Termin: TIndex;
    Edge: TEdgeSet;
    H: TEdgeFlag;
    Dist: Tdistance;
    Through: TThrough;
    Total: TIndex;

function Compare(EA, EB: TEdge): TIndex;
var
    Res: TIndex;
begin
    Res := EA.Head - EB.Head;
    if Res = 0 then
        Res := EA.Tail - EB.Tail;
    if Res = 0 then
        Res := EA.Index - EB.Index;
    Compare := Res;
end;

procedure QuickSort(l, r: TIndex);
var
    i, j: TIndex;
    Mid, Tmp: TEdge;
begin
    i := l;
    j := r;
    Mid := Edge[(i + j) div 2];
    repeat
        while Compare(Edge[i], Mid) < 0 do
            Inc(i);
        while Compare(Mid, Edge[j]) < 0 do
            Dec(j);
        if i <= j then
        begin
            Tmp := Edge[i];
            Edge[i] := Edge[j];
            Edge[j] := Tmp;
            Inc(i);
            Dec(j);
        end;
    until i > j;
    if l < j then
        QuickSort(l, j);
    if i < r then
        QuickSort(i, r);
end;

function BinarySearch(Left, Right: TIndex; Key: TEdge): TIndex;
var
    Mid, Res: TIndex;
begin
    while Left <= Right do
    begin
        Mid := (Left + Right) div 2;
        Res := Compare(Edge[Mid], Key);
        if Res < 0 then
            Left := Mid + 1
        else if Res > 0 then
            Right := Mid - 1
        else
            Break;
    end;
    BinarySearch := (Left + Right) div 2;
end;

procedure InsertEdge(Head, Tail, Capa, Cost, Index: TIndex; Dirc: Boolean);
begin
    Inc(EdgeNum);
    Edge[EdgeNum].Head := Head;
    Edge[EdgeNum].Tail := Tail;
    Edge[EdgeNum].Capa := Capa;
    Edge[EdgeNum].Cost := Cost;
    Edge[EdgeNum].Flow := 0;
    Edge[EdgeNum].Index := Index;
    Edge[EdgeNum].Reverse := 0;
    Edge[EdgeNum].Dirc := Dirc;
    if Dirc then
        InsertEdge(Tail, Head, Capa, -Cost, Index, false);
end;

procedure Build_Network;
var
    i, j: TIndex;
    Len: TIndex;
    N: TIndex;
    Key: TEdge;
begin
    Readln(N);
    NodeNum := 2 * N + 2;
    Start := 1;
    Termin := 2 * N + 2;
    EdgeNum := 0;
    for i := 1 to N do
        for j := 1 to N do
        begin
            Read(Len);
            InsertEdge(i + 1, j + N + 1, 1, Len, (i - 1) * N + j, true);
            Inc(Total, Len);
        end;
    for i := 1 to N do
        InsertEdge(Start, i + 1, 1, 0, N * N + i, true);
    for i := 1 to N do
        InsertEdge(i + N + 1, Termin, 1, 0, N * N + N + i, true);

    QuickSort(1, EdgeNum);

    j := 0;
    H[0] := 0;
    for i := 1 to NodeNum do
    begin
        while (j + 1 <= EdgeNum) and (Edge[j + 1].Head = i) do
            Inc(j);
        H[i] := j;
    end;

    for i := 1 to EdgeNum do
        with Edge[i] do
            if Reverse = 0 then
            begin
                Key.Head := Tail;
                Key.Tail := Head;
                Key.Index := Index;
                Reverse := BinarySearch(H[Tail - 1] + 1, H[Tail], Key);
                Edge[Reverse].Reverse := i;
            end;
end;

function Bellman_Ford: Boolean;
var
    Times: TIndex;
    i: TIndex;
    Found: Boolean;
begin
    for i := 1 to NodeNum do
    begin
        Dist[i] := -MaxValue;
        Through[i] := -1;
    end;
    Dist[Start] := 0;
    Through[Start] := 0;
    Times := 0;
    repeat
        Inc(Times);
        Found := false;
        for i := 1 to EdgeNum do
            with Edge[i] do
                if ((Dirc and (Flow < Capa)) or (not Dirc and (Flow > 0)))
                    and (Through[Head] > -1) and (Dist[Head] + Cost > Dist[Tail])
                        then
                begin
                    Dist[Tail] := Dist[Head] + Cost;
                    Through[Tail] := i;
                    Found := true;
                end;
    until (Times = NodeNum - 1) or not Found;
    Bellman_Ford := (Through[Termin] > -1);
end;

procedure Ford_Fulkerson;
var
    i, u: TIndex;
begin
    repeat
        if not Bellman_Ford then
            Break;
        u := Termin;
        repeat
            if Through[u] = 0 then
                Break;
            with Edge[Through[u]] do
            begin
                if Dirc then
                begin
                    Inc(Flow);
                    Inc(Edge[Reverse].Flow);
                end
                else
                begin
                    Dec(Flow);
                    Dec(Edge[Reverse].Flow);
                end;
                u := Head;
            end;
        until false;
    until false;
    for i := 1 to EdgeNum do
        if Edge[i].Dirc and (Edge[i].Flow > 0) then
            Dec(Total, Edge[i].Flow * Edge[i].Cost);
    Writeln(Total);
end;

procedure Main;
begin
    Build_Network;
    Ford_Fulkerson;
end;
begin
{$IFNDEF ONLINE_JUDGE}
    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);
{$ENDIF}
    Main;
{$IFNDEF ONLINE_JUDGE}
    Close(Input);
    Close(Output);
{$ENDIF}
end.

