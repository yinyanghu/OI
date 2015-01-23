program ballbox;
var f:array[0..20,0..20] of longint;
    i,j,k,m,n,r:longint;
begin
    readln(n,r);
    fillchar(f,sizeof(f),0);
    f[0,0]:=1; f[1,1]:=1;
    for i:=2 to n do f[i,i]:=f[i-1,i-1]*i;
    for i:=1 to n do
      for j:=1 to r do
        f[i,j]:=j*(f[i-1,j]+f[i-1,j-1]);
    writeln(f[n,r]);
end.