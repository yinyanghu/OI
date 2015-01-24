program Ural_1227(Input, Output);
const
    MaxN = 100;
type
    TIndex = Longint;
    TGraph = array[1..MaxN, 1..MaxN] of TIndex;
    TSumofNode = array[1..MaxN] of TIndex;
    TVisited = array[1..MaxN] of TIndex;
var
    N, K: TIndex;
    Len: TIndex;
    Found: Boolean;
    V: TVisited;
    S: TSumofNode;
    G: TGraph;

function DFS(Node: TIndex): Longint;
var
    i: TIndex;
    Max, T: TIndex;
begin
    if Found then Exit;
    V[Node] := K;
    Max := 0;
    for i := 1 to N do
        if (V[i] = 0) and (G[Node, i] > 0) then
        begin
            T := DFS(i);
            if Found then Exit;
            if Max + G[Node, i] + T >= Len then
            begin
                Found := true;
                Exit;
            end;
            if G[Node, i] + T > Max then Max := G[Node, i] + T; {/////Wa 1 time}
        end;
    DFS := Max;
end;

procedure Main;
var
    M: TIndex;
    i, j: TIndex;
    T, P, Q, R: TIndex;
begin
    FillChar(G, SizeOf(G), 0);
    FillChar(S, SizeOf(S), 0);
    Readln(N, M, Len); //N is city num ,  M is road num
    while M > 0 do
    begin
        Dec(M);
        Readln(P, Q, R);
        if (P = Q) or (G[P, Q] > 0) then
        begin
            Writeln('YES');
            Exit;
        end;
        G[P, Q] := R;
        G[Q, P] := R;
        Inc(S[P]);
        Inc(S[Q]);
    end;
    K := 0;
    Found := false;
    FillChar(V, SizeOf(V), 0); //visit
    for i := 1 to N do
        if V[i] = 0 then
        begin
            Inc(K);
            DFS(i);
            if Found then Break;
            T := 0;
            M := 0;
            for j := 1 to N do
                if V[j] = K then
                begin
                    Inc(T, S[j]);
                    Inc(M);
                end;
            if T div 2 >= M then Found := true;
            //if nodes in DFS tree are not a tree then there are circle in them
            //and because of Length>0
            if Found then Break;
        end;
    if Found then
        Writeln('YES')
    else
        Writeln('NO');
end;
begin
 {   Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);
    while not seekeof do         }
        Main;
{    Close(Input);
    Close(Output); }
end.

