program Ural_1061(Input, Output);
const
    MaxN = 100000;
type
    TIndex = Longint;
    TData = array[1..MaxN] of Char;
var
    N, K: TIndex;
    D: TData;

procedure Main;
var
    i, t: TIndex;
    S, Min, MinIndex: TIndex;
    Locked: Boolean;
begin
    Readln(N, K);
    if N < K then
    begin
        Writeln(0);
        Exit;
    end;
    for i := 1 to N do
        repeat
            Read(D[i]);
        until D[i] in ['0'..'9', '*'];
    Min := MaxLongint;
    MinIndex := 0;
    i := 0;
    Locked := true;
    S := 0;
    while i < N do
    begin
        if Locked then
        begin
            t := 0;
            Locked := false;
            S := 0;
            while (i < N) and (t < K) do
            begin
                Inc(i);
                Inc(t);
                if D[i] = '*' then Break;
                Inc(S, Ord(D[i]) - Ord('0'));
            end;
            if D[i] = '*' then
            begin
                Locked := true;
                Continue;
            end;
            if (t = K) and (S < Min) then
            begin
                Min := S;
                MinIndex := i - K + 1;
            end;
        end
        else
        begin
            Inc(i);
            if D[i] = '*' then
            begin
                Locked := true;
                Continue;
            end;
            S := S - (Ord(D[i - K]) - Ord('0')) + (Ord(D[i]) - Ord('0'));
            if (S < Min) then
            begin
                Min := S;
                MinIndex := i - K + 1;
            end;
        end;
    end;
    Writeln(MinIndex);
end;

begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);      }
    Main;
   { Close(Input);
    Close(Output);        }
end.

