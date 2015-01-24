program Ural_1122(Input, Output);
const
    MaxN = 4;
    MaxM = 3;
type
    TIndex = Byte;
    TData = Longint;
    TMatrix = array[1..MaxN, 1..MaxN] of Boolean;
    TRuleMatrix = array[1..MaxM, 1..MaxM] of Boolean;
var
    InitialMatrix, CurrentMatrix: TMatrix;
    RuleMatrix: TRuleMatrix;
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
var
    i, j: TIndex;
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
    for i := 1 to MaxM do
        for j := 1 to MaxM do
            if RuleMatrix[i, j] then
                Change(X + i - 2, Y + j - 2);
    Search(X, Y + 1, P + 1);
    for i := 1 to MaxM do
        for j := 1 to MaxM do
            if RuleMatrix[i, j] then
                Change(X + i - 2, Y + j - 2);
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
            InitialMatrix[i, j] := (St[j] = 'B');
    end;
    for i := 1 to MaxM do
    begin
        Readln(St);
        for j := 1 to MaxM do
            RuleMatrix[i, j] := (St[j] = '1');
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
   { assign(input, 'i.txt');
    reset(input);
    assign(output, 'o.txt');
    rewrite(output);       }
    Main;
  {  close(input);
    close(output);  }
end.

