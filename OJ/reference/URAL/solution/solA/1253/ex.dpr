program Ural_1253(Input, Output);
const
    MaxLen = 1000;
    MaxN = 9;
type
    TIndex = Longint;
    TDString = array[1..MaxLen] of Char;
    TSample = array[1..MaxN] of record
        P: TDString;
        Len: TIndex;
        RealLen: TIndex;
    end;
    TWatch = record
        D: array[1..MaxN + 1] of TIndex;
        Len: TIndex;
    end;
var
    OverLength: Boolean;
    D: TSample;
    N: TIndex;
    W: TWatch;

function DLength(S, k: TIndex): TIndex;
var
    i, Sum: TIndex;
begin
    if OverLength then Exit;
    Inc(W.Len);
    W.D[W.Len] := k;
    for i := 1 to W.Len - 1 do
        if W.D[i] = k then
        begin
            OverLength := true;
            Exit;
        end;
    if S + D[k].RealLen >= 1000000 then OverLength := true;
    Sum := D[k].RealLen;
    with D[k] do
        for i := 1 to Len do
        begin
            if P[i] = '*' then
                Sum := Sum + DLength(Sum + S, Ord(P[i + 1]) - Ord('0'));
            if OverLength then Exit;
        end;
    DLength := Sum;
    Dec(W.Len);
end;

procedure Print(k: TIndex);
var
    i: TIndex;
begin
    with D[k] do
    begin
        i := 0;
        while i < Len do
        begin
            Inc(i);
            if P[i] = '*' then
            begin
                Print(Ord(P[i + 1]) - Ord('0'));
                Inc(i);
            end
            else
                Write(P[i]);
        end;
    end;
end;

procedure Main;
var
    i: TIndex;
    Ch: Char;
begin
    FillChar(D, SizeOf(D), 0);
    FillChar(W, SizeOf(W), 0);
    Readln(N);
    for i := 1 to N do
    begin
        repeat
            Read(Ch);
            if Ch = '#' then Break;
            Inc(D[i].Len);
            D[i].P[D[i].Len] := Ch;
            Inc(D[i].RealLen);
            if Ch = '*' then
                Dec(D[i].RealLen, 2);
        until false;
        Readln;
    end;
    OverLength := false;
    DLength(0, 1); //estimate
    if OverLength then
    begin
        Write('#');
        Exit;
    end;
    Print(1);
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Main;
{    Close(Input);
    Close(Output);  }
end.

