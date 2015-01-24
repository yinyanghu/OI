{
这道题目是一个组合数学问题，处理方法很多。我的方法是这样的。
首先，不难发现两种颜色的球，放入盒子中，是互不相干的。所以总方案数应该是两种颜色
的球放入n个盒子里的方案数的积。对于n个盒子，未必放全a个球，球是相同的，盒子不相同
，可重复的组合书可以这样来解决。因为未必放全a个球，所以可以把未放入n个盒子里的球，
视为放入了第n+1个盒子。接下来可重复排列，所以总方案数是C(n+1+a-1,a)=C(n+a,a)
因此这道题目的结果应该是C(n+a,a)*C(n+b,b)
}
program Ural_1114(Input, output);
const
    MaxLen = 100;
type
    TIndex = Longint;
    TData = record
        D: array[1..MaxLen] of Longint;
        Len: TIndex;
    end;
var
    N, A, B: TIndex;
    X: TData;

procedure Multiplication(Multiplier: TIndex);
var
    i: TIndex;
begin
    for i := 1 to X.Len do
        X.D[i] := X.D[i] * Multiplier;
    for i := 1 to X.Len do
    begin
        Inc(X.D[i + 1], X.D[i] div 10);
        X.D[i] := X.D[i] mod 10;
    end;
    while X.D[X.Len + 1] > 0 do
    begin
        Inc(X.Len);
        Inc(X.D[X.Len + 1], X.D[X.Len] div 10);
        X.D[X.Len] := X.D[X.Len] mod 10;
    end;
end;

procedure Division(Divisor: TIndex);
var
    i, Residue: TIndex;
begin
    Residue := 0;
    for i := X.Len downto 1 do
    begin
        Residue := Residue * 10 + X.D[i];
        X.D[i] := Residue div Divisor;
        Residue := Residue mod Divisor;
    end;
    while X.D[X.Len] = 0 do
        Dec(X.Len);
end;

procedure Main;
var
    i: TIndex;
begin
    Readln(N, A, B);
    FillChar(X, SizeOf(X), 0);
    X.D[1] := 1;
    X.Len := 1;
    for i := 1 to A do
        Multiplication(N + A - i + 1);
    for i := 1 to A do
        Division(i);
    for i := 1 to B do
        Multiplication(N + B - i + 1);
    for i := 1 to B do
        Division(i);
    for i := X.Len downto 1 do
        Write(X.D[i]);
    Writeln;
end;
begin
    Main;
end. 
