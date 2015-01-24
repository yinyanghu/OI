{
ID:lijianx1
PROG:numtri
LANG:PASCAL
}
program numtri;
var a,f:array[0..1000,0..1000] of longint;
    i,j,k,m,n:longint;
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

begin
    assign(input,'numtri.in'); reset(input);
    assign(output,'numtri.out'); rewrite(output);
    readln(n);
    for i:=1 to n do
        for j:=1 to i do read(a[i,j]);
    for i:=1 to n do f[n,i]:=a[n,i];
    for i:=n-1 downto 1 do
        for j:=1 to i do f[i,j]:=max(f[i+1,j+1],f[i+1,j])+a[i,j];
    writeln(f[1,1]);
    close(input);
    close(output);
end.