program Ural_1142(Input, Output);
const
    MaxN = 10;
type
    TIndex = Longint;
    TStatus = array[1..MaxN] of record
        Num: TIndex;
        Opr: TIndex; //Last
    end;
    TSet = set of 1..MaxN;
var
    S: TSet;
    N: TIndex;
    L: TStatus;
    Count: TIndex;

procedure DFS(Depth: TIndex);
var
    i: TIndex;
begin
    if Depth = N + 1 then
    begin
        Inc(Count);
        Exit;
    end;
    for i := 1 to N do
        if not (i in S) then
        begin
            if (L[Depth - 1].Num < i) then
            begin
                S := S + [i];
                L[Depth].Opr := 0;
                L[Depth].Num := i;
                DFS(Depth + 1);
                S := S - [i];
            end;
            S := S + [i];
            L[Depth].Opr := 1;
            L[Depth].Num := i;
            DFS(Depth + 1);
            S := S - [i];
        end;
end;

procedure Main;
var
    i: TIndex;
begin
    Readln(N);
    Count := 0;
    S := [];
    FillChar(L, SizeOf(L), 0);
    for i := 1 to N do
    begin
        S := [i];
        L[1].Num := i;
        DFS(2);
    end;
    Writeln(Count);
end;
begin
    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);
    while not eof do
        Main;
    Close(Input);
    Close(Output);
end.

