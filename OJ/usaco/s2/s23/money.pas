{
ID:lijianx1
PROG:money
LANG:PASCAL
}
program money;
const maxn=25;
      maxm=10000;
var i,j,n,m:longint;
    a:array[1..maxn] of longint;
    f:array[0..maxn,0..maxm] of int64;
begin
    assign(input,'money.in'); reset(input);
    readln(n,m);
    for i:=1 to n do read(a[i]);
    close(input);
    fillchar(f,sizeof(f),0);
    f[0,0]:=1;
    for i:=1 to n do
	for j:=0 to m do
           if j>=a[i] then f[i,j]:=f[i-1,j]+f[i,j-a[i]]
               else f[i,j]:=f[i-1,j];
    assign(output,'money.out'); rewrite(output);
    writeln(f[n,m]);
    close(output);
end.