program Ural_1182(Input, Output);
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
    Sp, Sq: TConnectSet;

function Print(t: TIndex): Boolean;
var
    i, j, l: TIndex;
begin
    FillChar(Sp, SizeOf(Sp), 0);
    FillChar(Sq, SizeOf(Sq), 0);
    j := t;
    for i := 1 to K do
        if P[i, j] then
        begin
            for l := 1 to S[i].P.Num do
            begin
                Inc(Sp.Num);
                Sp.D[Sp.Num] := S[i].P.D[l];
            end;
            Inc(j, S[i].P.Num - S[i].Q.Num);
        end
        else
        begin
            for l := 1 to S[i].Q.Num do
            begin
                Inc(Sp.Num);
                Sp.D[Sp.Num] := S[i].Q.D[l];
            end;
            Dec(j, S[i].P.Num - S[i].Q.Num);
        end;
    j := t;
    for i := 1 to K do
        if P[i, j] then
        begin
            for l := 1 to S[i].Q.Num do
            begin
                Inc(Sq.Num);
                Sq.D[Sq.Num] := S[i].Q.D[l];
            end;
            Inc(j, S[i].P.Num - S[i].Q.Num);
        end
        else
        begin
            for l := 1 to S[i].P.Num do
            begin
                Inc(Sq.Num);
                Sq.D[Sq.Num] := S[i].P.D[l];
            end;
            Dec(j, S[i].P.Num - S[i].Q.Num);
        end;
    if (Sp.Num = 0) or (Sq.Num = 0) then
        Print := false
    else
    begin
        Write(Sp.Num);
        for l := 1 to Sp.Num do
            Write(' ', Sp.D[l]);
        Writeln;
        Write(Sq.Num);
        for l := 1 to Sq.Num do
            Write(' ', Sq.D[l]);
        Writeln;
        Print := true;
    end;
end;

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
    i, j: TIndex;
    tG: TGraph;
begin
    FillChar(G, SizeOf(G), true);
    FillChar(tG, SizeOf(tG), false);
    FillChar(W, SizeOf(W), 0);
    FillChar(S, SizeOf(S), 0);
    Readln(N);
    for i := 1 to N do
        repeat
            Read(j);
            if j = 0 then
            begin
                Readln;
                Break;
            end;
            tG[i, j] := true;
        until false;
    for i := 1 to N do
    begin
        for j := 1 to N do
            G[i, j] := not (tG[i, j] and tG[j, i]);
        G[i, i] := false;
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
                    Writeln('No solution');
                    Exit;
                end;
        for i := 1 to S[K].Q.Num do
            for j := 1 to S[K].Q.Num do
                if G[S[K].Q.D[i], S[K].Q.D[j]] then
                begin
                    Writeln('No solution');
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
    for i := 0 to N do
        if F1[i] then
        begin
            if Print(i) then Exit;
        end
        else if F1[-i] then
        begin
            if Print(-i) then Exit;
        end;
    Writeln('No solution');
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Main;
   { Close(Input);
    Close(Output);}
end.

