program floyd;
const maxn=100;
var f:array[1..maxn,1..maxn] of longint;
    i,j,k,n,x,y,m:longint;
begin
    assign(input,'floyd2.in'); reset(input);
    assign(output,'floyd2.out'); rewrite(output);
    readln(n,m);
    for i:=1 to n do
      for j:=1 to n do
         if i=j then f[i,j]:=0
             else f[i,j]:=maxint;
    for i:=1 to m do begin
        readln(x,y,k);
        f[x,y]:=k;
        f[y,x]:=k;
    end;
    close(input);
    for k:=1 to n do
      for i:=1 to n do
         for j:=1 to n do
             if f[i,k]+f[k,j]<f[i,j] then f[i,j]:=f[i,k]+f[k,j];
    for i:=1 to n do begin
        for j:=1 to n do write(f[i,j],' ');
        writeln;
    end;
    close(output);
end.
