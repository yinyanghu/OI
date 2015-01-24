program Ural_1242(Input, Output);
const
    MaxN = 1000;
type
    TIndex = Longint;
    TNode = record
        ParentVictim: Boolean;
        ChildVictim: Boolean;
        LeftParent, RightParent, FirstChild, Brother: TIndex;
    end;
    TTree = array[1..MaxN] of TNode;
    TChecked = array[1..MaxN] of Boolean;
var
    T: TTree;
    N: TIndex;

procedure DFSChild(Node: TIndex);
var
    Child: TIndex;
begin
    if T[Node].ChildVictim then Exit;
    T[Node].ChildVictim := true;
    Child := T[Node].FirstChild;
    while Child <> 0 do
    begin
        DFSChild(Child);
        Child := T[Child].Brother;
    end;
end;

procedure DFSParent(Node: TIndex);
begin
    with T[Node] do
    begin
        if ParentVictim then Exit;
        ParentVictim := true;
        if LeftParent <> 0 then DFSParent(LeftParent);
        if RightParent <> 0 then DFSParent(RightParent);
    end;
end;

procedure AddChild(Parent, NewChild: TIndex);
var
    ChildP, ChildC, LastChildC: TIndex;
    P: TChecked;
begin
    FillChar(P, SizeOf(P), 0);
    ChildP := T[Parent].FirstChild;
    while ChildP <> 0 do
    begin
        if ChildP = NewChild then Exit;
        P[ChildP] := true;
        if T[ChildP].Brother = 0 then Break;
        ChildP := T[ChildP].Brother;
    end;
    ChildC := T[NewChild].FirstChild;
    LastChildC := 0;
    while ChildC <> 0 do
    begin
        if P[ChildC] then
            if LastChildC = 0 then
                T[NewChild].FirstChild := 0
            else
                T[LastChildC].Brother := 0;
        LastChildC := ChildC;
        ChildC := T[ChildC].Brother;
    end;
    if ChildP = 0 then
        T[Parent].FirstChild := NewChild
    else
        T[ChildP].Brother := NewChild;

end;

procedure Main;
var
    St: string;
    tmp: TIndex;
    Parent, Child: TIndex;
    i: TIndex;
    Found: Boolean;
begin
    FillChar(T, SizeOf(T), 0);
    Readln(N);
    while true do
    begin
        Readln(St);
        if Pos('BLOOD', St) > 0 then Break;
        St := St + ' ';
        tmp := 0;
        Child := 0;
        Parent := 0;
        for i := 1 to Length(St) do
            if St[i] in ['0'..'9'] then
                tmp := tmp * 10 + Ord(St[i]) - Ord('0')
            else if tmp <> 0 then
            begin
                if Child = 0 then
                    Child := tmp
                else
                    Parent := tmp;
                tmp := 0;
            end;
        if T[Child].LeftParent = 0 then
            T[Child].LeftParent := Parent
        else
            T[Child].RightParent := Parent;
        AddChild(Parent, Child);
    end;
    while not SeekEof do
    begin
        Read(Child);
        DFSChild(Child);
        DFSParent(Child);
    end;
    Found := false;
    for i := 1 to N do
        if not (T[i].ParentVictim or T[i].ChildVictim) then
        begin
            Found := true;
            Write(i, ' ');
        end;
    if not Found then Writeln(0);
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);     }
    Main;
    {Close(Input);
    Close(Output);   }
end.

