{
winning can be transfered
if node i to node j is connected for winning graph
then i can win j
}
program Ural_1218(Input, Output);
//20:49 21:04
const
    MaxN = 500;
type
    TIndex = Longint;
    TNode = array[1..MaxN] of record
        Name: string[30 + 1];
        A, B, C: TIndex;
    end;
    TGraph = array[1..MaxN, 1..MaxN] of Boolean;
    TVisited = array[1..MaxN] of Boolean;
var
    D: TNode;
    G: TGraph;
    N, M: TIndex;
    V: TVisited;

procedure DFS(Node: TIndex);
var
    i: TIndex;
begin
    Inc(M);
    V[Node] := true;
    for i := 1 to N do
        if (not V[i]) and G[Node, i] then
            DFS(i);
end;

procedure Main;
var
    i, j: TIndex;
    Ch: Char;
begin
    Readln(N);
    for i := 1 to N do
    begin
        D[i].Name := '';
        repeat
            Read(Ch);
            D[i].Name := D[i].Name + Ch;
        until not (Ch in ['A'..'Z', 'a'..'z']);
        Delete(D[i].Name, Length(D[i].Name), 1);
        Readln(D[i].A, D[i].B, D[i].C);
    end;
    for i := 1 to N - 1 do
        for j := i + 1 to N do
        begin
            G[i, j] := (Ord(D[i].A > D[j].A) + Ord(D[i].B > D[j].B) + Ord(D[i].C > D[j].C) >= 2);
            G[j, i] := not G[i, j];
        end;
    for i := 1 to N do
    begin
        FillChar(V, SizeOf(V), 0);
        M := 0;
        DFS(i);
        if M = N then Writeln(D[i].Name);
    end;
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);     }
    Main;
    { Close(Input);
     Close(Output); }
end.

