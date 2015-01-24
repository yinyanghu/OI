program ural1182;
const
  maxn=100;
type
  solution=set of 1..maxn;
var
  g:array[1..maxn,1..maxn]of byte;
  l:array[1..maxn]of byte;
  ok,newok:array[0..maxn div 2]of boolean;
  way,newway:array[0..maxn div 2]of solution;
  c:array[1..2]of byte;
  s:array[1..2]of solution;
  n,i,x:byte;
procedure fail;
  begin
    writeln('No solution');
    halt;
  end;
procedure floodfill(x,v:byte);
  var
    i:byte;
  begin
    if l[x]+v=3 then fail;
    if l[x]=v then exit;
    l[x]:=v;
    inc(c[v]);
    s[v]:=s[v]+[x];
    for i:=1 to n do
      if g[x,i]>0 then floodfill(i,3-v);
  end;
procedure calway;
  var
    i,j:byte;
  begin
    fillchar(newok,sizeof(newok),0);
    for i:=1 to 2 do
      if n div 2>=c[i] then
        for j:=0 to n div 2-c[i] do
          if ok[j] and not newok[j+c[i]] then begin
            newok[j+c[i]]:=true;
            newway[j+c[i]]:=way[j]+s[i];
          end;
    ok:=newok;
    way:=newway;
  end;
begin
  readln(n);
  fillchar(g,sizeof(g),2);
  for i:=1 to n do
    g[i,i]:=0;
  for i:=1 to n do
    repeat
      read(x);
      if x=0 then break;
      dec(g[i,x]);
      dec(g[x,i]);
    until false;

  fillchar(l,sizeof(l),0);
  fillchar(ok,sizeof(ok),0);
  fillchar(way,sizeof(way),0);
  ok[0]:=true;
  for i:=1 to n do
    if l[i]=0 then begin
      c[1]:=0;c[2]:=0;
      fillchar(s,sizeof(s),0);
      floodfill(i,1);
      calway;
    end;

  x:=n div 2;
  while not ok[x] do dec(x);
  write(x);
  for i:=1 to n do
    if i in way[x] then
      write(' ',i);
  writeln;
  write(n-x);
  for i:=1 to n do
    if not (i in way[x]) then
      write(' ',i);
  writeln;
end.
