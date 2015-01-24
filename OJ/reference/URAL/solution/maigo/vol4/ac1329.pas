program ural1329;
const
  maxn=40001;
var
  child,pre,now,from,till:array[1..maxn]of word;
  n,l,i,x,y,r:longint;
procedure dfs(p:word);
  begin
    inc(x);
    from[p]:=x;
    while now[p]>0 do begin
      dfs(child[now[p]]);
      now[p]:=pre[now[p]];
    end;
    till[p]:=x;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(x,y);inc(x);inc(y);
    if y=0 then
      r:=x
    else begin
      child[i]:=x;
      pre[i]:=now[y];
      now[y]:=i;
    end;
  end;

  x:=0;
  dfs(r);

  read(l);
  for i:=1 to l do begin
    read(x,y);inc(x);inc(y);
    if (from[y]>from[x]) and (from[y]<=till[x]) then
      writeln(1)
    else if (from[x]>from[y]) and (from[x]<=till[y]) then
      writeln(2)
    else
      writeln(0);
  end;
end.
