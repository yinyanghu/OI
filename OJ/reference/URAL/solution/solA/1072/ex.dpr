program Ural_1072(Input, Output);
const
    MaxN = 90;
    MaxK = 5;
    MaxValue = 128;
type
    TIndex = Longint;
    TData = Longint;
    TAddress = array[1..4] of Byte;
    TTCPIP = record
        IP, NetMask: TAddress;
    end;
    TComputer = record
        Num: TIndex;
        TCPIP: array[1..MaxK] of TTCPIP;
    end;
    TNet = array[1..MaxN] of TComputer;
    TGraph = array[1..MaxN, 1..MaxN] of TData;
    TPath = array[1..MaxN, 1..MaxN] of TIndex;
var
    G: TGraph;
    N: TIndex;
    Net: TNet;
    S, T: TIndex;
    P: TPath;

function SameSubNet(TCPIP1, TCPIP2: TTCPIP): Boolean;
begin
    SameSubNet := ((TCPIP1.IP[1] and TCPIP1.NetMask[1]) = (TCPIP2.IP[1] and TCPIP2.NetMask[1]))
        and ((TCPIP1.IP[2] and TCPIP1.NetMask[2]) = (TCPIP2.IP[2] and TCPIP2.NetMask[2]))
        and ((TCPIP1.IP[3] and TCPIP1.NetMask[3]) = (TCPIP2.IP[3] and TCPIP2.NetMask[3]))
        and ((TCPIP1.IP[4] and TCPIP1.NetMask[4]) = (TCPIP2.IP[4] and TCPIP2.NetMask[4]));
end;

procedure StringToIP(St: string; var T: TTCPIP);
var
    S: string;
    i, j: TIndex;
    IsIP: Boolean;
    Code: Integer;
begin
    S := '';
    IsIP := true;
    j := 1;
    for i := 1 to Length(St) do
    begin
        if St[i] in ['0'..'9'] then
            S := S + St[i];
        if (not (St[i] in ['0'..'9'])) and (S <> '') then
        begin
            if IsIP then
                Val(S, T.IP[j], Code)
            else
                Val(S, T.NetMask[j], Code);
            Inc(j);
            S := '';
        end;
        if j > 4 then
        begin
            IsIP := false;
            j := 1;
        end;
    end;
end;

procedure Init;
var
    i, j, x, y: TIndex;
    St: string;
    Adjoining: Boolean;
begin
    FillChar(Net, SizeOf(Net), 0);
    FillChar(P, SizeOf(P), 0);
    FillChar(G, SizeOf(G), 0);
    Readln(N);
    for i := 1 to N do
    begin
        Readln(Net[i].Num);
        for j := 1 to Net[i].Num do
        begin
            Readln(St);
            St := St + ' '; //Notice Eof!!!!!
            StringToIp(St, Net[i].TCPIP[j]);
        end;
    end;
    for i := 1 to N do
        for j := 1 to N do
        begin
            G[i, j] := MaxValue;
            if i = j then Continue;
            Adjoining := false;
            for x := 1 to Net[i].Num do
                for y := 1 to Net[j].Num do
                    if SameSubNet(Net[i].TCPIP[x], Net[j].TCPIP[y]) then
                    begin
                        Adjoining := true;
                    end;
            if Adjoining then
                G[i, j] := 1;
        end;
    Readln(S, T);
end;

procedure Print(i, j: TIndex);
begin
    if P[i, j] = 0 then Exit;
    Print(i, P[i, j]);
    Write(P[i, j], ' ');
    Print(P[i, j], j);
end;

procedure Floyd;
var
    i, j, k: TIndex;
begin
    for i := 1 to N do
    begin
        G[i, i] := 0;
        for j := 1 to N do
            if G[i, j] = MaxValue then
                P[i, j] := -1
            else
                P[i, j] := 0;
    end;
    for k := 1 to N do
        for i := 1 to N do
            for j := 1 to N do
                if G[i, k] + G[k, j] < G[i, j] then
                begin
                    G[i, j] := G[i, k] + G[k, j];
                    P[i, j] := k;
                end;
    if P[S, T] <> -1 then
    begin
        Writeln('Yes');
        Write(S, ' ');
        Print(S, T);
        Write(T);
        Writeln;
    end
    else
        Writeln('No');
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Init;
    Floyd;
    {Close(Input);
    Close(Output); }
end.

