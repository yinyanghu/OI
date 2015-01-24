program ural1282;
const
  maxn=1000;
var
  leaf:array[1..maxn]of boolean;
  level,parent,children:array[1..maxn]of word;
  result:array[1..maxn]of shortint;
  n,i:word;
  c:char;
procedure callevel(x:word);
  begin
    inc(children[parent[x]]);
    if level[parent[x]]=0 then callevel(parent[x]);
    level[x]:=level[parent[x]]+1;
  end;
procedure submit(x:word;r:shortint);
  begin
    if odd(level[x]) then begin
      if r>result[x] then result[x]:=r;
    end
    else
      if r<result[x] then result[x]:=r;
    if x=1 then exit;
    dec(children[x]);
    if children[x]=0 then submit(parent[x],result[x]);
  end;
begin
  readln(n);
  for i:=2 to n do begin
    read(c,parent[i]);
    if c='L' then begin
      leaf[i]:=true;
      readln(result[i]);
    end
    else
      readln;
  end;

  level[1]:=1;
  for i:=1 to n do
    if leaf[i] then callevel(i);
  for i:=1 to n do
    if not leaf[i] then
      if odd(level[i]) then result[i]:=-1 else result[i]:=1;

  for i:=1 to n do
    if leaf[i] then
      submit(parent[i],result[i]);

  if result[1]=1 then
    writeln('+1')
  else
    writeln(result[1]);
end.
