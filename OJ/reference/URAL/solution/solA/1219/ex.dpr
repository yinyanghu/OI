program Ural_1219(Input, Output);
{
Every letter occurs not more than 40 000 times in the sequence;
26P1=26
1,000,000/26 < 40,000
Every possible subsequence with two letters length occurs not more than 2 000 times;
26P2=650
1,000,000/650 < 2,000
Every possible subsequence with three letters length occurs not more than 100 times;
26P3=15600
1,000,000/15600 < 100
}
const
    MaxLen = 1000000;
type
    TIndex = Longint;
var
    i: TIndex;
begin
    Randomize;
    for i := 1 to MaxLen do
        Write(Chr(Random(26) + Ord('a')));
end.

