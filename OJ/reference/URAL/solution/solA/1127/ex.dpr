program Ural_1127(Input, Output);
const
    MaxHashLen = 9999;
type
    TIndex = Longint;
    THash = array[0..MaxHashLen] of TIndex;
var
    F: THash;
    N: TIndex;

procedure Ins(a, b, c, d: TIndex);
var
    Min: TIndex;
begin
    Min := a * 1000 + b * 100 + c * 10 + d;
    if b * 1000 + c * 100 + d * 10 + a < Min then
        Min := b * 1000 + c * 100 + d * 10 + a;
    if c * 1000 + d * 100 + a * 10 + b < Min then
        Min := c * 1000 + d * 100 + a * 10 + b;
    if d * 1000 + a * 100 + b * 10 + c < Min then
        Min := d * 1000 + a * 100 + b * 10 + c;
    Inc(F[Min]);
end;

function HashCode(Ch: Char): TIndex;
begin
    case Ch of
        'A': HashCode := 0;
        'B': HashCode := 1;
        'C': HashCode := 2;
        'G': HashCode := 3;
        'O': HashCode := 4;
        'R': HashCode := 5;
        'S': HashCode := 6;
        'V': HashCode := 7;
        'W': HashCode := 8;
        'Y': HashCode := 9;
        else
            HashCode := -1;
    end;
end;

procedure Main;
var
    i: TIndex;
    Max: TIndex;
    St: string;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N);
    for i := 1 to N do
    begin
        Readln(St);
        //f,ri,l,r,t,b
        //1,2,3,4,5,6
        //without f,r and r,f
        Ins(HashCode(St[5]), HashCode(St[3]), HashCode(St[6]), HashCode(St[2])); //t,l,b,ri
        Ins(HashCode(St[5]), HashCode(St[2]), HashCode(St[6]), HashCode(St[3])); //t,ri,b,l
        //without l,ri and ri,l
        Ins(HashCode(St[5]), HashCode(St[1]), HashCode(St[6]), HashCode(St[4])); //t,f,b,r
        Ins(HashCode(St[5]), HashCode(St[4]), HashCode(St[6]), HashCode(St[1])); //t,r,b,f
        //without t,b and b,t
        Ins(HashCode(St[3]), HashCode(St[1]), HashCode(St[2]), HashCode(St[4])); //l,f,ri,r
        Ins(HashCode(St[3]), HashCode(St[4]), HashCode(St[2]), HashCode(St[1])); //l,r,ri,f
    end;
    Max := 0;
    for i := 0 to 9999 do
        if F[i] > Max then
            Max := F[i];
    Writeln(Max);
end;
begin
    {  Assign(Input, 'i.txt');
          Reset(Input);
          Assign(Output, 'o.txt');
          Rewrite(Output); }
    Main;
    {  Close(Input);
      Close(Output);  }
end.

