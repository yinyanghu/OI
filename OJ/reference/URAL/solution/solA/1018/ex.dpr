program Ural_1018(Input, Output);
const
    MaxN = 100;
type
    TIndex = Longint;
    TNode = record
        Depth: TIndex;
        LeftChild, RightChild: TIndex;
        LeftEdge, RightEdge: TIndex;
        Checked: Boolean;
        F: array[0..MaxN] of TIndex;
    end;
    TTree = array[0..MaxN] of TNode;
    TQueue = array[1..MaxN] of TIndex;
    TGraph = array[1..MaxN, 1..MaxN] of TIndex;
var
    G: TGraph;
    Q: TQueue;
    T: TTree;
    N, P, Count: TIndex;

procedure Init;
var
    i, j, k: TIndex;
begin
    FillChar(G, SizeOf(G), 255);
    Readln(N, P);
    for k := 1 to N - 1 do
    begin
        Read(i, j);
        Readln(G[i, j]);
        G[j, i] := G[i, j];
    end;
    for i := 0 to N do
        with T[i] do
        begin
            LeftChild := 0;
            RightChild := 0;
            FillChar(F, SizeOf(F), 255);
            Checked := false;
        end;
end;

procedure Pre_Order(Node: TIndex; Depth: TIndex);
var
    Next: TIndex;
begin
    T[Node].Depth := Depth;
    T[Node].Checked := true;
    Inc(Count);
    Q[Count] := Node;
    for Next := 1 to N do
        if (G[Node, Next] >= 0) and (not T[Next].Checked) then
        begin
            if T[Node].LeftChild = 0 then
            begin
                T[Node].LeftChild := Next;
                T[Node].LeftEdge := G[Node, Next];
            end
            else
            begin
                T[Node].RightChild := Next;
                T[Node].RightEdge := G[Node, Next];
            end;
            Pre_Order(Next, Depth + 1);
            if T[Node].RightChild > 0 then Break;
        end;
end;

procedure Dp;
var
    i, j, k, l: TIndex;
    tmp: TIndex;
begin
    for l := N downto 1 do
    begin
        i := Q[l];
        if P - T[i].Depth >= 0 then T[i].F[0] := 0;
        for j := 1 to P - T[i].Depth do
        begin
            if T[T[i].LeftChild].F[j - 1] < 0 then Continue;
            tmp := T[T[i].LeftChild].F[j - 1] + T[i].LeftEdge;
            if tmp > T[i].F[j] then
                T[i].F[j] := tmp;
        end;
        for j := 1 to P - T[i].Depth do
        begin
            if T[T[i].RightChild].F[j - 1] < 0 then Continue;
            tmp := T[T[i].RightChild].F[j - 1] + T[i].RightEdge;
            if tmp > T[i].F[j] then
                T[i].F[j] := tmp;
        end;
        for j := 2 to P - T[i].Depth do
        begin
            for k := 0 to j - 2 do
            begin
                if T[T[i].LeftChild].F[k] < 0 then Continue;
                if T[T[i].RightChild].F[j - 2 - k] < 0 then Continue;
                tmp := T[T[i].LeftChild].F[k] + T[i].LeftEdge +
                    T[T[i].RightChild].F[j - 2 - k] + T[i].RightEdge;
                if tmp > T[i].F[j] then
                    T[i].F[j] := tmp;
            end;
        end;
    end;
    Writeln(T[1].F[P]);
end;

procedure Main;
begin
    Init;
    Pre_Order(1, 0);
    Dp;
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);     }
    Main;
    {  Close(Input);
      Close(Output); }
end.

