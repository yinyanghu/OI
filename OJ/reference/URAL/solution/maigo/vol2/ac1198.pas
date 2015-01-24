program ural1198;
const
  maxn=2000;
var
  graph:array[1..maxn,1..maxn]of boolean;
  indeg,belong:array[1..maxn]of word;
  v:array[0..maxn]of word;
  mark:array[1..maxn]of byte;
  n,i,x,in0,c:longint;
procedure shrink(x:longint);
  var
    y,i:longint;
  begin
    repeat
      y:=v[c];
      for i:=1 to n do begin
        if graph[y,i] then graph[x,i]:=true;
        if graph[i,y] then graph[i,x]:=true;
      end;
      belong[y]:=belong[x];
      v[c+1]:=0;dec(c);
    until v[c]=x;
    graph[x,x]:=false;v[c+1]:=0;
    for i:=1 to n do if (belong[i]=i) and graph[i,x] then exit;
    if in0=0 then in0:=x else begin writeln(0);halt;end;
  end;
procedure pathcomp(x:longint);
  var
    r,t:longint;
  begin
    r:=x;while belong[r]<>r do r:=belong[r];
    while x<>r do begin t:=belong[x];belong[x]:=r;x:=t;end;
  end;
begin
  read(n);
  for i:=1 to n do
    repeat
      read(x);if x=0 then break;
      if x=i then continue;
      graph[i,x]:=true;
      inc(indeg[x]);
    until false;

  for i:=1 to n do begin
    if indeg[i]=0 then
      if in0=0 then in0:=i else begin writeln(0);halt;end;
    belong[i]:=i;
  end;

  for i:=1 to n do begin
    if mark[i]>0 then continue;
    c:=0;v[c]:=i;mark[i]:=1;
    repeat
      inc(v[c+1]);x:=v[c+1];
      if graph[v[c],x] and (belong[x]=x) then
        case mark[x] of
          0:begin inc(c);mark[x]:=1;end;
          1:shrink(x);
        end;
      while (c>=0) and (v[c+1]=n) do begin
        v[c+1]:=0;mark[v[c]]:=2;dec(c);
      end;
    until c<0;
  end;

  for i:=1 to n do begin
    pathcomp(i);
    if belong[i]=in0 then write(i,' ');
  end;
  writeln(0);
end.
