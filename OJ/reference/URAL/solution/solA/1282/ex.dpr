program Ural_1282(Input, Output);
const
    MaxN = 1000;
type
    TIndex = Integer;
    TNodeItem = record
        Children: TIndex;
        Father: TIndex;
        Value: TIndex;
        Level: TIndex;
        Status: Byte; {0:Node;1:Leaf;2:Used}
    end;
    TNode = array[1..MaxN] of TNodeItem;
var
    Tree: TNode;
    N: TIndex;

procedure Init;
var
    i: TIndex;
    Ch: Char;
begin
    FillChar(Tree, SizeOf(Tree), 0);
    Readln(N);
    Tree[1].Father := 0;
    Tree[1].Level := 1;
    Tree[1].Status := 0;
    Tree[1].Children := 0;
    Tree[1].Value := -1;
    for i := 2 to N do
    begin
        Read(Ch);
        if Ch = 'N' then
        begin
            Readln(Tree[i].Father);
            Inc(Tree[Tree[i].Father].Children);
            Tree[i].Level := Tree[Tree[i].Father].Level + 1;
            Tree[i].Children := 0;
            Tree[i].Status := 0;
            if Odd(Tree[i].Level) then
                Tree[i].Value := -1
            else
                Tree[i].Value := 1;
        end;
        if Ch = 'L' then
        begin
            Readln(Tree[i].Father, Tree[i].Value);
            Inc(Tree[Tree[i].Father].Children);
            Tree[i].Level := Tree[Tree[i].Father].Level + 1;
            Tree[i].Children := 0;
            Tree[i].Status := 1;
        end;
    end;
end;

procedure Main;
var
    i, M: TIndex;
begin
    M := N;
    while M > 1 do
    begin
        for i := 1 to N do
            if Tree[i].Status = 1 then
            begin
                if Odd(Tree[i].Level) then
                begin
                    if Tree[i].Value = -1 then
                        Tree[Tree[i].Father].Value := -1
                    else if (Tree[i].Value = 0) and (Tree[Tree[i].Father].Value <> -1) then
                        Tree[Tree[i].Father].Value := 0;
                end
                else
                begin
                    if Tree[i].Value = 1 then
                        Tree[Tree[i].Father].Value := 1
                    else if (Tree[i].Value = 0) and (Tree[Tree[i].Father].Value <> 1) then
                        Tree[Tree[i].Father].Value := 0;
                end;
                Dec(Tree[Tree[i].Father].Children);
                Dec(M);
                Tree[i].Status := 2;
            end;
        for i := 1 to N do
            if (Tree[i].Status = 0) and (Tree[i].Children = 0) then
                Tree[i].Status := 1;
    end;
    case Tree[1].Value of
        1: Writeln('+1');
        0: Writeln('0');
        -1: Writeln('-1');
    end;
end;
begin
    Init;
    Main;
end.

