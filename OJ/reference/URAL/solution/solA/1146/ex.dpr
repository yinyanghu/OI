//17:52   18:00
(*Notice
Find All Row i,Row j (i<=j)
Unite Value Sum Row i to Row j (2D->1D)
Use Dp find MaxValue in 1D Row
f(i) is MaxLink before a(i) including a(i)
MaxValue=Max{f(i)=max{f(i-1)+a(i),0}}
*)
program Ural_1146(Input, Output);
const
    MaxN = 100;
type
    TIndex = Longint;
    TSum = array[0..MaxN, 1..MaxN] of TIndex;
var
    N, Max: TIndex;
    S: TSum;

procedure Main;
var
    i, j, k: TIndex;
    MaxCurrent, Last: TIndex;
begin
    FillChar(S, SizeOf(S), 0);
    Read(N);
    for i := 1 to N do
        for j := 1 to N do
            Read(S[i, j]);
    for i := 2 to N do
        for j := 1 to N do
            Inc(S[i, j], S[i - 1, j]);
    Max := 0;
    for i := 1 to N do
        for j := i to N do
        begin
            Last := 0;
            MaxCurrent := 0;
            for k := 1 to N do
            begin
                if Last + S[j, k] - S[i - 1, k] > 0 then
                    Inc(Last, S[j, k] - S[i - 1, k])
                else
                    Last := 0;
                if Last > MaxCurrent then
                    MaxCurrent := Last;
            end;
            if MaxCurrent > Max then
                Max := MaxCurrent;
        end;
    Writeln(Max);
end;
begin
  {   Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);}
    Main;
{     Close(Input);
     Close(Output);}
end.

