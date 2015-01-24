//8: 37    8:51
program Ural_1085(Input, Output);
const
    MaxValue = 8192;
    MaxN = 100;
type
    TIndex = Longint;
    TData = Longint;
    TGraph = array[1..MaxN, 1..MaxN] of TData;
    TRoute = array[1..MaxN] of TIndex;
    TCost = array[1..MaxN] of TData;
var
    G: TGraph;
    R: TRoute;
    C: TCost;
    N, M, P: TIndex;

procedure Main;
var
    i, j, k: TIndex;
    MinIndex, L, S, E: TIndex;
    Min, Q: TData;
begin
    for i := 1 to MaxN do
    begin
        for j := 1 to MaxN do
            G[i, j] := MaxValue;
        G[i, i] := 0;
    end;
    Readln(N, M);
    for k := 1 to M do
    begin
        Read(L);
        for i := 1 to L do
            Read(R[i]);
        for i := 1 to L - 1 do
            for j := i + 1 to L do
                if R[i] <> R[j] then
                begin
                    G[R[i], R[j]] := 4;
                    G[R[j], R[i]] := 4;
                end;
        Readln;
    end;
    //Floyd
    for k := 1 to N do
        for i := 1 to N do
            for j := 1 to N do
                if G[i, k] + G[k, j] < G[i, j] then
                    G[i, j] := G[i, k] + G[k, j];

    FillChar(C, SizeOf(C), 0);
    Readln(P);
    for i := 1 to P do
    begin
        Readln(Q, S, E);
        for j := 1 to N do
        begin
            if G[S, j] >= MaxValue then
                C[j] := MaxValue
            else if E = 0 then
                if G[S, j] <= Q then
                    Inc(C[j], G[S, j])
                else 
                    C[j]:=MaxValue;
        end;
    end;
    MinIndex := 0;
    Min := MaxValue;
    for i := 1 to N do
        if C[i] < Min then
        begin
            MinIndex := i;
            Min := C[i];
        end;
    if MinIndex <> 0 then
        Writeln(MinIndex, ' ', Min)
    else
        Writeln(0);
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Main;
 {   Close(Input);
    Close(Output);   }
end.

