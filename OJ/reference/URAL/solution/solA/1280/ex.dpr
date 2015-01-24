program Ural_1280(Input, Output);
const
    MaxN = 1000;
    MaxE = 100000;
type
    TIndex = Longint;
    TEdge = record
        X, Y: Integer;
    end;
    TEdges = array[1..MaxE] of TEdge;
    TIndegree = array[1..MaxN] of Integer;
    THash = array[1..MaxN] of TIndex;
var
    E: TEdges;
    Ind: TIndegree;
    H: THash;
    N, M: TIndex;

procedure Sift(l, r: TIndex);
var
    i, j: TIndex;
    tmp: TEdge;
    finished: Boolean;
begin
    i := l;
    j := i * 2;
    tmp := E[l];
    finished := false;
    while (j <= r) and (not finished) do
    begin
        if (j < r) and (E[j].X < E[j + 1].X) then
            Inc(j);
        if tmp.X >= E[j].X then
            finished := true
        else
        begin
            E[i] := E[j];
            i := j;
            j := i * 2;
        end;
    end;
    E[i] := tmp;
end;

procedure HeapSort;
var
    i: TIndex;
    tmp: TEdge;
begin
    for i := M div 2 downto 1 do
        Sift(i, M);
    for i := M downto 1 do
    begin
        tmp := E[1];
        E[1] := E[i];
        E[i] := tmp;
        Sift(1, i - 1);
    end;
end;

procedure Main;
var
    i, j, t: TIndex;
begin
    FillChar(E, SizeOf(E), 0);
    FillChar(Ind, SizeOf(Ind), 0);
    FillChar(H, SizeOf(H), 0);
    Readln(N, M);
    for i := 1 to M do
    begin
        Readln(E[i].X, E[i].Y);
        Inc(Ind[E[i].Y]);
    end;
    HeapSort;
    for i := 1 to M do
        if H[E[i].X] = 0 then
        begin
            H[E[i].X] := i;
        end;
    for i := 1 to N do
    begin
        Read(t);
        if Ind[t] > 0 then
        begin
            Writeln('NO');
            Exit;
        end
        else
        begin
            j := H[t];
            if j <> 0 then
            begin
                while (E[j].X = t) and (j <= M) do
                begin
                    Dec(Ind[E[j].Y]);
                    Inc(j);
                end;
            end;
        end;
    end;
    Writeln('YES');
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
   { Close(Input);
    Close(Output);   }
end.

