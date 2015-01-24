program Ural_1022(Input, Output);
const
    MaxN = 100;
type
    TIndex = Byte;
    TAdjoinVextexPtr = ^TAdjoinVextex;
    TAdjoinVextex = record
        VextexIndex: TIndex;
        NextAdjoinVextex: TAdjoinVextexPtr;
    end;
    TVextexNode = record
        FirstAdjoinVextex: TAdjoinVextexPtr;
        Indegree: TIndex;
    end;
    TVextex = array[1..MaxN] of TVextexNode;
    TStack = array[1..MaxN] of TIndex;
var
    N: TIndex;
    Vextex: TVextex;
    Stack: TStack;

procedure Create_AdjoinList;
var
    i, T: TIndex;
    NewAdjoinVextex: TAdjoinVextexPtr;
begin
    FillChar(Vextex, SizeOf(Vextex), 0);
    Readln(N);
    for i := 1 to N do
    begin
        Vextex[i].FirstAdjoinVextex := nil;
        while true do
        begin
            Read(T);
            if T = 0 then
                Break;
            Inc(Vextex[T].Indegree);
            New(NewAdjoinVextex);
            NewAdjoinVextex^.VextexIndex := T;
            NewAdjoinVextex^.NextAdjoinVextex := Vextex[i].FirstAdjoinVextex;
            Vextex[i].FirstAdjoinVextex := NewAdjoinVextex;
        end;
    end;
end;

procedure Push(var StackTop: TIndex; const i: TIndex);
begin
    Inc(StackTop);
    Stack[StackTop] := i;
end;

function Pop(var StackTop: TIndex): TIndex;
begin
    Pop := Stack[StackTop];
    Stack[StackTop] := 0;
    Dec(StackTop);
end;

procedure TopologicalSort;
var
    i, j, M, StackTop: TIndex;
    CurrentVextex: TAdjoinVextexPtr;
begin
    Create_AdjoinList;
    FillChar(Stack, SizeOf(Stack), 0);
    StackTop := 0;
    for i := 1 to N do
        if Vextex[i].Indegree = 0 then
            Push(StackTop, i);
    M := 0;
    while not (StackTop = 0) do
    begin
        i := Pop(StackTop);
        Write(i, ' ');
        Inc(M);
        CurrentVextex := Vextex[i].FirstAdjoinVextex;
        while CurrentVextex <> nil do
        begin
            j := CurrentVextex^.VextexIndex;
            Dec(Vextex[j].Indegree);
            if Vextex[j].Indegree = 0 then
                Push(StackTop, j);
            CurrentVextex := CurrentVextex^.NextAdjoinVextex;
        end;
    end;
    //    Result := (M = N);
end;
begin
 {   Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(output);            }
    TopologicalSort;
 {   Close(Input);
    Close(Output); }
end.

