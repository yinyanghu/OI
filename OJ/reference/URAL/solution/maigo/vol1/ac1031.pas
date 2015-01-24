program ural1031;
const
  maxn=10000;
var
  dist,cost:array[1..maxn]of longint;
  l1,l2,l3,c1,c2,c3,d,c:longint;
  n,s,t,i,j:integer;
begin
  readln(l1,l2,l3,c1,c2,c3,n,s,t);
  if s>t then begin n:=s;s:=t;t:=n;end;
  for i:=2 to t do readln(dist[i]);
  cost[s]:=0;
  for i:=s+1 to t do begin
    cost[i]:=maxlongint;
    for j:=i-1 downto s do begin
      d:=dist[i]-dist[j];
      if d>l3 then break;
      if d>l2 then
        c:=cost[j]+c3
      else if d>l1 then
        c:=cost[j]+c2
      else
        c:=cost[j]+c1;
      if c<cost[i] then cost[i]:=c;
    end;
  end;
  writeln(cost[t]);
end.
