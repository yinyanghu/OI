program Ural_1297(Input, Output);
const
    MaxN = 1000;
type
    TIndex = Longint;
    TChar = array[1..MaxN] of Char;
    TNext = array[1..MaxN] of TIndex;
    TLast = array['A'..'z'] of TIndex;
var
    N: TIndex;
    P: TNext;
    L: TLast;
    S: TChar;
    MaxLength, MaxIndex: TIndex;

procedure Main;
var
    Ch: Char;
    i, j, k: TIndex;
    Valid: Boolean;
begin
    FillChar(P, SizeOf(P), 0);
    FillChar(L, SizeOf(L), 0);
    FillChar(S, SizeOf(S), 0);
    N := 0;
    while not Eoln do
    begin
        Read(Ch);
        if Ch in ['A'..'Z', 'a'..'z'] then
        begin
            Inc(N);
            S[N] := Ch;
            if L[Ch] > 0 then P[L[Ch]] := N;
            L[Ch] := N;
        end;
    end;
    if N = 0 then Exit;
    MaxLength := 1;
    MaxIndex := 1;
    for i := 1 to N do
    begin
        j := i;
        repeat
            j := P[j];
            if j = 0 then Break;
            if (j - i + 1) <= MaxLength then Continue;
            Valid := true;
            for k := 1 to (j - i - 1) div 2 do
                if S[i + k] <> S[j - k] then
                begin
                    Valid := false;
                    Break;
                end;
            if Valid then //Current must be larger then MaxLenth
            begin
                MaxIndex := i;
                MaxLength := j - i + 1;
            end;
        until false;
    end;
    for i := 1 to MaxLength do
        Write(S[MaxIndex + i - 1]);
    Writeln;
end;
begin
 {   Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Main;
    {Close(Input);
    Close(Output);    }
end.

