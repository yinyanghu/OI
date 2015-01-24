program ural1326;
const
  maxn=20;
  e:array[1..maxn]of longint=(1,2,4,8,16,32,64,128,256,512,
    1024,2048,4096,8192,16384,32768,65536,131072,262144,524288);
  maxm=100+maxn;
  maxstatus=1048575;
  inf=65535;
var
  price:array[1..maxm]of word;
  tap:array[1..maxm]of longint;
  cost:array[0..maxstatus]of word;
  n,m,k,i,j,x:integer;
  target,next:longint;
begin
  read(n);
  for i:=1 to n do begin
    read(price[i]);
    tap[i]:=e[i];
  end;
  read(m);inc(m,n);
  for i:=n+1 to m do begin
    read(price[i],k);
    for j:=1 to k do begin
      read(x);
      inc(tap[i],e[x]);
    end;
  end;
  read(k);
  for i:=1 to k do begin
    read(x);
    inc(target,e[x]);
  end;
  for i:=1 to m do
    tap[i]:=tap[i] and target;

  for i:=1 to target do
    cost[i]:=inf;
  for i:=0 to target-1 do begin
    if cost[i]=inf then continue;
    for j:=1 to m do begin
      next:=i or tap[j];
      if cost[i]+price[j]<cost[next] then
        cost[next]:=cost[i]+price[j];
    end;
  end;

  writeln(cost[target]);
end.
