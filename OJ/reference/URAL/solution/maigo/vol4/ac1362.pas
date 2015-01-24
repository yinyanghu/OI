program ural1362;
const
  maxn=100000;
  maxe=maxn*2-2;
var
  v2,pre:array[1..maxe]of longint;
  last,time,a:array[1..maxn]of longint;
  v:array[1..maxn]of boolean;
  n,i,c,x,root:longint;
procedure qsort(s,t:longint);
  var
    p,i,j,tmp:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tmp:=a[p];a[p]:=a[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (a[j]<tmp) do dec(j);
      if i=j then break;a[i]:=a[j];inc(i);
      while (i<j) and (a[i]>tmp) do inc(i);
      if i=j then break;a[j]:=a[i];dec(j);
    until i=j;
    a[i]:=tmp;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
procedure dp(x:longint);
  var
    p,c:longint;
  begin
    v[x]:=true;p:=last[x];c:=0;
    while p>0 do begin
      if not v[v2[p]] then begin
        dp(v2[p]);c:=p;
      end
      else
        if c=0 then last[x]:=pre[p] else pre[c]:=pre[p];
      p:=pre[p];
    end;
    c:=0;p:=last[x];
    while p>0 do begin
      inc(c);a[c]:=time[v2[p]];p:=pre[p];
    end;
    qsort(1,c);
    for i:=1 to c do
      if a[i]+i>time[x] then time[x]:=a[i]+i;
  end;
begin
  read(n);
  for i:=1 to n do
    repeat
      read(x);
      if x=0 then break;
      inc(c);v2[c]:=x;pre[c]:=last[i];last[i]:=c;
      inc(c);v2[c]:=i;pre[c]:=last[x];last[x]:=c;
    until false;
  read(root);
  dp(root);
  writeln(time[root]);
end.
