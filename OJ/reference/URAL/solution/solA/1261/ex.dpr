{
turn N to three based string like 12021.
but it's not valid.
three based valid string that onlt exists '0','1' because every coin is only one.
so number of delta,total money are both valid
so we define some rule:
if N[i]=2 then N[i]=0;N[i+1]++; namely N(i)++;
thus delta and total will be both valid
}
program Ural_1261(Input, Output);
const
    MaxLen = 21;//3^21>2^32
type
    TIndex = LongWord;
    TData = Int64;
    TNum = array[1..MaxLen + 1] of Shortint;
var
    D: TNum;
    Len: TIndex;
    N: TData;

function P(x: TIndex): TData;
var
    Res: TData;
begin
    Res := 1;
    while x > 0 do
    begin
        Dec(x);
        Res := Res * 3; 
    end;
    P := Res;
end;

procedure Main;
var
    i: TIndex;
    T, M: TData;
begin
    Readln(N);
    i := 0;
    T := N;
    while T > 0 do
    begin
        Inc(i);
        D[i] := T mod 3;
        T := T div 3;
    end;
    Len := i;
    M := 0;
    for i := 1 to Len do
    begin
        Inc(D[i + 1], D[i] div 3);
        D[i] := D[i] mod 3;
        if D[i] = 2 then
        begin
            Inc(M, P(i - 1));
            Inc(D[i + 1]);
            D[i] := 0;
        end;
        if M = 0 then  
            if D[i] = 0 then  //if not inc Delta and current can inc(current is always min so that it can keep valid)
            begin
                Inc(M, P(i - 1));
                D[i] := 1;
            end;
    end;
    if M = 0 then Inc(M, P(Len));
    Writeln(N + M, ' ', M);
end;
begin

    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);
      while not seekeof do    }
    Main;
    {Close(Input);
    Close(Output);    }
end.

