program Ural_1272(Input, Output);
const
    MaxN = 10000;
type
    TIndex = Integer;
    TFather = array[1..MaxN] of TIndex;
var
    Father: TFather;
    N, P, Q: TIndex;
    MinBridge: TIndex;

function Find(v: TIndex; var NodeNum: TIndex): TIndex;
begin
    if Father[v] < 0 then
    begin
        Find := v;
        NodeNum := -Father[v];
    end
    else
    begin
        Father[v] := Find(Father[v], NodeNum);
        Find := Father[v];
    end;
end;

procedure Merge(u, v: TIndex; IsBridge: Boolean);
var
    Ru, Rv, Nu, Nv: TIndex;
begin
    Ru := Find(u, Nu);
    Rv := Find(v, Nv);
    if Ru <> Rv then
    begin
        if Nu < Nv then
        begin
            Father[Ru] := Rv;
            Dec(Father[Rv], Nu);
        end
        else
        begin
            Father[Rv] := Ru;
            Dec(Father[Ru], Nv);
        end;
        Inc(MinBridge, Ord(IsBridge));
    end;
end;

procedure Kruskal;
var
    i, u, v: TIndex;
begin
    Readln(N, P, Q);
    for i := 1 to N do
        Father[i] := -1;
    MinBridge := 0;
    for i := 1 to P do
    begin
        Readln(u, v);
        Merge(u, v, false);
    end;
    for i := 1 to Q do
    begin
        Readln(u, v);
        Merge(u, v, true);
    end;
    Writeln(MinBridge);
end;
begin
    {    Assign(Input, 'i.txt');
        Reset(Input);
        Assign(Output, 'o.txt');
        Rewrite(Output);     }
    Kruskal;
    {  Close(Input);
      Close(Output);  }
end.

