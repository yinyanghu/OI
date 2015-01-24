const
        maxn       =       100;
var
        dist,
        heap,
        hpos       :       array[1..maxn] of longint;
        adj        :       array[1..maxn,1..maxn] of longint;
        used       :       array[1..maxn] of boolean;
        size,n,m   :       longint;

procedure prepare;
var
        i,j,k      :       longint;
begin
  fillchar(adj,sizeof(adj),0);
  assign(input,'d.in');reset(input);
  readln(n,m);
  for i:=1 to m do
    begin
      read(j,k);
      readln(adj[j,k]);
    end;
  close(input);
  fillchar(used,sizeof(used),false);
  fillchar(dist,sizeof(dist),127);
  dist[1]:=0;
  size:=n;
  for i:=1 to n do
    begin
      heap[i]:=i;
      hpos[i]:=i;
    end;
end;

procedure swap(i,j:longint);
var
        t:      longint;
begin
  hpos[heap[i]]:=j;
  hpos[heap[j]]:=i;
  t:=heap[i];
  heap[i]:=heap[j];
  heap[j]:=t;
end;

procedure swim(i:longint);
var
        j       :       longint;
begin
  repeat
  j:=i shr 1;
  if j<1 then exit;
  if dist[heap[i]]<dist[heap[j]] then swap(i,j) else exit;
  i:=j;
  until false;
end;

procedure sink(i:longint);
var
        j       :       longint;
begin
  repeat
    j:=i shl 1;
    if j>size then exit;
    if (j+1<=size) and (dist[heap[j]]>dist[heap[j+1]]) then inc(j);
    if dist[heap[i]]>dist[heap[j]] then swap(i,j) else exit;
    i:=j;
  until false;
end;

procedure relax(u,v,w:longint);
begin
  if dist[u]+w<dist[v] then
    begin
      dist[v]:=dist[u]+w;
      swim(hpos[v]);
    end;
end;

procedure work;
var
        i,j,k,min  :       longint;
begin
  for i:=1 to n do
    begin
      min:=heap[1];
      used[min]:=true;
      swap(1,size);
      dec(size);
      sink(1);
      for j:=1 to n do
        if not (used[j]) and (adj[min,j]<>0) then relax(min,j,adj[min,j]);
    end;
  writeln(dist[n]);
end;

begin
  prepare;
  work;
end.
