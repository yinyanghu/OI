program ural1039;
const
  maxn=6000;
var
  pres:array[1..maxn]of boolean;{True if he can be president}
  now,child,pre:array[1..maxn]of word;
  yes,no:array[1..maxn]of longint;
  n,i,x,y:word;
  root:longint;
function max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;
procedure dfs(v:word);
  begin
    while now[v]>0 do begin
      dfs(child[now[v]]);
      inc(yes[v],no[child[now[v]]]);
      inc(no[v],max(yes[child[now[v]]],no[child[now[v]]]));
      now[v]:=pre[now[v]];
    end;
  end;
begin
  read(n);
  for i:=1 to n do
    read(yes[i]);
  fillchar(pres,sizeof(pres),1);
  root:=n*(n+1) div 2;
  for i:=1 to n-1 do begin
    read(x,y);
    child[i]:=x;
    pre[i]:=now[y];
    now[y]:=i;
    if pres[x] then begin
      dec(root,x);
      pres[x]:=false;
    end;
  end;

  dfs(root);

  writeln(max(yes[root],no[root]));
end.
