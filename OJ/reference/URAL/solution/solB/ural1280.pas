var
        x,y           :       array[1..100000] of longint;
        d             :       array[1..100000] of longint;
        n,m,i,j,k     :       longint;

begin
  readln(n,m);
  for i:=1 to m do
    readln(x[i],y[i]);
  for i:=1 to n do
    begin
      read(j);
      d[j]:=i;
    end;
  for i:=1 to m do
    if d[x[i]]>d[y[i]] then
      begin
        writeln('NO');
        halt;
      end;
  writeln('YES');
end.