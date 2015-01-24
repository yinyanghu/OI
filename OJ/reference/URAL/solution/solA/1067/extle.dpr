program Ural_1067(Input, Output);
const
    MaxN = 500;
    MaxDirectoryLen = 8;
type
    TIndex = Integer;
    TDirectory = string[MaxDirectoryLen];
    TTreeNodePtr = ^TTreeNode;
    TTreeNode = record
        Directory: TDirectory;
        Next: TTreeNodePtr;
        Children: TTreeNodePtr;
    end;
    TChildrenList = array[1..MaxN] of TTreeNodePtr;
var
    SystemTree: TTreeNodePtr;

procedure Create(St: string);
var
    NewNode, CurNode, TmpNode: TTreeNodePtr;
    key: TDirectory;
    found: Boolean;
begin
    CurNode := SystemTree;
    St := St + '\';
    while Pos('\', St) > 0 do
    begin
        Key := Copy(St, 1, Pos('\', St) - 1);
        Delete(St, 1, Pos('\', St));
        found := false;
        TmpNode := CurNode^.Children;
        while TmpNode <> nil do
        begin
            if TmpNode^.Directory = Key then
            begin
                found := true;
                CurNode := TmpNode;
                Break;
            end;
            TmpNode := TmpNode^.Next;
        end;
        if not found then
        begin
            New(NewNode);
            NewNode^.Directory := Key;
            NewNode^.Children := nil;
            NewNode^.Next := CurNode^.Children;
            CurNode^.Children := NewNode;
            CurNode := CurNode^.Children;
        end;
    end;
end;

procedure Print(CurNode: TTreeNodePtr; Depth: TIndex);
var
    i, j: TIndex;
    TmpNode: TTreeNodePtr;
    ChildrenNum: TIndex;
    ChildrenList: TChildrenList;
begin
    if CurNode <> SystemTree then
    begin
        for i := 1 to Depth do
            Write(' ');
        Writeln(CurNode^.Directory);
    end;
    ChildrenNum := 0;
    with CurNode^ do
    begin
        TmpNode := CurNode^.Children;
        while TmpNode <> nil do
        begin
            Inc(ChildrenNum);
            ChildrenList[ChildrenNum] := TmpNode;
            TmpNode := TmpNode^.Next;
        end;
        for i := 1 to ChildrenNum - 1 do
            for j := i + 1 to ChildrenNum do
                if ChildrenList[i]^.Directory > ChildrenList[j]^.Directory then
                begin
                    TmpNode := ChildrenList[i];
                    ChildrenList[i] := ChildrenList[j];
                    ChildrenList[j] := TmpNode;
                end;
        for i := 1 to ChildrenNum do
            Print(ChildrenList[i], Depth + 1);
    end;
end;

procedure Main;
var
    i, N: TIndex;
    St: string;
begin
    Readln(N);
    New(SystemTree);
    SystemTree^.Directory := '';
    SystemTree^.Children := nil;
    SystemTree^.Next := nil;
    for i := 1 to N do
    begin
        Readln(St);
        Create(St);
    end;
    Print(SystemTree, -1);
end;
begin
    {   Assign(Input, 'i.txt');
       Reset(Input);
       Assign(Output, 'o.txt');
       Rewrite(Output);     }
    Main;
    { Close(Input);
      Close(Output);      }
end.

