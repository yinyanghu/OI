program ural1320;
const
  n=1000;
var
  root:array[1..n]of word;
  edges:array[1..n]of longint;
  i,j:word;
procedure pathcomp(x:word);
  var
    r,t:word;
  begin
    r:=x;
    while root[r]<>r do
      r:=root[r];
    repeat
      t:=root[x];
      root[x]:=r;
      x:=t;
    until root[x]=r;
  end;
begin
  for i:=1 to n do
    root[i]:=i;

  while not seekeof do begin
    read(i,j);
    pathcomp(i);
    pathcomp(j);
    if root[i]<>root[j] then begin
      inc(edges[root[j]],edges[root[i]]);
      root[root[i]]:=root[j];
    end;
    inc(edges[root[j]]);
  end;

  for i:=1 to n do
    if (root[i]=i) and odd(edges[i]) then begin
      writeln(0);
      halt;
    end;
  writeln(1);
end.
