program ural1211;
const
  maxn=25000;
var
  next,deg:array[1..maxn]of word;
  t,i:word;
procedure check;
  var
    n,i,e:word;
  procedure go(x:word);
    var
      t:word;
    begin
      while (deg[x]=0) and (next[x]>0) do begin
        dec(e);dec(deg[next[x]]);
        t:=next[x];next[x]:=0;x:=t;
      end;
    end;
  begin
    read(n);e:=0;fillchar(deg,sizeof(deg),0);
    for i:=1 to n do begin
      read(next[i]);
      if next[i]<>0 then begin
        inc(deg[next[i]]);inc(e);
      end;
    end;
    if e<>n-1 then begin
      writeln('NO');
      exit;
    end;
    for i:=1 to n do
      go(i);
    if e=0 then writeln('YES') else writeln('NO');
  end;
begin
  read(t);
  for i:=1 to t do
    check;
end.
