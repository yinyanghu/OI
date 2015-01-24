program ural1137;
const
  maxid=10000;
  maxedges=100000;
var
  v1,v2:array[0..maxedges]of word;
  now:array[1..maxid]of longint;
  s:array[0..maxedges]of word;
  n,m,i,j,t,c:longint;
  {I thought this prog should take up at least 997KB memory, and was sure to
   get MLE. But it turned out to use only 405KB! Ft...}
procedure qsort(s,t:longint);
  var
    p,i,j:longint;
    t1,t2:word;
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
begin
  read(n);
  for i:=1 to n do begin
    read(m);read(t);
    for j:=1 to m do begin
      read(m);inc(c);v2[c]:=t;v1[c]:=m;t:=m;
    end;
  end;

  qsort(1,c);
  for i:=1 to c do
    now[v1[i]]:=i;

  write(c);s[0]:=v1[1];t:=0;
  repeat
    if v1[now[s[t]]]=s[t] then begin
      inc(t);s[t]:=v2[now[s[t-1]]];dec(now[s[t-1]]);
    end
    else begin
      write(' ',s[t]);dec(t);
    end;
  until t<0;
  writeln;
end.
