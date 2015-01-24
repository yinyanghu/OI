program Ural_1136(Input, Output);
const
    MaxN = 3000;
    MaxValue = 65535;
type
    TIndex = Word;
    TTreeNodePtr = ^TTreeNode;
    TTreeNode = record
        Element: TIndex;
        LeftChild, RightChild: TTreeNodePtr;
    end;
    TData = array[1..MaxN] of TIndex;
var
    TreeRoot: TTreeNodePtr;
    D: TData;

procedure Insert(InsValue: TIndex);
var
    InsNode, CurNode: TTreeNodePtr;

begin
    CurNode := TreeRoot;
    while CurNode <> nil do
    begin
        if InsValue = CurNode^.Element then
            Break;
        if InsValue < CurNode^.Element then
            if CurNode^.LeftChild = nil then
            begin
                New(InsNode);
                InsNode^.Element := InsValue;
                InsNode^.LeftChild := nil;
                InsNode^.RightChild := nil;
                CurNode^.LeftChild := InsNode;
                Break;
            end
            else
                CurNode := CurNode^.LeftChild;
        if InsValue > CurNode^.Element then
            if CurNode^.RightChild = nil then
            begin
                New(InsNode);
                InsNode^.Element := InsValue;
                InsNode^.LeftChild := nil;
                InsNode^.RightChild := nil;
                CurNode^.RightChild := InsNode;
                Break;
            end
            else
                CurNode := CurNode^.RightChild;
    end;
end;

procedure Traversing(CurNode: TTreeNodePtr);
begin
    if CurNode = nil then
        Exit;
    Traversing(CurNode^.RightChild);
    Traversing(CurNode^.LeftChild);
    Write(CurNode^.Element, ' ');
end;

procedure Main;
var
    i, N: TIndex;
begin
    New(TreeRoot);
    TreeRoot^.Element := MaxValue;
    TreeRoot^.LeftChild := nil;
    TreeRoot^.RightChild := nil;
    Read(N);
    for i := 1 to N do
        Read(D[i]);
    for i := N downto 1 do
        Insert(D[i]);
    Traversing(TreeRoot^.LeftChild);
    Writeln;
end;
begin
    Main;
end.

