//Written on 6462 -- Jan 4, 2006
program tour;
{$Q-,R-}
const
  maxn=1000;
var
  adj:array[1..maxn,1..maxn]of boolean;
  order,belong,weight:array[1..maxn]of word;
  mark:array[1..maxn]of boolean;
  t,u,n,i,j,r,time:longint;
procedure dfs1(x:word);
  var
    i:word;
  begin
    mark[x]:=true;
    for i:=1 to n do
      if adj[x,i] and not mark[i] then
        dfs1(i);
    belong[x]:=r;
    inc(time);order[time]:=x;
  end;
procedure dfs2(x:word);
  var
    i:word;
  begin
    mark[x]:=false;
    for i:=1 to n do
      if adj[i,x] and mark[i] and (belong[i]=belong[x]) then
        dfs2(i);
    belong[x]:=r;inc(weight[r]);
  end;
begin
  read(t);
  for u:=1 to t do begin
    fillchar(adj,sizeof(adj),0);
    fillchar(weight,sizeof(weight),0);

    read(n);
    for i:=1 to n do begin
      read(j);
      while j>0 do begin
        read(r);adj[i,r]:=true;
        dec(j);
      end;
    end;

    time:=0;
    for r:=1 to n do
      if not mark[r] then
        dfs1(r);
    for i:=n downto 1 do begin
      r:=order[i];
      if mark[r] then
        dfs2(r);
    end;

    for i:=1 to n do
      if weight[belong[i]]>0 then
        for j:=1 to n do
          if adj[i,j] and (belong[i]<>belong[j]) then begin
            weight[belong[i]]:=0;
            break;
          end;
    r:=0;
    for i:=1 to n do
      if weight[i]>0 then
        if r=0 then r:=weight[i] else begin r:=0;break;end;
    writeln(r);
  end;
end.
