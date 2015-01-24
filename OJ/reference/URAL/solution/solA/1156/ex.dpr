program Ural_1156(Input, Output);
const
    MaxN = 100;
    MaxK = 100;
type
    TIndex = Longint;
    TConnectSet = record
        Num: TIndex;
        D: array[1..MaxN] of TIndex;
    end;
    TConnects = array[1..MaxK] of record
        P, Q: TConnectSet;
    end;
    TGraph = array[1..MaxN, 1..MaxN] of Boolean;
    TTravelled = record
        Num: TIndex;
        D: array[1..MaxN] of Boolean;
    end;
    TDp = array[-MaxN..MaxN] of Boolean;
    TPath = array[1..MaxK, -MaxN..MaxN] of Boolean;
var
    N, K: TIndex;
    G: TGraph;
    W: TTravelled;
    F1, F2: TDp;
    P: TPath;
    S: TConnects;

procedure FindSpanningTree(Node, Depth: TIndex);
var
    i: TIndex;
begin
    W.D[Node] := true;
    Inc(W.Num);
    if Odd(Depth) then
    begin
        Inc(S[K].P.Num);
        S[K].P.D[S[K].P.Num] := Node;
    end
    else
    begin
        Inc(S[K].Q.Num);
        S[K].Q.D[S[K].Q.Num] := Node;
    end;
    for i := 1 to N do
        if (not W.D[i]) and (G[Node, i]) then
            FindSpanningTree(i, Depth + 1);
end;

procedure Main;
var
    i, j, l, M: TIndex;
begin
    FillChar(G, SizeOf(G), 0);
    FillChar(W, SizeOf(W), 0);
    FillChar(S, SizeOf(S), 0);
    Readln(N, M);
    N := N * 2;
    while M > 0 do
    begin
        Dec(M);
        Readln(i, j);
        G[i, j] := true;
        G[j, i] := true;
    end;
    K := 0;
    while W.Num < N do
    begin
        Inc(K);
        for i := 1 to N do
            if not W.D[i] then
            begin
                FindSpanningTree(i, 1);
                Break;
            end;
        for i := 1 to S[K].P.Num do
            for j := 1 to S[K].P.Num do
                if G[S[K].P.D[i], S[K].P.D[j]] then
                begin
                    Writeln('IMPOSSIBLE');
                    Exit;
                end;
        for i := 1 to S[K].Q.Num do
            for j := 1 to S[K].Q.Num do
                if G[S[K].Q.D[i], S[K].Q.D[j]] then
                begin
                    Writeln('IMPOSSIBLE');
                    Exit;
                end;
    end;
    FillChar(F1, SizeOf(F1), 0);
    FillChar(P, SizeOf(P), 0);
    F1[0] := true;
    for i := K downto 1 do
    begin
        FillChar(F2, SizeOf(F2), 0);
        for j := -N to N do
            if F1[j] then
            begin
                F2[j - (S[i].P.Num - S[i].Q.Num)] := true;
                P[i, j - (S[i].P.Num - S[i].Q.Num)] := true; {1}
                F2[j - (S[i].Q.Num - S[i].P.Num)] := true;
                P[i, j - (S[i].Q.Num - S[i].P.Num)] := false; {-1}
            end;
        F1 := F2;
    end;
    if not F1[0] then
    begin
        Writeln('IMPOSSIBLE');
        Exit;
    end;
    j := 0;
    for i := 1 to K do
        if P[i, j] then
        begin
            for l := 1 to S[i].P.Num do
                Write(S[i].P.D[l], ' ');
            Inc(j, S[i].P.Num - S[i].Q.Num);
        end
        else
        begin
            for l := 1 to S[i].Q.Num do
                Write(S[i].Q.D[l], ' ');
            Dec(j, S[i].P.Num - S[i].Q.Num);
        end;
    Writeln;
    j := 0;
    for i := 1 to K do
        if P[i, j] then
        begin
            for l := 1 to S[i].Q.Num do
                Write(S[i].Q.D[l], ' ');
            Inc(j, S[i].P.Num - S[i].Q.Num);
        end
        else
        begin
            for l := 1 to S[i].P.Num do
                Write(S[i].P.D[l], ' ');
            Dec(j, S[i].P.Num - S[i].Q.Num);
        end;
    Writeln;
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
   { Close(Input);
    Close(Output);}
end.

