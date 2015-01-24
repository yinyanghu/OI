program Ural_1054(Input, Output);
const
    MaxN = 31;
type
    TIndex = Longint;
    TData = array[1..MaxN] of Longint;
    TPowerOfTwo = array[0..MaxN - 1] of Longint;
var
    PT: TPowerOfTwo;
    D: TData;
    N, M: TIndex;
    Error: Boolean;

procedure Hanoi(N_, From, To_, Temp: TIndex);
begin
    if (N_ > 0) and (not Error) then
    begin
        if D[N_] = From then
            Hanoi(N_ - 1, From, Temp, To_)
        else if D[N_] = To_ then
        begin
            Inc(M, PT[N_ - 1]);
            Hanoi(N_ - 1, Temp, To_, From)
        end
        else
        begin
            M := -1;
            Error := true;
        end;
    end;
end;

procedure Main;
var
    i: TIndex;
begin
    PT[0] := 1;
    for i := 1 to MaxN - 1 do
        PT[i] := PT[i - 1] * 2;
    Readln(N);
    for i := 1 to N do
    begin
        Read(D[i]);
        if not (D[i] in [1..3]) then
        begin
            Writeln(-1);
            Exit;
        end;
    end;
    M := 0;
    Error := false;
    Hanoi(N, 1, 2, 3);
    Writeln(M);
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);   }
    Main;
    {  Close(Input);
      Close(Output);   }
end.

