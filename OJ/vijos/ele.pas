program exp;
var f:array[-5..50] of extended;
    n,m,i:integer;
begin
    readln(n,m);
    fillchar(f,sizeof(f),0);
    f[-1]:=1;  f[0]:=1;
    for i:=1 to n do f[i]:=2*f[i-1]-f[i-m-1];
    writeln(f[n]:0:0);
end.
