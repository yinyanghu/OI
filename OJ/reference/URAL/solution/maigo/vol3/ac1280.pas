program ural1280;
const
  maxn=1000;
  maxm=100000;
var
  v1,v2:array[1..maxm]of word;
  p:array[1..maxn]of word;
  n,x:word;
  m,i:longint;
begin
  read(n,m);
  for i:=1 to m do
    read(v1[i],v2[i]);
  for i:=1 to n do begin
    read(x);
    p[x]:=i;
  end;
  for i:=1 to m do
    if p[v1[i]]>p[v2[i]] then begin
      writeln('NO');
      halt;
    end;
  writeln('YES');
end.
