program ural1314;
const
  maxnodes=2500;
  maxedges=4900;
  maxid=32767;
  inf=32767;
type
  list=array[1..maxid]of word;
var
  v1,v2:array[0..maxedges]of word;
  last,d1,d2:list;
  q:array[1..maxnodes]of word;
  n,k,i,j,x,y,e:word;
procedure qsort(s,t:word);
  var
    p,i,j,t1,t2:word;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    t1:=v1[p];t2:=v2[p];v1[p]:=v1[s];v2[p]:=v2[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (v1[j]>=t1) do dec(j);
      if i=j then break;v1[i]:=v1[j];v2[i]:=v2[j];inc(i);
      while (i<j) and (v1[i]<=t1) do inc(i);
      if i=j then break;v1[j]:=v1[i];v2[j]:=v2[i];dec(j);
    until i=j;
    v1[i]:=t1;v2[i]:=t2;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
procedure bfs(s:word;var d:list);
  var
    f,r,i:word;
  begin
    for i:=1 to maxid do
      d[i]:=inf;
    f:=0;r:=1;q[1]:=s;d[s]:=0;
    repeat
      inc(f);
      i:=last[q[f]];
      repeat
        if d[v2[i]]=inf then begin
          inc(r);
          q[r]:=v2[i];
          d[v2[i]]:=d[v1[i]]+1;
        end;
        dec(i);
      until v1[i]<q[f];
    until f=r;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(k,x);
    for j:=2 to k do begin
      read(y);
      inc(e);v1[e]:=x;v2[e]:=y;
      inc(e);v1[e]:=y;v2[e]:=x;
      x:=y;
    end;
  end;

  qsort(1,e);
  for i:=1 to e do
    last[v1[i]]:=i;

  read(k,x);dec(k);
  if k=0 then
    y:=x
  else
    for i:=1 to k do
      read(y);

  bfs(x,d1);
  bfs(y,d2);

  for i:=1 to maxid do
    if (last[i]>0) and (d1[i]-d2[i]=k) then writeln(i);
end.
