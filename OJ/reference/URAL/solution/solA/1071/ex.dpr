program Ural_1071(Input, Output);
const
    MaxLen = 20;
type
    TIndex = Longint;
    TData = record
        Len: TIndex;
        D: array[1..MaxLen] of TIndex;
    end;

function Match(DX, DY: TData): Boolean;
var
    i, j: TIndex;
begin
    Match := true;
    i := 0;
    j := 0;
    while (i < DY.Len) and (j < DX.Len) do
    begin
        Inc(i);
        Inc(j);
        while (DY.D[i] <> DX.D[j]) and (j < DX.Len) do
            Inc(j);
        if DY.D[i] <> DX.D[j] then
        begin
            Match := false;
            Exit;
        end;
    end;
    Match := (i = DY.Len) and (DY.D[DY.Len] = DX.D[j]);
end;

procedure Change(T, B: TIndex; var D: TData);
begin
    FillChar(D, SizeOf(D), 0);
    D.Len := 0;
    while T <> 0 do
    begin
        Inc(D.Len);
        D.D[D.Len] := T mod B;
        T := T div B;
    end;
end;

procedure Main;
var
    X, Y: TIndex;
    i: TIndex;
    DX, DY: TData;
begin
    Readln(X, Y);
    for i := 2 to X do
    begin
        Change(X, i, DX);
        Change(Y, i, DY);
        if Match(DX, DY) then
        begin
            Writeln(i);
            Exit;
        end;
    end;
    Writeln('No solution');
end;
begin
    {   Assign(Input, 'i.txt');
       Reset(Input);
       Assign(Output, 'o.txt');
       Rewrite(Output);  }
    Main;
    {    Close(Input);
        Close(Output);     }
end.

