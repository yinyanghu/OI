{
由题意知: 图形为正形.即它有外接圆，且N个顶点平分圆。
进而发现区分几个不同的N正形，是它的边的长度的不同
边由顶点连接成，所以边的长度由两顶点间间隔的顶点数的不同而不同。
问题转成从一个点出发，间隔几个点绕圆跳，跳N次且不于跳过的点重复.
设间隔的点为q, 而一定有1<=q<=n div 2 否则重复。
求q满足 i*k mod n (0<=k<=n-1) 的值不重复。
显然只要 k互素于n 就成立 
}
program Ural_1259(Input, Output);
const
    MaxN = 100000;
type
    TIndex = Longint;
    TFilter = array[1..MaxN] of Boolean;
var
    F: TFilter;
    N, M: TIndex;
    T, i, j: TIndex;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N);
    T := N;
    for i := 2 to N div 2 do
        if T mod i = 0 then
        begin
            while T mod i = 0 do
                T := T div i;
            for j := 1 to N div i do
                F[i * j] := true;
        end;
    M := 0;
    for i := 1 to N div 2 do
        Inc(M, Ord(not F[i]));
    Writeln(M);
end.

