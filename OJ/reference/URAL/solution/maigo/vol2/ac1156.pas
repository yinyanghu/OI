program ural1156;
const
  maxn=50;
type
  solution=set of 1..maxn*2;
var
  g:array[1..maxn*2,1..maxn*2]of boolean;
  l:array[1..maxn*2]of byte;
  ok,newok:array[0..maxn]of boolean;
  way,newway:array[0..maxn]of solution;
  c:array[1..2]of byte;
  s:array[1..2]of solution;
  n,m,i,x,y:byte;
  first:boolean;
procedure fail;
  begin
    writeln('IMPOSSIBLE');
    halt;
  end;
procedure floodfill(x,v:byte);
  var
    more:boolean;
    i:byte;
  begin
    if l[x]+v=3 then fail;
    if l[x]=v then exit;
    l[x]:=v;
    inc(c[v]);
    s[v]:=s[v]+[x];
    for i:=1 to n*2 do
      if g[x,i] then floodfill(i,3-v);
  end;
procedure calway;
  var
    i,j:byte;
  begin
    if (c[1]>n) or (c[2]>n) then fail;
    fillchar(newok,sizeof(newok),0);
    for i:=1 to 2 do
      for j:=0 to n-c[i] do
        if ok[j] and not newok[j+c[i]] then begin
          newok[j+c[i]]:=true;
          newway[j+c[i]]:=way[j]+s[i];
        end;
    ok:=newok;
    way:=newway;
  end;
begin
  fillchar(g,sizeof(g),0);
  readln(n,m);
  for i:=1 to m do begin
    readln(x,y);
    g[x,y]:=true;g[y,x]:=true;
  end;

  fillchar(l,sizeof(l),0);
  fillchar(ok,sizeof(ok),0);
  fillchar(way,sizeof(way),0);
  ok[0]:=true;
  for i:=1 to n*2 do
    if l[i]=0 then begin
      c[1]:=0;c[2]:=0;
      fillchar(s,sizeof(s),0);
      floodfill(i,1);
      calway;
    end;

  if ok[n] then begin
    first:=true;
    for i:=1 to n*2 do
      if i in way[n] then begin
        if first then first:=false else write(' ');
        write(i);
      end;
    writeln;
    first:=true;
    for i:=1 to n*2 do
      if not (i in way[n]) then begin
        if first then first:=false else write(' ');
        write(i);
      end;
    writeln;
  end
  else
    fail;
end.
