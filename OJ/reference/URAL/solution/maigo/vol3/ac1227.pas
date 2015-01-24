program ural1227;
const
  maxm=100;
var
  d:array[1..maxm,1..maxm]of longint;
  v:array[1..maxm]of boolean;
  l1,l2:array[1..maxm]of longint;
  m,n,p,q,l,s,i:longint;
procedure succeed;
  begin
    writeln('YES');
    halt;
  end;
procedure dfs(x:byte);
  var
    i:byte;
    l:longint;
  begin
    if v[x] then succeed;
    v[x]:=true;
    for i:=1 to m do begin
      if d[x,i]=0 then continue;
      d[i,x]:=0;
      dfs(i);
      l:=d[x,i]+l1[i];
      if l>l1[x] then begin
        l2[x]:=l1[x];l1[x]:=l;
      end
      else if l>l2[x] then
        l2[x]:=l;
    end;
  end;
begin
  read(m,n,s);
  for i:=1 to n do begin
    read(p,q,l);
    if d[p,q]>0 then succeed;
    d[p,q]:=l;d[q,p]:=l;
  end;

  for i:=1 to m do
    if not v[i] then dfs(i);
  for i:=1 to m do
    if s<=l1[i]+l2[i] then succeed;
  writeln('NO');
end.
