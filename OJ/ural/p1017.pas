program p1017;
var f:array[0..500] of int64;
    n,i,j:longint;
begin
    fillchar(f,sizeof(f),0);
    readln(n);
    f[0]:=1;
    for i:=1 to n do
      for j:=n downto i do f[j]:=f[j]+f[j-i];
    dec(f[n]);
    writeln(f[n]);
end.