program Ural_1056(Input, Output);
const
    MaxN = 10000;
    MaxValue = MaxLongint div 4;
    Weight = 1;
type
    TIndex = Longint;
    TTree = array[1..MaxN] of record
        FirstChild, SecondChild, Parent: TIndex;
        ToParent, FirstValue, SecondValue: TIndex;
        Farthest: TIndex;
    end;
    TEdge = record
        X, Y: TIndex;
    end;
    TEdgeSet = array[1..MaxN * 2 - 2 + 1] of TEdge;
    THashSplit = array[0..MaxN] of TIndex;
    TQueue = array[1..MaxN] of TIndex;
    THashQueue = array[1..MaxN] of Boolean;
var
    N: TIndex;
    Tree: TTree;
    Edges: TEdgeSet;
    Split: THashSplit;
    Hash: THashQueue;
    Queue: TQueue;
    QueueLen: TIndex;

procedure Update(Node, Child: TIndex; Value: TIndex);
begin
    if Value > Tree[Node].FirstValue then
    begin
        Tree[Node].SecondChild := Tree[Node].FirstChild;
        Tree[Node].SecondValue := Tree[Node].FirstValue;
        Tree[Node].FirstChild := Child;
        Tree[Node].FirstValue := Value;
    end
    else if Value > Tree[Node].SecondValue then
    begin
        Tree[Node].SecondChild := Child;
        Tree[Node].SecondValue := Value;
    end;
end;

procedure PreOrder(Node: TIndex);
var
    i: TIndex;
begin
    Hash[Node] := true;
    Inc(QueueLen);
    Queue[QueueLen] := Node;
    with Tree[Node] do
    begin
        FirstChild := 0;
        SecondChild := 0;
        FirstValue := 0;
        SecondValue := 0;
    end;
    for i := Split[Node - 1] + 1 to Split[Node] do
        if not Hash[Edges[i].Y] then
            with Edges[i] do
            begin
                PreOrder(Y);
                Update(X, Y, Tree[Y].FirstValue + Weight);
                Tree[Y].ToParent := Weight;
                Tree[Y].Parent := X;
            end;
end;

procedure QuickSort(l, r: TIndex);
var
    i, j: TIndex;
    Mid, Tmp: TEdge;
begin
    i := l;
    j := r;
    Mid := Edges[(i + j) div 2];
    repeat
        while Edges[i].X < Mid.X do
            Inc(i);
        while Mid.X < Edges[j].X do
            Dec(j);
        if i <= j then
        begin
            Tmp := Edges[i];
            Edges[i] := Edges[j];
            Edges[j] := Tmp;
            Inc(i);
            Dec(j);
        end;
    until i > j;
    if l < j then QuickSort(l, j);
    if i < r then QuickSort(i, r);
end;

procedure BulidTree;
var
    i, j: TIndex;
begin
    Readln(N);
    for i := 1 to N - 1 do
    begin
        Edges[i * 2 - 1].X := i + 1;
        Edges[i * 2].Y := i + 1;
        Read(Edges[i * 2 - 1].Y);
        Edges[i * 2].X := Edges[i * 2 - 1].Y;
    end;
    QuickSort(1, 2 * N - 2);
    j := 0;
    Split[0] := 0;
    for i := 1 to N do
    begin
        while (Edges[j + 1].X = i) and (j + 1 <= 2 * N - 2) do
            Inc(j);
        Split[i] := j;
    end;
    FillChar(Tree, SizeOf(Tree), 0);
    FillChar(Hash, SizeOf(Hash), 0);
    QueueLen := 0;
    Tree[1].ToParent := 0;
    Tree[1].Parent := 0;
    PreOrder(1);
end;

function Max(A, B: TIndex): TIndex;
begin
    if A > B then
        Result := A
    else
        Result := B;
end;

function GetMaxChild(Node, Exclude: TIndex): TIndex;
begin
    if Tree[Node].FirstChild = Exclude then
        Result := Tree[Node].SecondValue
    else if Tree[Node].SecondChild = Exclude then
        Result := Tree[Node].FirstValue
    else
        Result := Tree[Node].FirstValue;
end;

procedure Process;
var
    i: TIndex;
    Node: TIndex;
    Min: TIndex;
begin
    for i := 2 to N do //without Root
    begin
        Node := Queue[i];
        Inc(Tree[Node].ToParent,
            Max(Tree[Tree[Node].Parent].ToParent
            , GetMaxChild(Tree[Node].Parent, Node)));
    end;
    Min := MaxValue;
    for Node := 1 to N do
    begin
        Tree[Node].Farthest := Max(Tree[Node].ToParent, Tree[Node].FirstValue);
        if Tree[Node].Farthest < Min then Min := Tree[Node].Farthest;
    end;
    for Node := 1 to N do
        if Tree[Node].Farthest = Min then
            Write(Node, ' ');
    Writeln;
end;

procedure Main;
begin
    BulidTree;
    Process;
end;

begin
    Main;
end.

