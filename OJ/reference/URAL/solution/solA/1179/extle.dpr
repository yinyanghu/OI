program Ural_1179(Input, Output);
const
    ddd = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    MaxBased = 36;
type
    TIndex = Longint;
    TCount = array[2..MaxBased] of TIndex;
    TSet = array[2..MaxBased] of set of Char;
    TStatus = array[2..MaxBased] of Boolean;
var
    Based: TCount;
    Broken: TStatus;
    S: TSet;

procedure Main;
var
    Ch: Char;
    i, MaxIndex: TIndex;
begin
    FillChar(Based, SizeOf(Based), 0);
    FillChar(Broken, SizeOf(Broken), true);
    for i := 2 to MaxBased do
        if i <= 10 then
            S[i] := ['0'..Chr(i - 1 + Ord('0'))]
        else
            S[i] := ['0'..'9', 'A'..Chr(i - 11 + Ord('A'))];
    while not Eof do
    begin
        Read(Ch);
        for i := 2 to MaxBased do
            if (Ch in S[i]) and Broken[i] then
            begin
                Inc(Based[i]);
                Broken[i] := false;
            end
            else if not (Ch in S[i]) then
                Broken[i] := true;
    end;
    MaxIndex := 2;
    for i := 3 to MaxBased do
        if Based[i] > Based[MaxIndex] then
            MaxIndex := i;
    Writeln(MaxIndex, ' ', Based[MaxIndex]);
end;

procedure Ran;
var
    i: TIndex;
begin
    Randomize;
    for i := 1 to 44 do
    begin
        Write(ddd[Random(Length(ddd)) + 1]);
        if Random(10) = 0 then Writeln;
    end;
end;
begin
    {Assign(Output, 'i1.txt');
    Rewrite(Output);
    Ran;
    Close(Output);}
    Assign(Input, 'i1.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);

    Main;
    Close(Input);
    Close(Output);
end.

