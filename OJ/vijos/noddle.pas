program noddle;
var a:array[1..1000] of longint;
    i,j,k,m:longint;
begin
    readln(m);
    for i:=1 to m do read(a[i]);
    for j:=m downto 2 do
      for k:=1 to j-1 do a[k]:=a[k+1]-a[k];
    for j:=2 to m do a[1]:=a[1]+a[j];
    writeln(a[1]);
end.