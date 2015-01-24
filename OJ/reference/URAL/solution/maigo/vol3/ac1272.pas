program ural1272;
const
  maxn=10000;
var
  root:array[1..maxn]of word;
  n,k,i,x,y:word;
procedure pathcomp(x:word);
  var
    r,t:word;
  begin
    r:=x;
    while root[r]<>r do
      r:=root[r];
    while root[x]<>r do begin
      t:=root[x];
      root[x]:=r;
      x:=t;
    end;
  end;
begin
  read(n,k,i{i is useless});
  for i:=1 to n do
    root[i]:=i;
  dec(n);
  for i:=1 to k do begin
    read(x,y);
    pathcomp(x);pathcomp(y);
    if root[x]=root[y] then continue;
    dec(n);
    root[root[x]]:=root[y];
  end;
  writeln(n);
end.
