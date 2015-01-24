program Ural_1060(Input, Output);
const
    MaxN = 4;
type
    TIndex = Byte;
    TData = Longint;
    TMatrix = array[1..MaxN, 1..MaxN] of Boolean;
var
    InitialMatrix, CurrentMatrix: TMatrix;
    Min: TData;

function IsValid: Boolean;
var
    i, j: TIndex;
begin
    IsValid := true;
    for i := 1 to MaxN do
        for j := 1 to MaxN do
            if CurrentMatrix[i, j] = not CurrentMatrix[1, 1] then
            begin
                IsValid := false;
                Exit;
            end;
end;

procedure Change(X, Y: TIndex);
begin
    if (X > 0) and (X <= MaxN) and (Y > 0) and (Y <= MaxN) then
        CurrentMatrix[X, Y] := not CurrentMatrix[X, Y];
end;

procedure Search(X, Y, P: TIndex);
begin
    if P >= Min then
        Exit;
    if Y > MaxN then
    begin
        Inc(X);
        Y := 1;
    end;
    if IsValid then
        if P < Min then
        begin
            Min := P;
            Exit;
        end;
    if X > MaxN then
        Exit;
    Search(X, Y + 1, P);
    Change(X - 1, Y);
    Change(X, Y - 1);
    Change(X + 1, Y);
    Change(X, Y + 1);
    Change(X, Y);
    Search(X, Y + 1, P + 1);
    Change(X - 1, Y);
    Change(X, Y - 1);
    Change(X + 1, Y);
    Change(X, Y + 1);
    Change(X, Y);
end;

procedure Main;
var
    i, j: TIndex;
    St: string;
begin
    for i := 1 to MaxN do
    begin
        Readln(St);
        for j := 1 to MaxN do
            InitialMatrix[i, j] := (St[j] = 'b');
    end;
    CurrentMatrix := InitialMatrix;
    Min := MaxLongint;
    Search(1, 1, 0);
    if Min = MaxLongint then
        Writeln('Impossible')
    else
        Writeln(Min);
end;
begin
  {  assign(input, 'i.txt');
    reset(input);
    assign(output, 'o.txt');
    rewrite(output);    }
    Main;
 {   close(input);
    close(output);   }
end.

