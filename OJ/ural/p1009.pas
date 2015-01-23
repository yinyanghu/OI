program p1009;
const maxn=16;
var c:array[0..maxn] of longint;
    n,k,i:longint;
begin
    readln(n,k);
    c[0]:=1; c[1]:=k-1;
    for i:=2 to n do c[i]:=(k-1)*(c[i-1]+c[i-2]);
    writeln(c[n]);
end.